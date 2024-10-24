#ifndef _SSD1306DISPLAY_h
#define _SSD1306DISPLAY_h

#if defined(ARDUINO) && ARDUINO >= 100
  #include "arduino.h"
#else
  #include "WProgram.h"
#endif

#include "ssd1306.h"
#include "nano_gfx.h"
#include "ssd1306_hal/io.h"
#include <stdint.h>

#include "RCState.h"

char cstr[4];

const uint8_t Sova [] PROGMEM = {
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06,
0x0A, 0x05, 0x0D, 0x01, 0x01, 0x03, 0x87, 0xFE, 0xFE, 0xFC, 0xF8, 0xF0, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x0E,
0x08, 0x0C, 0x0C, 0x0C, 0x0E, 0x0F, 0x0F, 0x07, 0x07, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xE0, 0x30,
0x98, 0xDE, 0xE6, 0xE7, 0xF7, 0xD7, 0xD6, 0x56, 0x56, 0xD7, 0xD7, 0x5F, 0xDF, 0x3F, 0x3F, 0x2F,
0x9F, 0xD7, 0xDF, 0x6F, 0x6B, 0x6B, 0x7F, 0xF7, 0xF3, 0xF3, 0xE0, 0xEC, 0x98, 0x30, 0xE0, 0x80,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x60, 0x70, 0x70, 0x60,
0x40, 0x60, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xC0, 0xC0, 0xE0, 0xF0, 0xE0, 0x40, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xFB, 0xE0,
0xDF, 0xB1, 0xEF, 0x5F, 0xB9, 0xB0, 0xA0, 0xE6, 0x6E, 0x2E, 0xB6, 0xB9, 0x9F, 0xAF, 0xA0, 0xA7,
0xBF, 0x99, 0xB6, 0xB6, 0xA6, 0xA6, 0xB0, 0xB0, 0xA9, 0xDF, 0xCF, 0xF0, 0x7F, 0x77, 0xFD, 0x01,
0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x08, 0xEE, 0xB3, 0x7D, 0xBE, 0x7F, 0xC7, 0x87, 0xB7,
0xB7, 0xB7, 0xCD, 0x7D, 0x83, 0x93, 0xFB, 0xCD, 0xB5, 0x35, 0xA5, 0x87, 0xCE, 0xFE, 0x1C, 0xF9,
0xC3, 0x1C, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x1F, 0x3F, 0x3C, 0x73,
0xEF, 0x9E, 0x7E, 0xFD, 0xFD, 0xED, 0xAD, 0xFD, 0xDD, 0xFF, 0xBF, 0xFF, 0x5F, 0xDF, 0xEF, 0xFF,
0xFF, 0xFF, 0x6F, 0xFF, 0xDF, 0xEF, 0xFD, 0xDD, 0xFD, 0xBC, 0xFE, 0x7E, 0xBF, 0xEF, 0x7B, 0x3E,
0x1F, 0x0F, 0x07, 0x00, 0x00, 0x0E, 0x1F, 0x3C, 0x77, 0x5F, 0x3D, 0x7D, 0xFB, 0xFB, 0x7A, 0xFA,
0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0x7E, 0xFE, 0xBF, 0xFD, 0xF5, 0xF5, 0xF6, 0xFA, 0xFB, 0xDF,
0x67, 0x78, 0x3C, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x00, 0x00,
0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

0x00, 0x00, 0x00, 0xC0, 0x80, 0x00, 0x00, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x40, 0x00, 0x10, 0x38, 0x80, 0x00, 0x00, 0x80, 0xC0, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x01, 0x00, 0x00, 0x81, 0x83, 0x83, 0x87, 0xE7, 0xEF, 0xEF, 0xEB, 0xFF, 0xF7, 0xDF,
0xFA, 0xFE, 0xFF, 0xEB, 0xEE, 0xEE, 0xE7, 0x67, 0x63, 0x61, 0x60, 0x60, 0x60, 0xE0, 0xE0, 0xE0,
0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x71, 0x73, 0x7B,
0x7F, 0x7F, 0x7F, 0x7F, 0x7F, 0x7E, 0x7F, 0x77, 0x76, 0x73, 0x73, 0x71, 0x71, 0x70, 0x71, 0x70,
0x70, 0x70, 0x70, 0x70, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF1, 0xF1, 0xF1, 0xE0, 0xE0,
0xE8, 0xEC, 0xEE, 0xE7, 0xE2, 0xE4, 0xE8, 0xD0, 0xE0, 0xE0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0,

0x10, 0x10, 0x10, 0x10, 0x1F, 0x13, 0xA1, 0xAD, 0xC8, 0x49, 0x47, 0x42, 0x40, 0xC0, 0xDC, 0x78,
0x60, 0x60, 0x20, 0x21, 0x31, 0x30, 0x11, 0x1A, 0x1B, 0x0B, 0x0D, 0x0C, 0x04, 0x06, 0x06, 0x06,
0x03, 0x03, 0x03, 0x13, 0x31, 0x71, 0x71, 0x61, 0x81, 0x81, 0x41, 0x20, 0x26, 0x0C, 0x1C, 0x30,
0x78, 0x00, 0x00, 0x84, 0xC4, 0x84, 0x84, 0x0C, 0x04, 0x02, 0x02, 0x01, 0x01, 0x07, 0x0E, 0x0E,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xE0, 0xE0, 0xC0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xE0, 0xC0, 0xC0, 0x00, 0x00, 0x81, 0x81, 0x81, 0x41, 0x41,
0x21, 0x21, 0x13, 0x13, 0x13, 0x03, 0x0B, 0x0B, 0x0B, 0x0F, 0x0F, 0x07, 0x07, 0x07, 0x07, 0x07,

0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0x01, 0x00, 0x00, 0x06, 0x07, 0x03, 0x03, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x0C, 0x40, 0xEE, 0x79,
0x35, 0x02, 0x08, 0x08, 0x04, 0x04, 0x02, 0x1F, 0x3D, 0x3C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04,
0x04, 0x24, 0x00, 0x0D, 0x30, 0x31, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x82, 0xC6, 0xC6, 0x36, 0x68, 0x44,
0xB4, 0xA0, 0x52, 0x62, 0x02, 0x02, 0x02, 0x00, 0x01, 0x03, 0x32, 0x7A, 0x3E, 0x1A, 0x02, 0x02,
0x02, 0x02, 0x02, 0x02, 0x02, 0x00, 0x1D, 0x3D, 0x1D, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

const unsigned char MarilynMonroe [] PROGMEM = {
  0xff, 0xff, 0xff, 0xff, 0xff, 0xf8, 0x1f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xc0, 0x1f, 0xff, 0xff, 0xf0, 0x41, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0x80, 0x7f, 0xff, 0xff, 0xf8, 0x03, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xf9, 0xff, 0xff, 0xff, 0xe0, 0x07, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0x87, 0xff, 0xff, 0xff, 0xf8, 0x03, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0x07, 0xff, 0xff, 0xff, 0xf8, 0x01, 0xf1, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0x9f, 0xff, 0xff, 0xff, 0xf8, 0x00, 0xf8, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xbf, 0xff, 0xff, 0xff, 0xfc, 0x02, 0x78, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xfc, 0x3f, 0xff, 0xff, 0xfe, 0x03, 0x7c, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xf0, 0x07, 0xff, 0xff, 0xfe, 0x01, 0xfe, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xfd, 0xe0, 0x03, 0xff, 0xff, 0xfc, 0x00, 0xfe, 0x0f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xfe, 0x87, 0xe0, 0xff, 0xff, 0xfc, 0x00, 0x06, 0x07, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xfc, 0x1f, 0xf9, 0xff, 0xff, 0xfc, 0x00, 0x02, 0x07, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf8, 0x1f, 0xff, 0xff, 0xff, 0xfc, 0x00, 0xc3, 0xc3, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf0, 0x3f, 0xff, 0xff, 0xe0, 0x0c, 0x00, 0xe7, 0x81, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf0, 0x0f, 0xff, 0xff, 0xe0, 0x02, 0x00, 0x02, 0x00, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf0, 0x0f, 0xff, 0xff, 0xe0, 0x01, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0x80, 0x00, 0x3f, 0xff, 0xff, 0xe0, 0x00, 0x00, 0x1e, 0x3f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0x00, 0x00, 0x0f, 0xff, 0x3f, 0xf8, 0x00, 0x18, 0x7f, 0x1f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xf8, 0x01, 0x80, 0x03, 0xfc, 0x3f, 0xfc, 0x00, 0x70, 0xfe, 0x1f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xf0, 0x43, 0xff, 0xff, 0xf8, 0x7f, 0xf8, 0x00, 0x00, 0x7e, 0x1f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xe0, 0x07, 0xff, 0xff, 0xf0, 0xff, 0xfc, 0x00, 0x00, 0x7c, 0x3f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xe0, 0x0f, 0xff, 0xff, 0xf1, 0xef, 0xf8, 0x00, 0x01, 0xfc, 0x3f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xe4, 0xff, 0xff, 0xff, 0xf3, 0x80, 0xa0, 0x00, 0x07, 0xfc, 0xaf, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xec, 0x5f, 0xff, 0xff, 0xe7, 0xf0, 0x00, 0x00, 0x03, 0xfe, 0xdf, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xee, 0x7f, 0xff, 0xff, 0xc7, 0xf8, 0x00, 0x00, 0x03, 0xff, 0xdf, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xf7, 0xc7, 0xff, 0x06, 0x00, 0x03, 0xff, 0xbf, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0x5f, 0xff, 0xc7, 0x07, 0xff, 0x80, 0x00, 0x07, 0xdb, 0xbf, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xee, 0xff, 0xff, 0x80, 0x03, 0xff, 0xc0, 0x00, 0x03, 0xc3, 0x0f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0xff, 0xff, 0x98, 0x03, 0xff, 0xf8, 0x00, 0x07, 0xe0, 0x0f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xef, 0xff, 0xff, 0xf8, 0x01, 0xff, 0xfc, 0x01, 0x07, 0xfc, 0x1f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xcf, 0xef, 0xff, 0xff, 0xe1, 0xff, 0xfc, 0x01, 0x07, 0xf8, 0x1f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x9f, 0xff, 0xff, 0x7f, 0xf1, 0xff, 0xf8, 0x02, 0x07, 0x88, 0x3f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xcf, 0xef, 0xf8, 0x0f, 0xff, 0xff, 0xe0, 0x00, 0x07, 0x84, 0x3f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xe7, 0xef, 0xf0, 0x04, 0x7f, 0xff, 0xc0, 0x00, 0x07, 0x84, 0x7f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x3f, 0xff, 0xe0, 0x00, 0x1f, 0xff, 0x80, 0x00, 0x06, 0x04, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x3f, 0x7f, 0xe1, 0xf0, 0x07, 0xff, 0x80, 0x00, 0x07, 0x06, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xc3, 0xfe, 0x03, 0xff, 0x00, 0x00, 0x03, 0x80, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xf2, 0x3f, 0xc6, 0x7f, 0x81, 0xce, 0x00, 0x00, 0x01, 0xc1, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xe0, 0x3f, 0xc0, 0x07, 0xc1, 0xfe, 0x00, 0x00, 0x0d, 0xc0, 0x7f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xe0, 0x3f, 0xc0, 0x01, 0xe0, 0xfc, 0x00, 0x00, 0x0f, 0xc0, 0x7f, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xc0, 0x3f, 0xc0, 0x00, 0x50, 0xfc, 0x00, 0x00, 0x0e, 0xc0, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xc0, 0x3f, 0xc0, 0x00, 0x18, 0xf8, 0x00, 0x00, 0x0e, 0xc1, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xc0, 0x3f, 0xc0, 0x00, 0x00, 0xf8, 0x00, 0x00, 0x66, 0x81, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xc0, 0x1f, 0xc7, 0x80, 0x00, 0xf8, 0x00, 0x01, 0xe0, 0x00, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xc0, 0x1f, 0xc1, 0xe0, 0x01, 0xf8, 0x00, 0x03, 0xf0, 0x01, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x80, 0x1f, 0xc0, 0x3e, 0x03, 0xf0, 0x00, 0x00, 0xe0, 0x03, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x00, 0x1f, 0xe0, 0xe0, 0x03, 0xf2, 0x00, 0x00, 0xc0, 0x03, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x80, 0x1f, 0xf0, 0x00, 0x07, 0xe6, 0x00, 0x00, 0xc0, 0x03, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x80, 0x1f, 0xff, 0x00, 0x1f, 0xee, 0x00, 0x00, 0x80, 0x07, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xb8, 0x0f, 0xff, 0xf0, 0x3f, 0xdc, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xbc, 0x0f, 0xff, 0xff, 0xff, 0xdc, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x9e, 0x0f, 0xff, 0xff, 0xff, 0xf8, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x08, 0x0f, 0xff, 0xff, 0xff, 0x70, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x00, 0x0b, 0xff, 0xff, 0xfe, 0xe0, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x00, 0x0b, 0xff, 0xff, 0xf9, 0xc0, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x3c, 0x09, 0xff, 0xff, 0xf1, 0x80, 0x00, 0x00, 0x00, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x1e, 0x08, 0x3f, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x1f, 0x08, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0x80, 0x1c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xce, 0x1c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0x1c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff, 0xff, 0xff
};

const uint8_t splash_OpenAVRc[] PROGMEM = {
0x00,0x00,0x00,0x00,0x00,0x10,0x38,0x78,0xFC,0xCC,0x84,0x04,0x04,0x0C,0x04,0x0C,
0x0C,0xDC,0xFC,0xFC,0x7C,0x1C,0x08,0x00,0x40,0xE0,0xE0,0xF0,0xB0,0xB0,0x30,0x30,
0x30,0x30,0x60,0xE0,0xC0,0x80,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x80,0xC0,0xC0,0x60,0x60,0x60,0x60,
0xE0,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x08,0x08,0x08,0x44,0x44,0x3C,0x30,
0x20,0x20,0x20,0xA0,0xA0,0xE0,0xC8,0xC8,0x98,0xF0,0xC0,0xC0,0x40,0xF0,0xE0,0xC0,
0x00,0x18,0x78,0x88,0x00,0xE8,0x38,0x00,0x48,0x68,0xF8,0x00,0x40,0xF0,0xE0,0x40,

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0xF0,0xE0,0xE0,
0xC1,0xC3,0x83,0x02,0x00,0x00,0x00,0x00,0x00,0x06,0x04,0x0D,0x0D,0x09,0x1B,0x1B,
0x1B,0x1B,0x1B,0x0F,0x0F,0x0F,0x00,0x0E,0x1F,0x3F,0x31,0x21,0x61,0x61,0x61,0xC1,
0xC1,0xE1,0xFB,0xFF,0xFF,0x07,0x01,0xF8,0xFE,0xFF,0x03,0x00,0x00,0x00,0x00,0x00,
0x00,0x01,0x03,0xFF,0xFE,0x00,0x03,0xFE,0xFE,0xFC,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,
0x18,0x18,0xB8,0xF0,0xE0,0x00,0xC0,0xE0,0xF0,0xF0,0xB8,0x98,0x98,0x99,0x99,0x91,
0xB1,0xF1,0xE1,0xE0,0x80,0x00,0x00,0x31,0xF1,0xE0,0xE0,0xE0,0x60,0x63,0x61,0x60,
0x60,0x40,0xC0,0x83,0x83,0x00,0x00,0x03,0x02,0x03,0x01,0x00,0x00,0x01,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xFF,0xFF,0xFF,0xFF,
0xFF,0xFF,0xFF,0xF8,0x80,0x00,0x00,0x00,0x00,0x0C,0xFC,0xFC,0xFC,0xFC,0xC0,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xE0,0xC0,0xC0,0xC0,0xC0,0x00,0x00,
0x00,0x80,0x81,0x81,0x83,0x82,0x80,0x83,0x8F,0xBF,0x38,0x70,0x70,0x60,0x70,0x30,
0x38,0x1C,0x1E,0x0F,0x03,0x00,0x0E,0x07,0x07,0x07,0x07,0x06,0x06,0x06,0x06,0x06,
0x06,0x02,0x03,0x03,0x01,0x00,0x01,0x03,0x07,0x07,0x04,0x0D,0x0D,0x0D,0x0D,0x0D,
0x0D,0x0D,0x05,0x01,0x00,0x00,0x00,0x00,0x03,0x0F,0x1F,0x0E,0x00,0x00,0x00,0x00,
0x00,0x00,0x10,0x18,0x0F,0x0F,0x0F,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0xFF,0xFF,0xFF,0xFF,0x1F,
0x1F,0xFF,0xFF,0xFF,0xFF,0x80,0x00,0x00,0x00,0x00,0x03,0x0F,0xFF,0xFF,0xFF,0xFF,
0xF0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x00,0x00,
0x00,0x00,0x07,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,
0x0F,0x0F,0x0E,0x0E,0x1E,0x3E,0x3C,0xFC,0xFC,0xF8,0xF8,0xF0,0xF0,0xE0,0xC0,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xC0,0xE0,0xE0,0xF0,0xF0,0xF0,0xF0,0xF8,
0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,
0xF0,0xF0,0xF0,0xE0,0xE0,0xC0,0xC0,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xF0,0xFF,0xFF,0xFF,0x7F,0x03,0x00,
0x00,0x03,0xFF,0xFF,0xFF,0xFF,0xF0,0x00,0x00,0x00,0x00,0x00,0x07,0xFF,0xFF,0xFF,
0xFF,0xFE,0x00,0x00,0x00,0x00,0xE0,0xFE,0xFF,0xFF,0xFF,0x3F,0x0F,0x00,0x00,0x00,
0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,
0xF0,0xF0,0xF8,0xF8,0xF8,0xF8,0xFC,0xFF,0xFF,0xFF,0xBF,0x1F,0x1F,0x0F,0x0F,0x00,
0x00,0x00,0x00,0x00,0xF0,0xFE,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x3F,0x0F,0x07,0x03,
0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,
0x01,0x81,0x81,0x81,0x81,0x81,0x81,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0xE0,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,0xF8,0xF8,
0xF8,0xF8,0xFD,0xFF,0xFF,0xFF,0xFF,0xFE,0x00,0x00,0x00,0x00,0x00,0x01,0xFF,0xFF,
0xFF,0xFF,0xFE,0xE0,0xF8,0xFF,0xFF,0xFF,0x3F,0x07,0x01,0x00,0x00,0x00,0x00,0x00,
0x00,0x80,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x07,0x03,0x03,0x03,0x03,0x03,0x03,0x03,
0x03,0x03,0x03,0x07,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x3F,0x7F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,0xF0,0xE0,0xE0,
0xE0,0xE0,0xE0,0xE0,0xE0,0xE0,0xE0,0xF0,0xF0,0xF0,0xFC,0xFF,0xFF,0xFF,0xFF,0xFF,
0xFF,0x7F,0x7F,0x1F,0x0F,0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x60,0x7C,0x7F,0x7F,0x7F,0x0F,0x01,0x01,0x01,0x01,0x01,0x01,
0x01,0x01,0x01,0x01,0x7F,0x7F,0x7F,0x7F,0x7C,0x00,0x00,0x00,0x00,0x00,0x03,0x1F,
0x7F,0x7F,0x7F,0x7F,0x7F,0x7F,0x07,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x20,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x1F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x1F,0x9F,0x9F,0x9F,0x9F,0x9F,0x9F,0x9F,0x9F,0x9C,0x98,0xD0,
0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0xC1,0xC1,0xC1,0xE3,0xE3,0xE3,0xE3,0xE7,0xE7,
0x67,0x67,0x67,0x67,0x77,0x73,0x73,0x73,0x73,0x33,0x33,0x33,0x39,0x39,0x38,0x38,
0x38,0x18,0x18,0x1C,0x1C,0x1C,0x1C,0x1C,0x0C,0x0C,0x0E,0x0E,0x0E,0x0E,0x0E,0x06,

0x00,0x00,0x08,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,
0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,
0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,
0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x03,0x03,0x03,
0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x01,0x01,0x01,0x01,
0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
};

class SSD1306Display {
public:
  void setup() {
    /* Select the font to use with menu and all font functions */
    ssd1306_setFixedFont(ssd1306xled_font6x8);
    ssd1306_128x64_i2c_init();
    delay(1000); // Pause for 2 seconds

    // Clear the buffer
    ssd1306_clearScreen();
    ssd1306_drawBitmap(0, 0, 128, 64, splash_OpenAVRc);
    //ssd1306_drawBitmap(0, 0, 128, 64, Sova);
    delay(1000); // Pause for 2 seconds
  
    // Clear the buffer
    ssd1306_clearScreen();
    ssd1306_printFixed(18, 20, "Joystick  PPM", STYLE_BOLD);
    //ssd1306_printFixedN (0, 0, "Joystick  PPM", STYLE_BOLD, FONT_SIZE_2X);
    ssd1306_negativeMode();
    ssd1306_printFixed(0, 50, "**OpenAVRc  Team**", STYLE_BOLD);
    ssd1306_positiveMode();
  }

  void display_oerr() {
    ssd1306_clearScreen();
    ssd1306_printFixed(0, 0, "OSC not started", STYLE_NORMAL);
  }

  void display_herr() {
    ssd1306_clearScreen();
    ssd1306_printFixed(0, 0, "HID set error", STYLE_NORMAL);
  }

  void display_joystick_connected() {
    ssd1306_clearScreen();
    ssd1306_printFixed(0, 0, "Joystick", STYLE_NORMAL);
    ssd1306_printFixed(0, 10, "Connected", STYLE_NORMAL);
  }

  void clear() {
    ssd1306_clearScreen();
  }

  void display_joystick_disconnected() {
    ssd1306_clearScreen();
    ssd1306_printFixed(0, 0, "Joystick", STYLE_NORMAL);
    ssd1306_printFixed(0, 10, "Disconnected", STYLE_NORMAL);
  }

  int flight_mode_old,channel5_mode_old;
  byte camera_mode_old;
  bool camera_auto_center_old;
  void display(int flight_mode, int channel5_mode, byte camera_mode, bool camera_auto_center) {
    if ((flight_mode_old != flight_mode)||(channel5_mode_old != channel5_mode)||
        (camera_mode_old != camera_mode)||(camera_auto_center_old != camera_auto_center)){
          ssd1306_clearScreen();
        }
    flight_mode_old = flight_mode;
    channel5_mode_old = channel5_mode;
    camera_mode_old = camera_mode;
    camera_auto_center_old = camera_auto_center;

    ssd1306_setFixedFont(ssd1306xled_font6x8);
    ssd1306_printFixed(0, 0, "Mode:", STYLE_NORMAL);
    ssd1306_printFixed(30, 0, itoa(flight_mode, cstr, 10), STYLE_NORMAL);

    if (channel5_mode<1000)
    {
      ssd1306_printFixed(78, 0, "CH5:", STYLE_NORMAL);//oled.setCursor(13, 0);
      ssd1306_printFixed(102, 0, itoa(channel5_mode, cstr, 10), STYLE_NORMAL);
    }
    else
    {
      ssd1306_printFixed(70, 0, "CH5:", STYLE_NORMAL);//oled.setCursor(12, 0);
      ssd1306_printFixed(96, 0, itoa(channel5_mode, cstr, 10), STYLE_NORMAL);
    }

    ssd1306_printFixed(0, 20, "CMode:", STYLE_NORMAL);//oled.setCursor(0, 1);
    ssd1306_printFixed(35, 20, itoa(camera_mode, cstr, 10), STYLE_NORMAL);//oled.print(camera_mode);

    //oled.setCursor(17, 1);
    if (camera_auto_center) {
      ssd1306_printFixed(100, 20, "CEN", STYLE_NORMAL);
    }

    //display_rc(flight_mode, channel5, camera_mode, camera_auto_center);
  }

  void write_mode(RCState *rcs) {
    ssd1306_printFixed(0, 35, "M", STYLE_NORMAL);
    ssd1306_printFixed(10, 35, itoa(rcs->flight_mode, cstr, 10), STYLE_NORMAL);
  }

  void write_ch5_simple_mode(RCState *rcs) {
    //oled.setCursor(3, 2);
    if (rcs->channel5_mode == 1000) {
      ssd1306_printFixed(40, 35, "+", STYLE_NORMAL);//oled.print("+");
    }
    else {
      ssd1306_printFixed(40, 35, "o", STYLE_NORMAL);//oled.print("o");
    }
  }
  
  RCState *rcs_old;
  void write_camera_mode(RCState *rcs) {
    switch (rcs->camera_mode) {
    case CAMERA_MODES::exponent:
      ssd1306_printFixed(60, 35, "*", STYLE_NORMAL);//oled.print("*");
      break;
    case CAMERA_MODES::slow:
      ssd1306_printFixed(60, 35, "#", STYLE_NORMAL);//oled.print("#");
      break;
    case CAMERA_MODES::max_min:
      ssd1306_printFixed(60, 35, "@"//(char)B11011011
      , STYLE_NORMAL);//oled.print((char)B11011011);
      break;
    }

    if (rcs->auto_center) {
      ssd1306_printFixed(60, 35, "+", STYLE_NORMAL);//oled.print("+");
    }
    else {
      ssd1306_printFixed(60, 35, "$"//(char)B11110011
      , STYLE_NORMAL);//oled.print((char)B11110011);
    }
  }

  void write_number_value(uint8_t x, uint8_t y, int value,RCState *rcs) {
    auto mapped_value = map(value, rcs->MIN_VALUE, rcs->MAX_VALUE, -99, +99);
    if (mapped_value >= 0) {
      ssd1306_printFixed(x, y, "   ", STYLE_NORMAL);//oled.print(" ");
    }
    if (mapped_value < 10 && mapped_value> -10) {
      ssd1306_printFixed(x, y, " ", STYLE_NORMAL);//oled.print(" ");
    }
    ssd1306_printFixed(x, y, itoa(mapped_value, cstr, 10), STYLE_NORMAL);//oled.print(mapped_value);
  }

  void write_unsigned_number_value(uint8_t x, uint8_t y, int value, RCState *rcs) {
    auto mapped_value = map(value, rcs->MIN_VALUE, rcs->MAX_VALUE, 0, +99);
    if (mapped_value >= 0) {
      ssd1306_printFixed(x, y, " ", STYLE_NORMAL);//oled.print(" ");
    }
    if (mapped_value < 10 && mapped_value> -10) {
      ssd1306_printFixed(x, y, "   ", STYLE_NORMAL);//oled.print(" ");
    }
    ssd1306_printFixed(x, y, itoa(mapped_value, cstr, 10), STYLE_NORMAL);//oled.print(mapped_value);
  }

  void write_camera_values(RCState *rcs) {
    write_number_value(80, 35, rcs->camera_yaw, rcs);
    write_number_value(100, 35,rcs->camera_pitch, rcs);
  }


  void print_all(RCState *rcs) {
    write_mode(rcs);

    write_ch5_simple_mode(rcs);

    write_camera_mode(rcs);
    write_camera_values(rcs);

    write_number_value(0, 50, rcs->elevator, rcs);
    write_number_value(30, 50, rcs->aileron,rcs);
    write_unsigned_number_value(60, 50, rcs->throttle,rcs);
    write_number_value(90, 50, rcs->rudder,rcs);

    
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
