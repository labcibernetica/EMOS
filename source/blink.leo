#!/usr/bin/env emos

2000000h constant pins

: s01
 loop
  {
   while dup ;
   #25 1 pin!
   pins pins pins!
   500 pause/ms
   #25 0 pin!
   pins 0 pins!
   500 pause/ms
   --
  }
 drop
end

" - Setting up PICO..." $. $free
#25 pin:out
pins pins:out
"done\n" $. $free

8 s01
