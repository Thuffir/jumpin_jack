Check 50C2F205
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
 260 FOR i=USR "A" TO USR "A"+31
 270 READ l
 280 POKE i,l
 290 NEXT i
 300 REM Map definition
 310 RANDOMIZE
 320 LET a$="\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c"
 330 FOR i=2 TO 32
 340 IF (RND*100)+1<=33 AND a$(i-1)<>"\d" THEN LET a$(i)="\d"
 350 NEXT i
 360 PRINT AT 21,0;a$
 370 REM Character movement
 380 LET x=0: LET y=19: LET p=0: LET v=19
 390 GO SUB 530
 400 PAUSE 0: LET m$=INKEY$
 410 IF m$="n" AND x<>0 THEN LET x=x-1
 420 IF m$="m" AND x<>31 THEN LET x=x+1
 430 IF m$="h" AND x>1 THEN LET y=18: LET x=x-1: GO SUB 530: PAUSE 10: LET x=x-1: LET y=19
 440 IF m$="k" AND x<30 THEN LET y=18: LET x=x+1: GO SUB 530: PAUSE 10: LET x=x+1: LET y=19
 450 IF m$="a" THEN LET y=19
 460 REM Pitfall check
 470 IF a$(x+1)<>"\d" OR y=18 THEN GO TO 390
 480 PRINT AT v,p;" ": PRINT AT v+1,p;" "
 490 PRINT AT 21,x;"\a"
 500 PAUSE 50
 510 GO TO 360
 520 REM Character Draw
 530 PRINT AT v,p;" ": PRINT AT v+1,p;" ": PRINT AT y,x;"\a": PRINT AT y+1,x;"\b": LET p=x: LET v=y: RETURN
