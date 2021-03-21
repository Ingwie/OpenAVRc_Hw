#ifndef _LCDDISPLAY_h
#define _LCDDISPLAY_h

#if defined(ARDUINO) && ARDUINO >= 100
	#include "arduino.h"
#else
	#include "WProgram.h"
#endif

#include "RCState.h"
#include <LiquidCrystal_I2C.h>

//Pins A4-SDA, A5-SCL
LiquidCrystal_I2C	oled(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);

class LCDDisplay {
public:
	void setup() {
		oled.setBacklightPin(3, POSITIVE);
		oled.setBacklight(HIGH); // NOTE: You can turn the backlight off by setting it to LOW instead of HIGH
		oled.begin(20, 4);
		oled.clear();
		oled.setCursor(3, 0);
		oled.print("Joystick  PPM");
		oled.setCursor(1, 2);
		oled.print("**OpenAVRc  Team**");
	}

	void display_oerr() {
		oled.clear();
		oled.setCursor(0, 0);
		oled.print("OSC not started");
	}

	void display_herr() {
		oled.clear();
		oled.setCursor(0, 0);
		oled.print("HID set error");
	}

	void display_joystick_connected() {
		oled.clear();
		oled.setCursor(6, 1);
		oled.print("Joystick");
		oled.setCursor(6, 2);
		oled.print("Connected");
	}

	void clear() {
		oled.clear();
	}

	void display_joystick_disconnected() {
		oled.clear();
		oled.setCursor(6, 1);
		oled.print("Joystick");
		oled.setCursor(4, 2);
		oled.print("Disconnected");
	}

	void display(int flight_mode, int channel5_mode, byte camera_mode, bool camera_auto_center) {
		oled.clear();
		oled.setCursor(0, 0);
		
		oled.print("Mode:");
		oled.print(flight_mode);

    if (channel5_mode<1000)
    {
      oled.setCursor(13, 0);
    }
    else
    {
      oled.setCursor(12, 0);
    }
		oled.print("CH5:");
		oled.print(channel5_mode);

		oled.setCursor(0, 1);
		oled.print("CMode:");
		oled.print(camera_mode);

		oled.setCursor(17, 1);
		if (camera_auto_center) {
			oled.print("CEN");
		}

		//display_rc(flight_mode, channel5, camera_mode, camera_auto_center);


	}

	void write_mode(RCState *rcs) {
		oled.setCursor(0, 2);
		oled.print("M");
		oled.print(rcs->flight_mode);
	}

	void write_ch5_simple_mode(RCState *rcs) {
		oled.setCursor(3, 2);
		if (rcs->channel5_mode == 1000) {
			oled.print("+");
		}
		else {
			oled.print("o");
		}
	}

	void write_camera_mode(RCState *rcs) {
		oled.setCursor(5, 2);
		switch (rcs->camera_mode) {
		case CAMERA_MODES::exponent:
			oled.print("*");
			break;
		case CAMERA_MODES::slow:
			oled.print("#");
			break;
		case CAMERA_MODES::max_min:
			oled.print((char)B11011011);
			break;
		}

		if (rcs->auto_center) {
			oled.print("+");
		}
		else {
			oled.print((char)B11110011);
		}
	}

	void write_number_value(int value,RCState *rcs) {
		auto mapped_value = map(value, rcs->MIN_VALUE, rcs->MAX_VALUE, -99, +99);
		if (mapped_value >= 0) {
			oled.print(" ");
		}
		if (mapped_value < 10 && mapped_value> -10) {
			oled.print(" ");
		}
		oled.print(mapped_value);
	}

	void write_unsigned_number_value(int value, RCState *rcs) {
		auto mapped_value = map(value, rcs->MIN_VALUE, rcs->MAX_VALUE, 0, +99);
		if (mapped_value >= 0) {
			oled.print(" ");
		}
		if (mapped_value < 10 && mapped_value> -10) {
			oled.print(" ");
		}
		oled.print(mapped_value);
	}

	void write_camera_values(RCState *rcs) {
		oled.setCursor(8, 2);
		write_number_value(rcs->camera_yaw, rcs);

		oled.setCursor(12, 2);

		write_number_value(rcs->camera_pitch, rcs);
	}


	void print_all(RCState *rcs) {
		//oled.clear();
		oled.setCursor(0, 2);

		write_mode(rcs);

		write_ch5_simple_mode(rcs);

		write_camera_mode(rcs);
		write_camera_values(rcs);

		oled.setCursor(0, 3);
		write_number_value(rcs->elevator, rcs);

		oled.setCursor(3, 3);
		write_number_value(rcs->aileron,rcs);

		oled.setCursor(7, 3);
		write_unsigned_number_value(rcs->throttle,rcs);

		oled.setCursor(11, 3);
		write_number_value(rcs->rudder,rcs);

		
	}

	void loop() {

	}
/*
	void displayPercentage(uint8_t char_id, uint8_t value) {
		byte char_remainder[3] = {
			0b00100,
			0b01110,
			0b11111
		};

		const int options = 24;
		const int rows = 8;
		const int cols = 3;

		auto mapped_value = map(value, 0, 100, 0, 24);
		auto row = mapped_value / 3;
		auto col = mapped_value % 3;

		byte char_value[8] = {0};
		for (auto i = 8; i > row; i--) {
			char_value[i] = 0b11111;
		}
		char_value[row] = char_remainder[col];
		oled.createChar(char_id, char_value);
	}

	void display_rx_rssi(uint8_t value) {
		oled.setCursor(14, 1);

		if (value == 255) {
			oled.print("x");
		}
		else {
			displayPercentage(0, value);
			oled.print((char)0);
		}
	}

	void display_tx_rssi(uint8_t value) {
		oled.setCursor(15, 1);

		if (value == 255) {
			oled.print("x");
		}
		else {
			displayPercentage(1, value);
			oled.print((char)1);
		}
	}
*/

};

#endif
