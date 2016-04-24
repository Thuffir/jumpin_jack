Check F4842D91
Auto 8224
  10 REM Jack
  20 DATA 24,36,66,165,129,90,36,24,24,60,90,153,36,66,66,195
  30 REM Ground
  40 DATA 0,255,0,0,0,0,0,0
  50 REM Pit
  60 DATA 0,0,0,0,0,17,170,68
  70 REM Char redefinition
  80 FOR i=USR "A" TO USR "D"+7: READ l: POKE i,l: NEXT i
  90 REM Map generation
 100 RANDOMIZE
 110 LET a$="\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c"
 120 FOR i=2 TO 31
 130 IF (RND*100)+1<=33 AND a$(i-1)<>"\d" THEN LET a$(i)="\d"
 140 NEXT i
 150 REM Print map and init
 160 CLS
 170 PRINT AT 21,0;a$
 180 LET x=0: LET y=19: LET p=0: LET v=19
 190 GO SUB 330
 200 REM User input
 210 PAUSE 0: LET m$=INKEY$
 220 IF m$="z" AND x>0 THEN LET x=x-1: GO TO 280
 230 IF m$="m" AND x<31 THEN LET x=x+1: GO TO 280
 240 IF m$="a" AND x>1 THEN LET y=18: LET x=x-1: GO SUB 330: PAUSE 10: LET x=x-1: LET y=19: GO TO 280
 250 IF m$="k" AND x<30 THEN LET y=18: LET x=x+1: GO SUB 330: PAUSE 10: LET x=x+1: LET y=19: GO TO 280
 260 GO TO 210
 270 REM Pitfall check
 280 IF a$(x+1)="\d" AND y=19 THEN LET y=20: GO SUB 330: PAUSE 10: PRINT AT 20,x;" ": PRINT AT 21,x;"\a": PAUSE 50: GO TO 170
 290 REM Victory check
 300 IF x=31 THEN GO SUB 330: PAUSE 10: FOR i=1 TO 5: LET y=18: GO SUB 330: PAUSE 10: LET y=19: GO SUB 330: PAUSE 10: NEXT i: GO TO 110
 310 GO TO 190
 320 REM Character Draw
 330 PRINT AT v,p;" ": PRINT AT v+1,p;" ": PRINT AT y,x;"\a": PRINT AT y+1,x;"\b": LET p=x: LET v=y: RETURN
