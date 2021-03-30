#!/bin/bash

# Adjust below the Serial Port used by your Arduino UNO (Look at Tools->Port, or Outils->Port in the Arduino IDE)
SERIAL_PORT=/dev/ttyACM0

# Define here the HEX file you want to load (this HEX file shall be in the current directory)
HEX_FILE=MS8_Xany_PWM_V0_4._HEX

# Target MCU
TARGET_MCU=attiny84

# Fuse values
LOW_FUSE=0xFE
HIGH_FUSE=0x5D
EXT_FUSE=0xFF

# avrdude executable and avrdude configuration file (shall be in the current directory
AVRDUDE_EXE=avrdude
AVRDUDE_CONF=avrdude.conf


# vvvvvvvv DO NOT TOUCH BELOW vvvvvvvv

LOAD_HEX_CMD="./$AVRDUDE_EXE -C$AVRDUDE_CONF -v -p$TARGET_MCU -cstk500v1 -P$SERIAL_PORT -b19200 -Uflash:w:$HEX_FILE:i"

PROG_FUSE_CMD="./$AVRDUDE_EXE -C$AVRDUDE_CONF -v -p$TARGET_MCU -cstk500v1 -P$SERIAL_PORT -b19200 -Ulfuse:w:$LOW_FUSE:m -Uhfuse:w:$HIGH_FUSE:m -Uefuse:w:$EXT_FUSE:m"

#echo LOAD_HEX_CMD=$LOAD_HEX_CMD
#echo ""
#echo PROG_FUSE_CMD=$PROG_FUSE_CMD

echo ""
echo "UNO arduino board loaded by ArduinoISP sketch expected on serial port: $SERIAL_PORT"
if [ -f "$HEX_FILE" ]; then
    echo "TARGET MCU: $TARGET_MCU"
    echo "HEX FILE:   $HEX_FILE"
    echo "LOW_FUSE:   $LOW_FUSE"
    echo "HIGH_FUSE:  $HIGH_FUSE"
    echo "EXT_FUSE:   $EXT_FUSE"
else
    echo ""
    echo "$HEX_FILE not found in the current directory!"
    echo ""
    exit 1
fi
echo ""
Go=0
while true; do
    read -n 1 -p "Program $HEX_FILE in $TARGET_MCU target MCU ? [y/n] " answer
    case $answer in
        [Yy]* ) Go=1; break;;
        [Nn]* ) echo " Operation aborted by user!"; exit;;
        * ) echo " Please answer yes or no.";;
    esac
done
if [ $Go == 1 ]; then
    echo ""
    $LOAD_HEX_CMD
    if [ $? != 0 ]; then
        Go=0
        echo "An error occurs when loading $HEX_FILE, please check serial port and wiring!"
    else
        echo "$HEX_FILE successfully loaded!"
    fi
    echo ""
    if [ $Go == 1 ]; then
        Go=0
        while true; do
            read -n 1 -p "Program fuses (LOW_FUSE=$LOW_FUSE, HIGH_FUSE=$HIGH_FUSE, EXT_FUSE=$EXT_FUSE) in $TARGET_MCU target MCU ? [y/n] " answer
            case $answer in
                [Yy]* ) Go=1; break;;
                [Nn]* ) echo " Operation aborted by user!"; exit;;
                * ) echo " Please answer yes or no.";;
            esac
        done
        if [ $Go == 1 ]; then
            echo ""
            $PROG_FUSE_CMD
            if [ $? != 0 ]; then
                Go=0
                echo "An error occurs when programming fuses!"
                echo ""
            else
                echo "Fuses successfully programmed!"
                echo ""
                echo "Congratulation, $TARGET_MCU target MCU successfully loaded with $HEX_FILE and programmed with the fuses (LOW_FUSE=$LOW_FUSE, HIGH_FUSE=$HIGH_FUSE, EXT_FUSE=$EXT_FUSE) !"
            fi
        fi
    fi
    echo ""
fi

# ^^^^^^^^^ DO NOT TOUCH ABOVE ^^^^^^^^^
