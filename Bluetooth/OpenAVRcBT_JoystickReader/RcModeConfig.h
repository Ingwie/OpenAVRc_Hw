#if !defined(__RCMODECONFIG_H__)
#define __RCMODECONFIG_H__

uint8_t ElevatorNbChannel;
uint8_t RudderNbChannel;
uint8_t AileronNbChannel;
uint8_t ThrottleNbChannel;
uint8_t channelsOrder = 18;

/* Select your radio's channels order (see Marcos.h for other modes) */
typedef struct{
  uint8_t  Aileron; 
  uint8_t  Elevator; 
  uint8_t  Throttle; 
  uint8_t  Rudder; 
}ChannelOrderSt_t;
enum {AETR = 0, AERT,ARET,ARTE,ATRE,ATER,EATR,EART,ERAT,ERTA,ETRA,ETAR,TEAR,TERA,TREA,TRAE,TARE,TAER,RETA,REAT,RAET,RATE,RTAE,RTEA};
enum {AILERON = 0, ELEVATOR, THROTTLE, RUDDER};

const ChannelOrderSt_t ChannelOrder[] PROGMEM = {
                 /* AETR */   {0, 1, 2, 3},
                 /* AERT */   {0, 1, 3, 2},
                 /* ARET */   {0, 2, 3, 1},
                 /* ARTE */   {0, 3, 2, 1},
                 /* ATRE */   {0, 3, 1, 2},
                 /* ATER */   {0, 2, 1, 3},
                 /* EATR */   {1, 0, 2, 3},
                 /* EART */   {1, 0, 3, 2},
                 /* ERAT */   {2, 0, 3, 1},
                 /* ERTA */   {3, 0, 2, 1},
                 /* ETRA */   {3, 0, 1, 2},
                 /* ETAR */   {2, 0, 1, 3},
                 /* TEAR */   {2, 1, 0, 3},
                 /* TERA */   {3, 1, 0, 2},
                 /* TREA */   {3, 2, 0, 1},
                 /* TRAE */   {2, 3, 0, 1},
                 /* TARE */   {1, 3, 0, 2},
                 /* TAER */   {1, 2, 0, 3},
                 /* RETA */   {3, 1, 2, 0},//MODE1 RUDDER,ELEVATOR,THROTTLE,AILERON (18)
                 /* REAT */   {2, 1, 3, 0},
                 /* RAET */   {1, 2, 3, 0},
                 /* RATE */   {1, 3, 2, 0},
                 /* RTAE */   {2, 3, 1, 0},
                 /* RTEA */   {3, 2, 1, 0}
                            };
                            
#endif
