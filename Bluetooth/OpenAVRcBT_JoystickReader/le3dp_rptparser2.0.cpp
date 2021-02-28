#include "le3dp_rptparser2.0.h"

JoystickReportParser::JoystickReportParser(JoystickEvents *evt, RCState *rcs) :
	joyEvents(evt) 
{
  joyEvents->rcState = rcs;
}

void JoystickReportParser::Parse(USBHID *hid, bool is_rpt_id, uint8_t len, uint8_t *buf)
{
	bool match = true;

	// Checking if there are changes in report since the method was last called
	for (uint8_t i=0; i<RPT_GAMEPAD_LEN; i++) {
		if( buf[i] != oldPad[i] ) {
			match = false;
			break;
		}
  }
  	// Calling Game Pad event handler
	if (!match && joyEvents) {
		joyEvents->OnGamePadChanged((const GamePadEventData*)buf);

		for (uint8_t i=0; i<RPT_GAMEPAD_LEN; i++) oldPad[i] = buf[i];
	}
 
}


//Joystick events below
//***********************************************************************************************************************
void JoystickEvents::OnGamePadChanged(const GamePadEventData *evt)
{ 
//  m_X_Val = map(evt->x, 0, 1023, 1000, 2000);
//  m_Y_Val = map(evt->y, 0, 1023, 1000, 2000);
  m_Hat_Val = evt->hat;
//  m_Twist_Val = map(evt->twist, 0, 255, 1000, 2000);
//  m_Slider_Val = map(evt->slider, 255, 0, 1000, 2000);
  m_Joy_Button = 0;
  m_Joy_Button = 1 + log(evt->buttons_a)/log(2);
  if (evt->buttons_b) m_Joy_Button = 9 + log(evt->buttons_b)/log(2);


  rcState->roll = map(evt->x, 0, 1023, rcState->MIN_VALUE, rcState->MAX_VALUE);
  rcState->pitch = map(evt->y, 0, 1023, rcState->MIN_VALUE, rcState->MAX_VALUE);
  rcState->throttle = map(evt->slider, 0, 255, rcState->MAX_VALUE,rcState->MIN_VALUE);
  rcState->yaw = map(evt->twist, 0, 255, rcState->MIN_VALUE, rcState->MAX_VALUE);
//  
  rcState->button_changed(m_Joy_Button);
  rcState->hat_tick();

}

/*
void JoystickEvents::PrintValues()
{
  Serial.print("X = ");
  Serial.print(m_X_Val);
  Serial.print("\t Y =   ");
  Serial.print(m_Y_Val);
  Serial.print("\t Hat = ");
  Serial.print(m_Hat_Val);
  Serial.print("\t Twist = ");
  Serial.print(m_Twist_Val);
  Serial.print("\t Slider = ");
  Serial.print(m_Slider_Val);
  Serial.print("\t Button = ");
  Serial.println(m_Joy_Button);
}

void JoystickEvents::GetValues (int &Xval, int &Yval, int &Hval, int &Tval, int &Sval, int &JBval)
{
//  Xval = m_X_Val;
//  Yval = m_Y_Val;
  Hval = m_Hat_Val;
//  Tval = m_Twist_Val;
//  Sval = m_Slider_Val;
  JBval = m_Joy_Button;
}
*/
void JoystickEvents::GetValues (int &Hval, int &JBval)
{
  Hval = m_Hat_Val;
  JBval = m_Joy_Button;
}
