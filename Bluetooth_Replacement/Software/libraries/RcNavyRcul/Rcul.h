#ifndef RCUL_H
#define RCUL_H

#include <inttypes.h>

#define RCUL_NO_CH                   ((1 << 5) - 1) //Ch on 5 bits
#define RCUL_DEFAULT_CLIENT_IDX      6
#define RCUL_CLIENT_MASK(ClientIdx)  (1 << (ClientIdx))

class Rcul
{
  public:
    virtual uint8_t  RculIsSynchro(uint8_t ClientIdx = RCUL_DEFAULT_CLIENT_IDX) = 0;
    virtual uint16_t RculGetWidth_us(uint8_t Ch) = 0;
    virtual void     RculSetWidth_us(uint16_t Width_us, uint8_t Ch = RCUL_NO_CH);
};

#endif

