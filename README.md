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

| Word    | Description                            |
| ------- | -------------------------------------- |
| call    | DS ( c1 -- ) PS ( c1 -- ) RS ( -- c1 ) |
| clear   | ( cn ... c1 -- )                       |
| exit    | ( cn ... c1 -- )                       |
| nop     | ( -- )                                 |
| restart | ( cn ... c1 -- )                       |
| ; end   | Closes control flow structure.         |

## Data Stack

| Word  | Description                             |
| ----- | --------------------------------------- |
| drop  | DS ( c1 -- )                            |
| emit  | DS ( c1 -- )                            |
| pick  | DS ( cn ... c1 -- cn ... c1 cn )        |
| roll- | DS ( cn ... c2 c1 -- cn c1 ... c2 )     |
| roll  | DS ( cn cn-1 ... c1 -- cn-1 ... c1 cn ) |

## Dictionary

| Word   | Description           |
| ------ | --------------------- |
| :      | Makes new word.       |
| create | DS ( c1 -- )          |
| does   | IS ( c1 -- )          |
| forget | DS ( c1 -- )          |
| hold   | DS ( c1 -- )          |
| omit   | Omit word evaluation. |
| return | RS ( c1 -- )          |
| wait   | RS ( c1 -- c2 )       |

## File System

| Word          | Description               |
| ------------- | ------------------------- |
| directory?    | PS ( c1 -- ) DS ( -- c1 ) |
| file?         | PS ( c1 -- ) DS ( -- c1 ) |
| file@$        | DS ( c1 -- ) PS ( -- c1 ) |
| file!$        | PS ( c1 -- )              |
| file:activate | DS ( c1 -- )              |
| file:close    | Closes active file.       |
| file:open     | PS ( c2 c1 -- )           |
| file:run      | PS ( c1 -- )              |

## Floating Point Stack

| Word   | Description                             |
| ------ | --------------------------------------- |
| rdrop  | FS ( c1 -- )                            |
| rpick  | FS ( cn ... c1 -- cn ... c1 cn )        |
| rroll- | FS ( cn ... c2 c1 -- cn c1 ... c2 )     |
| rroll  | FS ( cn cn-1 ... c1 -- cn-1 ... c1 cn ) |
| trunc  | FS ( c1 -- ) DS ( -- c1 )               |

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

| Word     | Description                     |
| -------- | ------------------------------- |
| allocate | DS ( c2 c1 -- )                 |
| b@       | PS ( c1 -- c1 c2 )              |
| b!       | PS ( c2 c1 -- c1 )              |
| @        | PS ( c1 -- c1 ) DS ( -- c1 )    |
| free     | PS ( c1 -- )                    |
| r@       | PS ( c1 -- ) FS ( -- c1 )       |
| r!       | FS ( c1 -- ) PS ( c1 -- c1 )    |
| shift    | DS ( c2 c1 -- ) PS ( c1 -- c2 ) |
| !        | DS ( c1 -- ) PS ( c1 -- c1 )    |
| c@       | PS ( c1 -- c1 ) DS ( -- c1 )    |
| c!       | DS ( c1 -- ) PS ( c1 -- c1 )    |
| v!       | DS ( c1 -- ) PS ( c1 -- )       |

## Pointer Stack

| Word      | Description                             |
| --------- | --------------------------------------- |
| pdrop     | PS ( c1 -- )                            |
| ppick     | PS ( cn ... c1 -- cn ... c1 cn )        |
| proll-    | PS ( cn ... c2 c1 -- cn c1 ... c2 )     |
| proll     | PS ( cn cn-1 ... c1 -- cn-1 ... c1 cn ) |

## Control Flow

| Word         | Description            |
| ------------ | ---------------------- |
| if elif else | if {} elif {} else {}  |
| include      | Inserts external code. |
| jmpnz        | DS ( c1 -- )           |
| jmpz         | DS ( c1 -- )           |

## Loops

| Word  | Description          |
| ----- | -------------------- |
| break | Goes to loop end.    |
| loop  | Start of the loop.   |
| retry | Goes to loop start.  |
| skip  | Goes to loop begin.  |
| while | Test loop condition. |

## APPs

| Word            | Description                    |
| --------------- | ------------------------------ |
| cr              | Jumps to start of next line.   |
| dup             | DS ( c1 -- c1 c1 )             |
| nip             | DS ( c2 c1 -- c1 )             |
| over            | DS ( c2 c1 -- c2 c1 c2 )       |
| rot             | DS ( c3 c2 c1 -- c2 c1 c3 )    |
| rot-            | DS ( c3 c2 c1 -- c1 c3 c2 )    |
| swap            | DS ( c2 c1 -- c1 c2 )          |
| tuck            | DS ( c2 c1 -- c1 c2 c1 )       |
| embedded?       | DS ( -- c1 )                   |
| pc?             | DS ( -- c1 )                   |
| pico?           | DS ( -- c1 )                   |
| rdup            | FS ( c1 -- c1 c1 )             |
| rnip            | FS ( c2 c1 -- c1 )             |
| rover           | FS ( c2 c1 -- c2 c1 c2 )       |
| rrot            | FS ( c3 c2 c1 -- c2 c1 c3 )    |
| rrot-           | FS ( c3 c2 c1 -- c1 c3 c2 )    |
| rswap           | FS ( c2 c1 -- c1 c2 )          |
| rtuck           | FS ( c2 c1 -- c1 c2 c1 )       |
| pause/ms        | Waits for required time in ms. |
| pause/us        | Waits for required time in µs. |
| constant        | DS ( c2 c1 -- )                |
| .               | DS ( c1 -- )                   |
| s.              | DS ( c1 -- )                   |
| variable        | DS ( c2 c1 -- )                |
| atoms           | PS ( c1 -- c1 ) DS ( -- c1 )   |
| vector          | DS ( c2 c1 -- )                |
| pdup            | PS ( c1 -- c1 c1 )             |
| pnip            | PS ( c2 c1 -- c1 )             |
| pover           | PS ( c2 c1 -- c2 c1 c2 )       |
| prot            | PS ( c3 c2 c1 -- c2 c1 c3 )    |
| prot-           | PS ( c3 c2 c1 -- c1 c3 c2 )    |
| pswap           | PS ( c2 c1 -- c1 c2 )          |
| ptuck           | PS ( c2 c1 -- c1 c2 c1 )       |
| rconstant       | DS ( c1 -- ) FS ( c1 -- )      |
| r.              | DS ( c1 -- ) FS ( c1 -- )      |
| rvariable       | DS ( c1 -- ) FS ( c1 -- )      |
| rvariable       | DS ( c1 -- ) FS ( c1 -- )      |
| scheduling.cts  | DS ( -- c1 )                   |
| scheduling.idle | DS ( -- c1 )                   |
| scheduling.nps  | DS ( -- c1 )                   |
| scheduling.rrs  | DS ( -- c1 )                   |
| scheduling.wait | DS ( -- c1 )                   |
| scheduling.wds  | DS ( -- c1 )                   |
| cconstant       | DS ( c2 c1 -- )                |
| cvariable       | DS ( c2 c1 -- )                |
| $+              | PS ( c2 c1 -- c3 )             |
| $atoms          | PS ( c1 -- ) DS ( -- c1 )      |
| $constant       | DS ( c1 -- ) PS ( c1 -- )      |
| $dup            | PS ( c1 -- c1 c1 )             |
| $=              | PS ( c2 c1 -- ) DS ( -- c1 )   |
| $.              | PS ( c1 -- c1 )                |
| $variable       | DS ( c1 -- ) PS ( c1 -- )      |

## Hardware

| Word            | Description        |
| --------------- | ------------------ |
| pin@            | DS ( c1 -- c2 )    |
| pin:in          | DS ( c1 --    )    |
| pin:out         | DS ( c1 --    )    |
| pin!            | DS ( c2 c1 -- )    |
| pins@           | DS ( c1 -- c2 )    |
| pins:in         | DS ( c1 --    )    |
| pins:out        | DS ( c1 --    )    |
| pins!           | DS ( c2 c1 -- )    |
| getch           | DS ( -- c1 )       |
| timer@          | DS ( c1 -- c1 c2 ) |
| timer!          | DS ( c1 -- c2 )    |

## Registers

| Word            | Description                 |
| --------------- | --------------------------- |
| base            | DS ( c1 -- )                |
| blocks          | DS ( -- c1 )                |
| decimals        | DS ( c1 -- )                |
| digits          | DS ( c1 -- )                |
| integers        | DS ( -- c1 )                |
| reg.kernel      | DS ( -- c1 )                |
| reg.platform    | DS ( -- c1 )                |
| reals           | DS ( -- c1 )                |
| symbols         | DS ( -- c1 )                |
| reg.system      | DS ( -- c1 )                |
| task.mode       | DS ( c1 -- )                |
| task.time       | DS ( c1 -- )                |
| task.words      | DS ( c1 -- )                |
| reg.version     | PS ( -- c1 )                |
| zeros           | DS ( c1 -- )                |
