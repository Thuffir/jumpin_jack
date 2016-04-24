Check 59465754
Auto 8224
  10 REM Jack
  20 DATA 24,36,66,165,129,90,36,24,24,60,90,153,36,66,66,195
  30 REM Ground
  40 DATA 0,255,0,0,0,0,0,0
  50 REM Pit
  60 DATA 0,0,0,0,0,17,170,68
  70 REM Char redefinition
  80 FOR i=USR "A" TO USR "A"+31
  90 READ l
 100 POKE i,l
 110 NEXT i
 120 REM Map generation
 130 RANDOMIZE
 140 LET a$="\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c\c"
 150 FOR i=2 TO 31
 160 IF (RND*100)+1<=33 AND a$(i-1)<>"\d" THEN LET a$(i)="\d"
 170 NEXT i
 180 REM Print map and init
 190 CLS
 200 PRINT AT 21,0;a$
 210 LET x=0: LET y=19: LET p=0: LET v=19
 220 GO SUB 350
 230 REM User input
 240 PAUSE 0: LET m$=INKEY$
 250 IF m$="n" AND x<>0 THEN LET x=x-1: GO TO 300
 260 IF m$="m" AND x<>31 THEN LET x=x+1: GO TO 300
 270 IF m$="h" AND x>1 THEN LET y=18: LET x=x-1: GO SUB 350: PAUSE 10: LET x=x-1: LET y=19: GO TO 300
 280 IF m$="k" AND x<30 THEN LET y=18: LET x=x+1: GO SUB 350: PAUSE 10: LET x=x+1: LET y=19: GO TO 300
 290 REM Pitfall check
 300 IF a$(x+1)="\d" AND y=19 THEN LET y=20: GO SUB 350: PAUSE 10: PRINT AT 20,x;" ": PRINT AT 21,x;"\a": PAUSE 50: GO TO 200
 310 REM Victory check
 320 IF x=31 THEN GO SUB 350: PAUSE 10: FOR i=1 TO 5: LET y=18: GO SUB 350: PAUSE 10: LET y=19: GO SUB 350: PAUSE 10: NEXT i: GO TO 140
 330 GO TO 220
 340 REM Character Draw
 350 PRINT AT v,p;" ": PRINT AT v+1,p;" ": PRINT AT y,x;"\a": PRINT AT y+1,x;"\b": LET p=x: LET v=y: RETURN
