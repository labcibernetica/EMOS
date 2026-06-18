#!/usr/bin/env emos

#configure PICO for UART
" - Setting up UART..." $. free
#c1: baud rate
#c2: transmitter GPIO PIN
#c3: receiver GPIO PIN
#c4: UART ID
0 1 0 4800 uart:on #208.33 us/bit, 1.666 ms/byte
"done\n" $. free

#output format
16 base
3  digits
1  zeros

#send count in loop Tx-Rx
loop 10
 {
  #check for another symbol
  while dup ;
  #send message over UART
  " - TX: " $. free dup . cr
  dup uart!
  #wait
  2 pause/ms
  #receive message from UART
  uart@
  " - RX: " $. free
  CBOR:number CBOR:send
  cr
  #wait
  2 pause/ms
  #go to next symbol
  --
 } drop
