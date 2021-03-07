#if !defined(__RCMODECONFIG_H__)
#define __RCMODECONFIG_H__

#include <EEPROM.h>
uint8_t ElevatorNbChannel;
uint8_t RudderNbChannel;
uint8_t AileronNbChannel;
uint8_t ThrottleNbChannel;

/*******************/
/*** TX SETTINGS ***/
/*******************/
//Modify the channel order based on your TX: AETR, TAER, RETA...
//Examples: Flysky & DEVO is AETR, JR/Spektrum radio is TAER, Multiplex is AERT...
//Default is RETA.
uint8_t channelsOrder = 18;

/* Select your radio's channels order (see Marcos.h for other modes) */
typedef struct{
  uint8_t  Aileron; 
  uint8_t  Elevator; 
  uint8_t  Throttle; 
  uint8_t  Rudder; 
}ChannelOrderSt_t;
enum {AETR = 0, AERT,ARET,ARTE,ATRE,ATER,EATR,EART,ERAT,ERTA,ETRA,ETAR,TEAR,TERA,TREA,TRAE,TARE,TAER,RETA,REAT,RAET,RATE,RTAE,RTEA};
//enum {AILERON = 0, ELEVATOR, THROTTLE, RUDDER};

const ChannelOrderSt_t ChannelOrder[] PROGMEM = {
                 /* AETR  0*/   {0, 1, 2, 3},
                 /* AERT  1*/   {0, 1, 3, 2},
                 /* ARET  2*/   {0, 2, 3, 1},
                 /* ARTE  3*/   {0, 3, 2, 1},
                 /* ATRE  4*/   {0, 3, 1, 2},
                 /* ATER  5*/   {0, 2, 1, 3},
                 /* EATR  6*/   {1, 0, 2, 3},
                 /* EART  7*/   {1, 0, 3, 2},
                 /* ERAT  8*/   {2, 0, 3, 1},
                 /* ERTA  9*/   {3, 0, 2, 1},
                 /* ETRA 10*/   {3, 0, 1, 2},
                 /* ETAR 11*/   {2, 0, 1, 3},
                 /* TEAR 12*/   {2, 1, 0, 3},
                 /* TERA 13*/   {3, 1, 0, 2},
                 /* TREA 14*/   {3, 2, 0, 1},
                 /* TRAE 15*/   {2, 3, 0, 1},
                 /* TARE 16*/   {1, 3, 0, 2},
                 /* TAER 17*/   {1, 2, 0, 3},
                 /* RETA 18*/   {3, 1, 2, 0},//MODE1 RUDDER,ELEVATOR,THROTTLE,AILERON (18)
                 /* REAT 19*/   {2, 1, 3, 0},
                 /* RAET 20*/   {1, 2, 3, 0},
                 /* RATE 21*/   {1, 3, 2, 0},
                 /* RTAE 22*/   {2, 3, 1, 0},
                 /* RTEA 23*/   {3, 2, 1, 0}
                            };
                            
#endif
