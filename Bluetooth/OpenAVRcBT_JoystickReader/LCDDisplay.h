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
LiquidCrystal_I2C	biglcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);

class LCDDisplay {
public:
	void setup() {
		biglcd.setBacklightPin(3, POSITIVE);
		biglcd.setBacklight(HIGH); // NOTE: You can turn the backlight off by setting it to LOW instead of HIGH
		biglcd.begin(20, 4);
		biglcd.clear();
		biglcd.setCursor(0, 0);
		biglcd.print("Joystick PPM");
		biglcd.setCursor(0, 1);
		biglcd.print("Dror Gluska");
	}

	void display_oerr() {
		biglcd.clear();
		biglcd.setCursor(0, 0);
		biglcd.print("OSC not started");
	}

	void display_herr() {
		biglcd.clear();
		biglcd.setCursor(0, 0);
		biglcd.print("HID set error");
	}

	void display_joystick_connected() {
		biglcd.clear();
		biglcd.setCursor(0, 0);
		biglcd.print("Joystick");
		biglcd.setCursor(0, 1);
		biglcd.print("Connected");
	}

	void clear() {
		biglcd.clear();
	}

	void display_joystick_disconnected() {
		biglcd.clear();
		biglcd.setCursor(0, 0);
		biglcd.print("Joystick");
		biglcd.setCursor(0, 1);
		biglcd.print("Disconnected");
	}

	void display(byte flight_mode, bool channel5, byte camera_mode, bool camera_auto_center) {
		/*biglcd.clear();
		biglcd.setCursor(0, 0);*/
		
		//biglcd.print("M");
		//biglcd.print(flight_mode);

		//biglcd.setCursor(3, 0);
		//biglcd.print("CH5");
		//biglcd.print(channel5);

		//biglcd.setCursor(8, 0);
		//biglcd.print("CM");
		//biglcd.print(camera_mode);

		//biglcd.setCursor(12, 0);
		//if (camera_auto_center) {
		//	biglcd.print("CEN");
		//}

		//display_rc(flight_mode, channel5, camera_mode, camera_auto_center);


	}

	void write_mode(RCState *rcs) {
		biglcd.setCursor(0, 0);
		biglcd.print("M");
		biglcd.print(rcs->flight_mode_code);
	}

	void write_ch5_simple_mode(RCState *rcs) {
		biglcd.setCursor(3, 0);
		if (rcs->channel5 == 0) {
			biglcd.print("+");
		}
		else {
			biglcd.print("o");
		}
	}

	void write_camera_mode(RCState *rcs) {
		biglcd.setCursor(5, 0);
		switch (rcs->camera_mode) {
		case CAMERA_MODES::exponent:
			biglcd.print("*");
			break;
		case CAMERA_MODES::slow:
			biglcd.print("#");
			break;
		case CAMERA_MODES::max_min:
			biglcd.print((char)B11011011);
			break;
		}

		if (rcs->auto_center) {
			biglcd.print("+");
		}
		else {
			biglcd.print((char)B11110011);
		}
	}

	void write_number_value(int value,RCState *rcs) {
		auto mapped_value = map(value, rcs->MIN_VALUE, rcs->MAX_VALUE, -99, +99);
		if (mapped_value >= 0) {
			biglcd.print(" ");
		}
		if (mapped_value < 10 && mapped_value> -10) {
			biglcd.print(" ");
		}
		biglcd.print(mapped_value);
	}

	void write_unsigned_number_value(int value, RCState *rcs) {
		auto mapped_value = map(value, rcs->MIN_VALUE, rcs->MAX_VALUE, 0, +99);
		if (mapped_value >= 0) {
			biglcd.print(" ");
		}
		if (mapped_value < 10 && mapped_value> -10) {
			biglcd.print(" ");
		}
		biglcd.print(mapped_value);
	}

	void write_camera_values(RCState *rcs) {
		biglcd.setCursor(8, 0);
		write_number_value(rcs->camera_yaw, rcs);

		biglcd.setCursor(12, 0);

		write_number_value(rcs->camera_pitch, rcs);
	}


	void print_all(RCState *rcs) {
		//biglcd.clear();
		biglcd.setCursor(0, 0);

		write_mode(rcs);

		write_ch5_simple_mode(rcs);

		write_camera_mode(rcs);
		write_camera_values(rcs);

		biglcd.setCursor(0, 1);
		write_number_value(rcs->pitch, rcs);

		biglcd.setCursor(3, 1);
		write_number_value(rcs->roll,rcs);

		biglcd.setCursor(7, 1);
		write_unsigned_number_value(rcs->throttle,rcs);

		biglcd.setCursor(11, 1);
		write_number_value(rcs->yaw,rcs);

		
	}

	void loop() {

	}

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
		biglcd.createChar(char_id, char_value);
	}

	void display_rx_rssi(uint8_t value) {
		biglcd.setCursor(14, 1);

		if (value == 255) {
			biglcd.print("x");
		}
		else {
			displayPercentage(0, value);
			biglcd.print((char)0);
		}
	}

	void display_tx_rssi(uint8_t value) {
		biglcd.setCursor(15, 1);

		if (value == 255) {
			biglcd.print("x");
		}
		else {
			displayPercentage(1, value);
			biglcd.print((char)1);
		}
	}


};

#endif
