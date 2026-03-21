# H0C5 minmum command list

```
AT : Ceck the connection.
AT+NAME?    : See default name
AT+ADDR?    : see default address
AT+VERSION? : See version
AT+UART?    : See baudrate
AT+ROLE?    : See role of bt module(1=master/0=slave)
AT+RESET    : Reset and exit AT mode
AT+ORGL     : Restore factory settings
AT+PSWD?    : see default password
```

## First start
1. hold button and power on
2. open a serial terminal as Tera Term, CoolTerm or Termite, with 38400 bauds.
3. type **AT** commands, if HC05 return **OK**, you can continue.
4. type commands:
   - AT+NAME=MYNAME
   - AT+ROLE=1
   - AT+UART=115200,0,0