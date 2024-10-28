#!/usr/bin/env emos

: s01
 loop
  {
   while dup ;
   25 1 pin!
   500 pause/ms
   25 0 pin!
   500 pause/ms
   --
  }
 drop
end

" - Setting up PICO..." $. $free
25 pin:out
"done\n" $. $free

8 s01
