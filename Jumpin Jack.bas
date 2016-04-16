Check 458F69F3
Auto 8224
  10 REM Jack
  20 DATA BIN 00011000
  30 DATA BIN 00100100
  40 DATA BIN 01000010
  50 DATA BIN 10100101
  60 DATA BIN 10000001
  70 DATA BIN 01011010
  80 DATA BIN 00100100
  90 DATA BIN 00011000
 100 DATA BIN 00011000
 110 DATA BIN 00111100
 120 DATA BIN 01011010
 130 DATA BIN 10011001
 140 DATA BIN 00100100
 150 DATA BIN 01000010
 160 DATA BIN 01000010
 170 DATA BIN 11000011
 180 REM Floor
 190 DATA 0,255,0,0,0,0,0,0
 200 REM Pit
 210 DATA 0,0,0,0,0
 220 DATA BIN 00010001
 230 DATA BIN 10101010
 240 DATA BIN 01000100
 250 REM Char redefinition
 260 FOR c=USR "A" TO USR "A"+31
 270 READ l
 280 POKE c,l
 290 NEXT c
 300 REM Map definition
 310 LET a$="\c\c\c\c\c\c\c\c\c\c\c\d\c\c\c\d\c\c\c\c\c\d\c\c\c\c\c\c\d\c\c\c"
 320 PRINT AT 21,0;a$
 330 REM Character movement
 340 LET x=0: LET p=0
 350 PRINT AT 19,p;" ": PRINT AT 20,p;" ": PRINT AT 19,x;"\a": PRINT AT 20,x;"\b"
 360 LET m$=INKEY$: IF m$="" THEN GO TO 360
 370 LET p=x
 380 IF m$="n" AND x<>0 THEN LET x=x-1
 390 IF m$="m" AND x<>31 THEN LET x=x+1
 400 REM Pitfall check
 410 IF a$(x+1)<>"\d" THEN GO TO 350
 420 PRINT AT 19,p;" ": PRINT AT 20,p;" "
 430 PRINT AT 21,x;"\a"
 440 PAUSE 60
 450 GO TO 320
