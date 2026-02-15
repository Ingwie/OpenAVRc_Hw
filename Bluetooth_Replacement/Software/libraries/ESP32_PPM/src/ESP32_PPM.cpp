#include "ESP32_PPM.h"

#define MAX_PPM_CHANNELS_COUNT 8

static hw_timer_t *timer = NULL;
static portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;

ESP32_PPM Cppm32 = ESP32_PPM();

//=====================================================================
//=====================================================================
ESP32_PPM::ESP32_PPM(void)
{
}

// ───────────────────────────────────────────────────────────────────
// TX (PPM OUT) globals (comme ton code)
// ───────────────────────────────────────────────────────────────────
static uint8_t  _tx_pin;
static uint8_t  _ChNb;
static int      _PPMFrameLengthUS;

static uint16_t _PpmModu;
static uint16_t _PpmHeader_us;

static volatile uint8_t _Synchro = 0;

static uint16_t outChannelValues[MAX_PPM_CHANNELS_COUNT];
static uint16_t channelValues[MAX_PPM_CHANNELS_COUNT];

//=====================================================================
//=====================================================================
enum ppmState_e
{
  PPM_STATE_PULSE,
  PPM_STATE_FILL,
  PPM_STATE_SYNC,
  PPM_STATE_FAILSAFE
};

// ───────────────────────────────────────────────────────────────────
// RX (PPM IN) globals (nouveau, compatible classic/S3/C3)
// ───────────────────────────────────────────────────────────────────
static portMUX_TYPE rxMux = portMUX_INITIALIZER_UNLOCKED;

static volatile uint8_t  _rx_pin         = 255;
static volatile uint8_t  _rx_chNb        = 0;
static volatile uint16_t _rx_syncMinUs   = 3500; // gap > syncMin => nouvelle trame
static volatile uint16_t _rx_minUs       = 800;
static volatile uint16_t _rx_maxUs       = 2200;

static volatile uint32_t _rx_lastEdgeUs  = 0;
static volatile uint8_t  _rx_idx         = 0;
static volatile uint8_t  _rx_frameAvail  = 0;

static volatile uint16_t _rx_work[MAX_PPM_CHANNELS_COUNT];
static uint16_t          _rx_stable[MAX_PPM_CHANNELS_COUNT];

static ESP32_PPM* s_rx_inst = nullptr;
static volatile uint32_t s_rx_isr_count = 0;
static volatile uint32_t s_rx_last_dt_us = 0;

//=====================================================================
// RX ISR thunk
//=====================================================================
void IRAM_ATTR rx_isr_thunk()
{
  if (s_rx_inst) s_rx_inst->_rx_isr();
}

//=====================================================================
// RX ISR body (membre)
//=====================================================================
void IRAM_ATTR ESP32_PPM::_rx_isr()
{
  s_rx_isr_count++;

  const uint32_t now = (uint32_t)micros();
  const uint32_t dt  = now - _rx_lastEdgeUs;
  
  s_rx_last_dt_us = dt;
_rx_lastEdgeUs = now;

  // Sync gap => commit frame
  if (dt >= _rx_syncMinUs)
  {
    portENTER_CRITICAL_ISR(&rxMux);

    if (_rx_idx > 0)
    {
      uint8_t n = _rx_idx;
      if (n > _rx_chNb) n = _rx_chNb;

      for (uint8_t i = 0; i < n; i++)
        _rx_stable[i] = _rx_work[i];

      _rx_frameAvail = 1;
    }

    _rx_idx = 0;
    portEXIT_CRITICAL_ISR(&rxMux);
    return;
  }

  // Channel value = dt between edges (clamp)
  uint16_t v = (dt > 0xFFFFu) ? 0xFFFFu : (uint16_t)dt;
  if (v < _rx_minUs) v = _rx_minUs;
  if (v > _rx_maxUs) v = _rx_maxUs;

  if (_rx_idx < _rx_chNb)
  {
    _rx_work[_rx_idx] = v;
    _rx_idx++;
  }
}

//=====================================================================
//=====================================================================
// TX timer ISR (PPM OUT)
//=====================================================================
void IRAM_ATTR onTimerISR()
{
  static volatile uint8_t  ppmState = PPM_STATE_PULSE;
  static volatile uint8_t  ppmChannelIndex = 0;
  static volatile int      usedFrameLengthUS = 0;

  // ISR-safe critical
  portENTER_CRITICAL_ISR(&timerMux);

  switch (ppmState)
  {
    case PPM_STATE_PULSE:
      digitalWrite(_tx_pin, !_PpmModu);
      timerAlarm(timer, _PpmHeader_us, true, 0);
      ppmState = PPM_STATE_FILL;
      break;

    case PPM_STATE_FILL:
    {
      digitalWrite(_tx_pin, _PpmModu);
      ppmState = PPM_STATE_PULSE;

      if (ppmChannelIndex >= _ChNb)
      {
        // Fin de trame => sync restante
        int remaining = _PPMFrameLengthUS - usedFrameLengthUS;

        // Sécurité : sync minimum (sinon underflow => grosse pause)
        if (remaining < 3000) remaining = 3000;

        timerAlarm(timer, (uint32_t)remaining, true, 0);

        ppmChannelIndex = 0;
        usedFrameLengthUS = 0;
        _Synchro = 0xFF;
      }
      else
      {
        uint16_t currentChannelValue = outChannelValues[ppmChannelIndex];

        // Sécurité : currentChannelValue doit être > header
        if (currentChannelValue < (_PpmHeader_us + 100))
          currentChannelValue = _PpmHeader_us + 100;

        timerAlarm(timer, (uint32_t)(currentChannelValue - _PpmHeader_us), true, 0);
        usedFrameLengthUS += currentChannelValue;
        ppmChannelIndex++;
      }
      break;
    }
  }

  portEXIT_CRITICAL_ISR(&timerMux);
}

//=====================================================================
//=====================================================================
// TX begin (PPM OUT)
//=====================================================================
void ESP32_PPM::begin(bool PpmModu, uint8_t ChNb, uint16_t PpmPeriod_us,
                     uint16_t PpmHeader_us, uint8_t tx_pin)
{
  _tx_pin = tx_pin;

  if (ChNb < 1) ChNb = 1;
  if (ChNb > MAX_PPM_CHANNELS_COUNT) ChNb = MAX_PPM_CHANNELS_COUNT;
  _ChNb = ChNb;

  _PpmModu = (uint16_t)PpmModu;
  _PpmHeader_us = PpmHeader_us;
  _PPMFrameLengthUS = (int)PpmPeriod_us;
  _Synchro = 0;

  for (int i = 0; i < MAX_PPM_CHANNELS_COUNT; i++)
  {
    outChannelValues[i] = 1500;
    channelValues[i] = 1500;
  }

  pinMode(_tx_pin, OUTPUT);

  // Idle = _PpmModu (impulsion = !modu)
  digitalWrite(_tx_pin, _PpmModu ? HIGH : LOW);

  timer = timerBegin(1000000);              // 1 tick = 1 µs
  timerAttachInterrupt(timer, &onTimerISR);
  timerAlarm(timer, 12000, true, 0);        // start
}

//=====================================================================
//=====================================================================
// TX set channel width (PPM OUT)
// ch attendu: 1..MAX
//=====================================================================
void ESP32_PPM::width_us(uint8_t Ch, uint16_t width_us)
{
  if (Ch < 1 || Ch > MAX_PPM_CHANNELS_COUNT) return;
  uint8_t idx = (uint8_t)(Ch - 1);

  uint16_t v = (uint16_t)constrain(width_us, 1000, 2000);

  // Protège contre accès concurrent ISR
  portENTER_CRITICAL(&timerMux);
  channelValues[idx] = v;
  outChannelValues[idx] = v;
  portEXIT_CRITICAL(&timerMux);
}

//=====================================================================
//=====================================================================
// TX synchro flag (fin de trame)
//=====================================================================
uint8_t ESP32_PPM::isSynchro(uint8_t SynchroClientIdx /*= 7*/)
{
  uint8_t Ret;

  Ret = !!(_Synchro & RCUL_CLIENT_MASK(SynchroClientIdx));
  if (Ret) _Synchro &= ~RCUL_CLIENT_MASK(SynchroClientIdx); /* Clear indicator */

  return Ret;
}

//=====================================================================
// RX begin (PPM IN)
//=====================================================================
void ESP32_PPM::beginRx(uint8_t rx_pin, uint8_t chNb, bool risingEdge,
                        uint16_t syncMinUs, uint16_t minUs, uint16_t maxUs)
{
  if (chNb < 1) chNb = 1;
  if (chNb > MAX_PPM_CHANNELS_COUNT) chNb = MAX_PPM_CHANNELS_COUNT;

  portENTER_CRITICAL(&rxMux);

  _rx_pin       = rx_pin;
  _rx_chNb      = chNb;
  _rx_syncMinUs = syncMinUs;
  _rx_minUs     = minUs;
  _rx_maxUs     = maxUs;

  _rx_lastEdgeUs = (uint32_t)micros();
  _rx_idx        = 0;
  _rx_frameAvail = 0;

  for (uint8_t i = 0; i < MAX_PPM_CHANNELS_COUNT; i++) {
    _rx_work[i]   = 1500;
    _rx_stable[i] = 1500;
  }

  portEXIT_CRITICAL(&rxMux);

  s_rx_inst = this;

  pinMode(_rx_pin, INPUT);

  detachInterrupt(digitalPinToInterrupt(_rx_pin));
  attachInterrupt(digitalPinToInterrupt(_rx_pin), ::rx_isr_thunk, risingEdge ? RISING : FALLING);
}

//=====================================================================
// RX end
//=====================================================================
void ESP32_PPM::endRx()
{
  if (_rx_pin != 255) detachInterrupt(digitalPinToInterrupt(_rx_pin));

  portENTER_CRITICAL(&rxMux);
  _rx_pin = 255;
  _rx_chNb = 0;
  _rx_frameAvail = 0;
  _rx_idx = 0;
  portEXIT_CRITICAL(&rxMux);

  s_rx_inst = nullptr;
}

//=====================================================================
// RX available (1 fois par trame)
//=====================================================================
uint8_t ESP32_PPM::rxAvailable()
{
  uint8_t r;
  portENTER_CRITICAL(&rxMux);
  r = _rx_frameAvail;
  _rx_frameAvail = 0;
  portEXIT_CRITICAL(&rxMux);
  return r;
}

//=====================================================================
// RX read channel (ch = 1..N)
//=====================================================================
uint16_t ESP32_PPM::rxRead(uint8_t ch)
{
  if (ch < 1 || ch > _rx_chNb) return 1500;
  return _rx_stable[ch - 1];
}

uint8_t ESP32_PPM::rxChannels() const
{
  return _rx_chNb;
}

/* Begin of Rcul support */
uint8_t ESP32_PPM::RculIsSynchro(uint8_t ClientIdx /*= RCUL_DEFAULT_CLIENT_IDX*/)
{
  return isSynchro(ClientIdx);
}

void ESP32_PPM::RculSetWidth_us(uint16_t Width_us, uint8_t Ch /*= 255*/)
{
  this->width_us(Ch, Width_us);
}

uint16_t ESP32_PPM::RculGetWidth_us(uint8_t Ch)
{
  (void)Ch;
  return 0;
}
/* End of Rcul support */


uint32_t ESP32_PPM::rxIsrCount() const { return (uint32_t)s_rx_isr_count; }
uint32_t ESP32_PPM::rxLastDtUs() const { return (uint32_t)s_rx_last_dt_us; }
