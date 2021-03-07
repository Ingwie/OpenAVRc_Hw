#include "RCState.h"
#include <EEPROM.h>

void RCState::init()
{
	pitch = CENTER_VALUE;
	yaw = CENTER_VALUE;
	roll = CENTER_VALUE;

	throttle = FAIL_SAFE_VALUE;
 
  channel5_mode = FAIL_SAFE_VALUE;
	flight_mode = FAIL_SAFE_VALUE;
  
	//auto_center = false;

	camera_pitch = CENTER_VALUE;
	camera_yaw = CENTER_VALUE;

  RCState::readEEPROM();

}

void RCState::readEEPROM()
{
  //camera mode
  cam_mode = EEPROM.read(0);
  switch (cam_mode) {
    case 0: camera_mode = CAMERA_MODES::exponent;break;
    case 1: camera_mode = CAMERA_MODES::slow;break;
    case 2: camera_mode = CAMERA_MODES::max_min;break;
  }
  auto_center = (EEPROM.read(1)==0?false:true);
//  channel5    = (EEPROM.read(2)==0?false:true);
}

void RCState::writeEEPROMdefault()
{
  EEPROM.put(0,0);//camera mode (default exponent)
  EEPROM.put(1,0);//auto center camera on/off (default off)
  //EEPROM.put(2,0);//channel5 minimum val
}

void RCState::data_updated() {
	if (is_connected == false) {
		throttle = FAIL_SAFE_VALUE;
	}

#if 0
	if (update_iteration > 0) {
		update_iteration = 0;
		hat_tick();
		Serial.print("pitch ");
		Serial.print(pitch);
		Serial.print(" roll ");
		Serial.print(roll);
		Serial.print(" yaw ");
		Serial.print(yaw);
		Serial.print(" throttle ");
		Serial.print(throttle);
		Serial.print(" flight mode ");
		Serial.print((int)flight_mode);
		Serial.print(" channel5 ");
		Serial.print(channel5);
		Serial.print(" camera_mode ");
		Serial.print((int)camera_mode);
		Serial.print(" auto-center ");
		Serial.print(auto_center);
		Serial.print(" camera yaw ");
		Serial.print(camera_yaw);
		Serial.print(" camera pitch ");
		Serial.print(camera_pitch);
		Serial.println("");
	}
	else {
		update_iteration++;
	}
#endif
}

void RCState::button_changed(uint8_t but_id) {
	if ((button_state_change_time[but_id] > 100) && (button_state[but_id] == false)) {
		switch (but_id) {
  		case 2: break;//FAILSAFE On/Off
     
  		//channel 5
    	case 8: channel5_mode = 1000; break;
  		case 10: channel5_mode = 1500; break;
  		case 12: channel5_mode = 2000; break;
     //channel 6
  		case 7: flight_mode = 1000; break;
  		case 9: flight_mode = 1500; break;
  		case 11: flight_mode = 2000; break;

      //channel 7&8
  		case 1: camera_yaw = CENTER_VALUE;camera_pitch = CENTER_VALUE;break;
  		case 6: auto_center = !auto_center;break;
  		case 5: camera_mode = CAMERA_MODES::exponent; break;//0
  		case 3: camera_mode = CAMERA_MODES::max_min; break;//2
  		case 4: camera_mode = CAMERA_MODES::slow; break;//1
		}

	}
//  Serial.print("Button is: ");Serial.print(but_id);
//  Serial.print(" Fly Mode is: ");Serial.print(flight_mode);
//  Serial.print(" Camera Mode is: ");Serial.println((uint8_t)camera_mode);
}

void RCState::hat_changed(HAT_POSITION current_hat_position) {
	//Serial.println("hat_changed");
 
	if ((hat_position == HAT_POSITION::Down || hat_position == HAT_POSITION::DownLeft || hat_position == HAT_POSITION::DownRight) ||
		(hat_position == HAT_POSITION::Up || hat_position == HAT_POSITION::UpLeft || hat_position == HAT_POSITION::UpRight)) {
		up_down_changed = millis();
		//Serial.println("hat_changed up/down");
	}

	if ((hat_position == HAT_POSITION::Left|| hat_position == HAT_POSITION::DownLeft || hat_position == HAT_POSITION::UpLeft) ||
		(hat_position == HAT_POSITION::Right || hat_position == HAT_POSITION::DownRight|| hat_position == HAT_POSITION::DownLeft)) {
		left_right_changed = millis();
		//Serial.println("hat_changed left/right");
	}

	if (hat_position == HAT_POSITION::Center) {
		//Serial.println("hat_changed center");
		up_down_changed = 0;
		left_right_changed = 0;
	}

	hat_position = current_hat_position;
}

void RCState::hat_tick() {
	//Serial.println("hat_tick");
	/*if (!auto_center && (up_down_changed == 0 || left_right_changed == 0)) {
		return;
	}*/

	bool move_left = (hat_position == HAT_POSITION::Left || hat_position == HAT_POSITION::DownLeft || hat_position == HAT_POSITION::UpLeft) ? true : false;
	bool move_right = (hat_position == HAT_POSITION::Right || hat_position == HAT_POSITION::DownRight || hat_position == HAT_POSITION::UpRight) ? true : false;
	
	bool move_up = (hat_position == HAT_POSITION::Up|| hat_position == HAT_POSITION::UpLeft || hat_position == HAT_POSITION::UpRight) ? true : false;
	bool move_down = (hat_position == HAT_POSITION::Down || hat_position == HAT_POSITION::DownLeft || hat_position == HAT_POSITION::DownRight) ? true : false;

	/*Serial.print("hat tick left: ");
	Serial.print(move_left);
	Serial.print(" right: ");
	Serial.print(move_right);
	Serial.print(" up: ");
	Serial.print(move_up);
	Serial.print(" down: ");
	Serial.print(move_down);
	Serial.println("");*/

	/*Serial.print("Mode: ");
	Serial.print((int)camera_mode);

	Serial.print(" Current camera pitch: ");
	Serial.print(camera_pitch);
	Serial.print(" Yaw: ");
	Serial.print(camera_yaw);

	Serial.print(" Step size: ");
	Serial.print((millis() - up_down_changed) / TIME_STEP_DIVIDER);

	Serial.println("");*/
	
	//Serial.println((int)camera_mode);
	switch (camera_mode) {
	case CAMERA_MODES::exponent://0
    //Serial.println("0");
		//if up, add exponent from millis
		if (move_up) { camera_pitch += (millis() - up_down_changed) / TIME_STEP_DIVIDER; if (camera_pitch > MAX_VALUE) { camera_pitch = MAX_VALUE; } }
		//if down, substract exponent from millis
		if (move_down) { camera_pitch -= (millis() - up_down_changed) / TIME_STEP_DIVIDER; if (camera_pitch < MIN_VALUE) { camera_pitch = MIN_VALUE; } }
		//if left, substract exponen from millis
		if (move_left) { camera_yaw-= (millis() - left_right_changed) / TIME_STEP_DIVIDER; if (camera_yaw < MIN_VALUE) { camera_yaw = MIN_VALUE; } }
		//if right, add exponent from millis
		if (move_right) { camera_yaw += (millis() - left_right_changed) / TIME_STEP_DIVIDER; if (camera_yaw > MAX_VALUE) { camera_yaw = MAX_VALUE; } }
		//if none, aim toward center from millis on both
    //Serial.println(camera_pitch);
		if (auto_center) {

			if (!move_up && !move_down) {
				if (camera_pitch > CENTER_VALUE) { camera_pitch -= abs(camera_pitch - CENTER_VALUE) / 4; }
				if (camera_pitch < CENTER_VALUE) { camera_pitch += abs(camera_pitch - CENTER_VALUE) / 4;}
			}

			if (!move_left && !move_right) {
				if (camera_yaw > CENTER_VALUE) { camera_yaw -= abs(camera_yaw - CENTER_VALUE) / 4; }
				if (camera_yaw < CENTER_VALUE) { camera_yaw += abs(camera_yaw - CENTER_VALUE) / 4; }
			}
		}
		break;
	case CAMERA_MODES::max_min://2
		//if up, set to max_value
		if (move_up) { camera_pitch = MAX_VALUE; }
		//if down, set to min_value
		if (move_down) { camera_pitch = MIN_VALUE; }
		//if left, set to min_value
		if (move_left) { camera_yaw = MIN_VALUE; }
		//if right, set to max_value
		if (move_right) { camera_yaw = MAX_VALUE; }
		//if none, set to center both

		if (auto_center) {

			if (!move_up && !move_down) { camera_pitch = CENTER_VALUE; }
			if (!move_left && !move_right) { camera_yaw = CENTER_VALUE; }
		}
		break;
	case CAMERA_MODES::slow://1
		//if up, add exponent from constant
		if (move_up) { camera_pitch += SLOW_INCREMENT; if (camera_pitch > MAX_VALUE) { camera_pitch = MAX_VALUE; } }
		//if down, substract exponent from constant
		if (move_down) { camera_pitch -= SLOW_INCREMENT; if (camera_pitch < MIN_VALUE) { camera_pitch = MIN_VALUE; } }
		//if left, substract exponen from constant
		if (move_left) { camera_yaw -= SLOW_INCREMENT; if (camera_yaw < MIN_VALUE) { camera_yaw = MIN_VALUE; } }
		//if right, add exponent from constant
		if (move_right) { camera_yaw += SLOW_INCREMENT; if (camera_yaw > MAX_VALUE) { camera_yaw = MAX_VALUE; } }
		//if none, aim toward center from constant on both

		if (auto_center) {
			if (!move_up && !move_down) {
				if (camera_pitch > CENTER_VALUE) { camera_pitch -= SLOW_INCREMENT; }
				if (camera_pitch < CENTER_VALUE) { camera_pitch += SLOW_INCREMENT; }
			}

			if (!move_left && !move_right) {
				if (camera_yaw > CENTER_VALUE) { camera_yaw -= SLOW_INCREMENT; }
				if (camera_yaw < CENTER_VALUE) { camera_yaw += SLOW_INCREMENT; }
			}
		}
		break;
	}

	/*Serial.print("new camera pitch ");
	Serial.print(camera_pitch);
	Serial.print(" yaw ");
	Serial.print(camera_yaw);
	Serial.println("");*/
}

void RCState::OnButtonUp(uint8_t but_id) {
  button_state[but_id] = false;
  button_state_change_time[but_id] = abs(abs(millis()) - abs(button_state_changed[but_id]));
  button_state_changed[but_id] = millis();
  button_changed(but_id);
  if (but_id != 0)
  {
//    Serial.print("Up: ");
//    Serial.println(but_id, DEC);    
  }

}

void RCState::OnButtonDn(uint8_t but_id) {
  button_state[but_id] = true;
  button_state_change_time[but_id] = abs(abs(millis()) - abs(button_state_changed[but_id]));
  button_state_changed[but_id] = millis();
  button_changed(but_id);

  if (but_id != 0)
  {
//    Serial.print("Dn: ");
//    Serial.println(but_id, DEC);    
  }
}
