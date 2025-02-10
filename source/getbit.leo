#!/usr/bin/env emos

#select GP1 PIN
1h constant pin

" - Setting up getbit..." $. $free
pin pin:in
"done\n" $. $free

2 base
loop 8
 {
  500 pause/ms
  pin pin@ .
  '\n' emit
  --
  while dup ;
 }
