#ifndef _RCSTATE_h
#define _RCSTATE_h

#if defined(ARDUINO) && ARDUINO >= 100
#include "arduino.h"
#else
#include "WProgram.h"
#endif

#define MAX_BUTTONS 12

enum class CAMERA_MODES
{
  exponent=0,
  slow=1,
  max_min=2
};

enum class HAT_POSITION
{
	Center = 8,
	Up = 0,
	UpRight = 1,
	Right = 2,
	DownRight = 3,
	Down = 4,
	DownLeft = 5,
	Left = 6,
	UpLeft = 7
};

class RCState
{
  private:
	int update_iteration;

  public:
	const int MAX_VALUE = 2000;
	const int MIN_VALUE = 1000;
	const int FAIL_SAFE_VALUE = 950;
	const int TIME_STEP_DIVIDER = 10000;
	const int SLOW_INCREMENT = 1;

	const int CENTER_VALUE = ((MAX_VALUE - MIN_VALUE) / 2) + MIN_VALUE;

	void init();

  void readEEPROM();
  void writeEEPROM();  

	void data_updated();
	void button_changed(uint8_t but_id);
	void hat_changed(HAT_POSITION hat_position);
	void hat_tick();
  void OnButtonUp(uint8_t but_id);
  void OnButtonDn(uint8_t but_id);
  
	bool is_connected;

	int pitch;	//RC pitch
	int roll;	 //RC roll
	int throttle; //throttle (should be reversed)
	int yaw;	  //RC yaw

	bool channel5; //toggle on button 2

	byte flight_mode_code;
	int flight_mode; //divide (MAX_VALUE - MIN_VALUE) / 6 - for 6 buttons

	HAT_POSITION hat_position; //hat button position
	unsigned long up_down_changed;
	unsigned long up_down_change_time;
	unsigned long left_right_changed;
	unsigned long left_right_change_time;

	bool button_state[MAX_BUTTONS];
	unsigned long button_state_changed[MAX_BUTTONS];
	unsigned long button_state_change_time[MAX_BUTTONS];

	CAMERA_MODES camera_mode; //which camera mode to apply on camera yaw and pitch for each hat joystick action
  uint8_t cam_mode;
	bool auto_center;		  //should the camera return to center as soon as the sticks are left alone
	int camera_yaw;			  //rotate camera left and right
	int camera_pitch;		  //rotate camera up and down
};

#endif
