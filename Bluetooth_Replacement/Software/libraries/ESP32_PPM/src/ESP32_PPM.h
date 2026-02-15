#pragma once

#include <Arduino.h>
#include <stdint.h>
#include <Rcul.h>

#define CPPM_GEN_POS_MOD                    HIGH
#define CPPM_GEN_NEG_MOD                    LOW

#define DEFAULT_PPM_PERIOD_US               22500
#define DEFAULT_PPM_HEADER_US               300


void IRAM_ATTR rx_isr_thunk();

//=====================================================================
//=====================================================================
class ESP32_PPM : public Rcul
{
public:
  ESP32_PPM(void);
  // ───── PPM OUT (TX) ───────────────────────────────────────────────
  void begin(bool PpmModu = CPPM_GEN_NEG_MOD,
             uint8_t ChNb = 8,
             uint16_t PpmPeriod_us = DEFAULT_PPM_PERIOD_US,
             uint16_t PpmHeader_us = DEFAULT_PPM_HEADER_US,
             uint8_t tx_pin = 13);

  // ch attendu: 1..N (N <= MAX_PPM_CHANNELS_COUNT)
  void width_us(uint8_t Ch, uint16_t width_us);

  // fin de trame TX (strobe)
  uint8_t isSynchro(uint8_t SynchroClientIdx = 7); /* Default: 8th client */

  // ───── PPM IN (RX) ───────────────────────────────────────────────
  // risingEdge: true=RISING, false=FALLING
  // syncMinUs : gap > syncMinUs => nouvelle trame (souvent 3000..5000)
  void beginRx(uint8_t rx_pin,
               uint8_t chNb = 8,
               bool risingEdge = true,
               uint16_t syncMinUs = 3500,
               uint16_t minUs = 800,
               uint16_t maxUs = 2200);

  void endRx();

  // 1 fois par trame reçue, puis clear
  uint8_t  rxAvailable();

  // ch = 1..N
  uint16_t rxRead(uint8_t ch);

  // Debug helpers
  uint32_t rxIsrCount() const;
  uint32_t rxLastDtUs() const;

  // N (nombre de canaux RX configurés)
  uint8_t  rxChannels() const;

  /* Rcul support */
  virtual uint8_t  RculIsSynchro(uint8_t ClientIdx = RCUL_DEFAULT_CLIENT_IDX);
  virtual void     RculSetWidth_us(uint16_t Width_us, uint8_t Ch = 255);
  virtual uint16_t RculGetWidth_us(uint8_t Ch);

private:
  friend void rx_isr_thunk();
  // ISR RX (appelée via thunk global dans le .cpp)
  void _rx_isr();
};

extern ESP32_PPM Cppm32;
