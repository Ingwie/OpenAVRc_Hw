#if !defined(__HIDJOYSTICKRPTPARSER_H__)
#define __HIDJOYSTICKRPTPARSER_H__

#include <usbhid.h>
#include "RCState.h"

struct GamePadEventData
{
  union { //axes and hut switch
    uint32_t axes;
    struct {
      uint32_t x : 10;
      uint32_t y : 10;
      uint32_t hat : 4;
      uint32_t twist : 8;      
    };
  };
  uint8_t buttons_a;
  uint8_t slider;
  uint8_t buttons_b;
};

class JoystickEvents
{
  private:
//    int m_X_Val = 0;      // 0 - 1023
//    int m_Y_Val = 0;      // 0 - 1023
    int m_Hat_Val = 0;    // 0 - 15
//    int m_Twist_Val = 0;  // 0 - 255
//    int m_Slider_Val = 0; // 0 - 255
    int m_Joy_Button = 0; // 0 - 12 (0 if no button, 1-12 for other buttons)   
    
  public:
    RCState *rcState;
	  virtual void OnGamePadChanged(const GamePadEventData *evt);                                     //Map data every event
    //virtual void PrintValues();                                                                     //Prints joystick values
    //virtual void GetValues (int &Xval, int &Yval, int &Hval, int &Tval, int &Sval, int &JBval);     //Returns joystick values to user
    virtual void GetValues (int &Hval, int &JBval);
};

#define RPT_GAMEPAD_LEN	sizeof(GamePadEventData)/sizeof(uint8_t)

class JoystickReportParser : public HIDReportParser
{
	JoystickEvents		*joyEvents;

  uint8_t oldPad[RPT_GAMEPAD_LEN];
  uint16_t oldButtons;
  
public:
	JoystickReportParser(JoystickEvents *evt, RCState *rcs);

	virtual void Parse(USBHID *hid, bool is_rpt_id, uint8_t len, uint8_t *buf);
};


#endif // __HIDJOYSTICKRPTPARSER_H__
