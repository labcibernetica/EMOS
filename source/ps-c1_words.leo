#!/usr/bin/env emos

3 integers allocate ps.

"atoms\n" $. $free
atoms ds. ps.

"pdup\n" $. $free
pdup ps.

"pdrop\n" $. $free
pdrop ps.

"free\n" $. $free
free ps.

"hello world" ps.

"free\n" $. $free
$free ps.
