#!/usr/bin/env emos

#select GP1 PIN
0 constant pin

#configure PICO
" - Setting up Getbit..." $. free
pin pin:in
"done\n" $. free

#configure output
2 base
5 digits
1 zeros

#read 8 bits
loop 8
 {
  #wait for bit
  500 pause/ms
  #get one bit and print
  pin pin@ .
  '\n' emit
  #go to next bit
  --
  while dup ;
 } drop
