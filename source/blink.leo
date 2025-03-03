#!/usr/bin/env emos

#select all GPIO PINs
3f7fffffh constant pins

: s10
 #make loop
 loop
  {
   #check for another blink
   while dup ;
   #set all GPIOs to one
   pins pins pins!
   #wait for bit to show
   500 pause/ms
   #set all GPIOs to zero
   pins 0 pins!
   #wait for bit to show
   500 pause/ms
   #go to next blink
   --
  }
 drop
end

#configure PICO for Blink
" - Setting up Blink..." $. free
pins pins:out
"done\n" $. free

#blinks all GPIOs 8 times
8 s10
