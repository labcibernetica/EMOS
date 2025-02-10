#!/usr/bin/env emos

#select all GPIO PINs
3f7fffffh constant pins

: s01
 loop
  {
   while dup ;
   pins pins pins!
   500 pause/ms
   pins 0 pins!
   500 pause/ms
   --
  }
 drop
end

" - Setting up blink..." $. $free
pins pins:out
"done\n" $. $free

8 s01
