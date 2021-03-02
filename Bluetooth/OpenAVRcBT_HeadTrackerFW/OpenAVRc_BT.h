#ifndef OPENAVRC_h
#define OPENAVRC_h


#include "PPMEncoder.h"

#define PPM_CENTER      1500
#define NUM_TRAINER     8
int16_t channelOutputs[NUM_TRAINER];
extern int ppmOut[8];
#define FULL_CHANNEL_OUTPUTS(ch) channelOutputs[ch]

/**
* \file  misclib.h
* \fn    Macro: BIN_NBL_TO_HEX_DIGIT(BinNbl)
* \brief returns the ASCII Hexa digit corresponding to a nibble value (eg: BIN_NBL_TO_HEX_DIGIT(15) -> 'F'
* \param BinNbl:  The Nibble value (0 to 15)
*/
#define BIN_NBL_TO_HEX_DIGIT(BinNbl)      ((BinNbl) < 10) ? ((BinNbl) + '0'): ((BinNbl) - 10 + 'A')

void BT_Send_Channels();
#endif
