# Embeded Metalanguage Operating System

Real-time operating system for embeded devices.

## Arithmetic Operations for Integers/Symbols

| Word | Description                   |
| ---- | ----------------------------- |
| +    | DS ( c2 c1 -- c3 ) c3 = c1+c2 |
| --   | DS ( c1 -- c2 )    c2 = c1-1  |
| /    | DS ( c2 c1 -- c3 ) c3 = c2/c1 |
| ++   | DS ( c1 -- c2 )    c2 = c1+1  |
| %    | DS ( c2 c1 -- c3 ) c3 = c2%c1 |
| *    | DS ( c2 c1 -- c3 ) c3 = c1*c2 |
| -    | DS ( c2 c1 -- c3 ) c3 = c2-c1 |

## Arithmetic Operations for Reals

| Word | Description                   |
| ---- | ----------------------------- |
| r+   | FS ( c2 c1 -- c3 ) c3 = c1+c2 |
| r/   | FS ( c2 c1 -- c3 ) c3 = c2/c1 |
| r*   | FS ( c2 c1 -- c3 ) c3 = c1*c2 |
| r-   | FS ( c2 c1 -- c3 ) c3 = c2-c1 |

## Arithmetic Operations for Signed Integers

| Word | Description                   |
| ---- | ----------------------------- |
| s/   | DS ( c2 c1 -- c3 ) c3 = c2/c1 |
| s%   | DS ( c2 c1 -- c3 ) c3 = c2%c1 |

## Comparison for Integers and Symbols

| Word | Description                                         |
| ---- | --------------------------------------------------- |
| =    | DS ( c2 c1 -- c3 ) c3 = 1 when c2 = c1, 0 otherwise |
| >    | DS ( c2 c1 -- c3 ) c3 = 1 when c2 > c1, 0 otherwise |
| <    | DS ( c2 c1 -- c3 ) c3 = 1 when c2 < c1, 0 otherwise |

## Comparison for Reals

| Word | Description                                                   |
| ---- | ------------------------------------------------------------- |
| r=   | FS ( c2 c1 -- ) DS ( -- c3 ) c3 = 1 when c2 = c1, 0 otherwise |
| r>   | FS ( c2 c1 -- ) DS ( -- c3 ) c3 = 1 when c2 > c1, 0 otherwise |
| r<   | FS ( c2 c1 -- ) DS ( -- c3 ) c3 = 1 when c2 < c1, 0 otherwise |

## Comparison for Signed Integers

| Word | Description                                         |
| ---- | --------------------------------------------------- |
| s>   | DS ( c2 c1 -- c3 ) c3 = 1 when c2 > c1, 0 otherwise |
| s<   | DS ( c2 c1 -- c3 ) c3 = 1 when c2 < c1, 0 otherwise |

## Conversion

| Word | Description               |
| ---- | ------------------------- |
| r>s  | FS ( c1 -- ) DS ( -- c1 ) |
| r>$  | FS ( c1 -- ) PS ( -- c1 ) |
| s>r  | DS ( c1 -- ) FS ( -- c1 ) |
| s>$  | DS ( c1 -- ) PS ( -- c1 ) |
| $>s  | PS ( c1 -- ) DS ( -- c1 ) |
| $>r  | PS ( c1 -- ) FS ( -- c1 ) |
| >r   | DS ( c1 -- ) FS ( -- c1 ) |
| >$   | DS ( c1 -- ) PS ( -- c1 ) |

## Core

| Word    | Description                    |
| ------- | ------------------------------ |
| call    | PS ( c1 -- ) RS ( -- c1 )      |
| clear   | ( cn ... c1 -- )               |
| exit    | ( cn ... c1 -- )               |
| nop     | ( -- )                         |
| restart | ( cn ... c1 -- )               |
| ; end   | Closes control flow structure. |

## Data Stack

| Word  | Description                                      |
| ----- | ------------------------------------------------ |
| drop  | DS ( c1 -- )                                     |
| dup   | DS ( c1 -- c1 c1 )                               |
| emit  | DS ( c1 -- )                                     |
| nip   | DS ( c2 c1 -- c1 )                               |
| over  | DS ( c2 c1 -- c2 c1 c2 )                         |
| pick  | DS ( cn ... c2 c1 -- cn ... c2 cn )              |
| roll- | DS ( cn cn-1 ... c3 c2 c1 -- cn c2 cn-1 ... c3 ) |
| roll  | DS ( cn cn-1 ... c2 c1 -- cn-1 ... c2 cn )       |
| rot   | DS ( c3 c2 c1 -- c2 c1 c3 )                      |
| swap  | DS ( c2 c1 -- c1 c2 )                            |

## Dictionary

| Word   | Description     |
| ------ | --------------- |
| :      | Makes new word. |
| create | PS ( c1 -- )    |
| does   | IS ( c1 -- )    |
| hold   | DS ( c1 -- )    |
| omit   | PS ( c1 -- c1 ) |
| return | RS ( c1 -- )    |
| wait   | DS ( c1 -- )    |

## Floating Point Stack

| Word   | Description                                                |
| ------ | ---------------------------------------------------------- |
| rdrop  | FS ( c1 -- )                                               |
| rdup   | FS ( c1 -- c1 c1 )                                         |
| rnip   | FS ( c2 c1 -- c1 )                                         |
| rover  | FS ( c2 c1 -- c2 c1 c2 )                                   |
| rpick  | FS ( cn ... c2 c1 -- cn ... c2 cn )                        |
| rroll- | FS ( cn cn-1 ... c2 c1 -- cn c1 cn-1 ... c2 ) DS ( c1 -- ) |
| rroll  | FS ( cn cn-1 ... c2 c1 -- cn-1 ... c2 c1 cn ) DS ( c1 -- ) |
| rrot   | FS ( c3 c2 c1 -- c2 c1 c3 )                                |
| rswap  | FS ( c2 c1 -- c1 c2 )                                      |
| trunc  | FS ( c1 -- ) DS ( -- c1 )                                  |

## Logical Operations

| Word | Description                       |
| ---- | --------------------------------- |
| and  | DS ( c2 c1 -- c3 ) c3 = c1 and c2 |
| not  | DS ( c1 -- c2 )    c2 = not c1    |
| or   | DS ( c2 c1 -- c3 ) c3 = c1 or c2  |
| <<   | DS ( c2 c1 -- c3 ) c3 = c2 << c1  |
| >>   | DS ( c2 c1 -- c3 ) c3 = c2 >> c1  |
| xor  | DS ( c2 c1 -- c3 ) c3 = c1 xor c2 |

## Memory Management

| Word | Description               |
| ---- | ------------------------- |
| @    | |
| l@u  | |
| l@r  | |
| l!u  | |
| l!r  | |
| r@   | |
| r!   | |
| !    | |
| c@   | |
| c!   | |
| $@   | |
| $@c  | |
| $!   | |
| $!c  | |

## Pointer Stack

| Word      | Description                  |
| --------- | ---------------------------- |
| allocate  | DS ( c2 c1 -- ) PS ( -- c1 ) |
| atoms     | DS ( -- c1 ) PS ( c1 -- c1 ) |
| free      | PS ( c1 -- )                 |
| pdrop     | PS ( c1 -- )                 |
| pdup      | PS ( c1 -- c1 c1 )           |
| pnip      | PS ( c2 c1 -- c1 )           |
| pover     | PS ( c2 c1 -- c2 c1 c2 )     |
| prot      | PS ( c3 c2 c1 -- c2 c1 c3 )  |
| pswap     | PS ( c2 c1 -- c1 c2 )        |
| $allocate | DS ( c1 -- ) PS ( -- c1 )    |
| $free     | PS ( c1 -- )                 |

## Control Flow

| Word         | Description             |
| ------------ | ----------------------- |
| if elif else | if {} elif {} else {}   |
| include      | Inserts another script. |
| jmpnz        | DS ( c1 -- )            |
| jmpz         | DS ( c1 -- )            |

## Loops

| Word  | Description          |
| ----- | -------------------- |
| break | Goes to loop end.    |
| loop  | Start of the loop.   |
| retry | Goes to loop start.  |
| skip  | Goes to loop begin.  |
| while | Test loop condition. |
