;***********************************************************
; Programming Assignment 4
; Student Name: Eralp Orkun
; UT Eid: eao789
; -------------------Save Simba (Part II)---------------------
; This is the starter code. You are given the main program
; and some declarations. The subroutines you are responsible for
; are given as empty stubs at the bottom. Follow the contract. 
; You are free to rearrange your subroutines if the need were to 
; arise.

;***********************************************************

.ORIG x4000

;***********************************************************
; Main Program
;***********************************************************
        JSR   DISPLAY_JUNGLE
        LEA   R0, JUNGLE_INITIAL
        TRAP  x22 
        LDI   R0,BLOCKS
        JSR   LOAD_JUNGLE
        JSR   DISPLAY_JUNGLE
        LEA   R0, JUNGLE_LOADED
        TRAP  x22                        ; output end message
HOMEBOUND
        LEA   R0,PROMPT
        TRAP  x22
        TRAP  x20                        ; get a character from keyboard into R0
        TRAP  x21                        ; echo character entered
        LD    R3, ASCII_Q_COMPLEMENT     ; load the 2's complement of ASCII 'Q'
        ADD   R3, R0, R3                 ; compare the first character with 'Q'
        BRz   EXIT                       ; if input was 'Q', exit
;; call a converter to convert i,j,k,l to up(0) left(1),down(2),right(3) respectively
        JSR   IS_INPUT_VALID      
        ADD   R2, R2, #0                 ; R2 will be zero if the move was valid
        BRz   VALID_INPUT
        LEA   R0, INVALID_MOVE_STRING    ; if the input was invalid, output corresponding
        TRAP  x22                        ; message and go back to prompt
        BR    HOMEBOUND
VALID_INPUT                 
        JSR   APPLY_MOVE                 ; apply the move (Input in R0)
        JSR   DISPLAY_JUNGLE
        JSR   IS_SIMBA_HOME      
        ADD   R2, R2, #0                 ; R2 will be zero if Simba reached Home
        BRnp  HOMEBOUND                     ; otherwise, loop back
EXIT   
        LEA   R0, GOODBYE_STRING
        TRAP  x22                        ; output a goodbye message
        TRAP  x25                        ; halt
JUNGLE_LOADED       .STRINGZ "\nJungle Loaded\n"
JUNGLE_INITIAL      .STRINGZ "\nJungle Initial\n"
ASCII_Q_COMPLEMENT  .FILL    x-71    ; two's complement of ASCII code for 'q'
PROMPT .STRINGZ "\nEnter Move \n\t(up(i) left(j),down(k),right(l)): "
INVALID_MOVE_STRING .STRINGZ "\nInvalid Input (ijkl)\n"
GOODBYE_STRING      .STRINGZ "\nYou Saved Simba !Goodbye!\n"
BLOCKS               .FILL x5000

;***********************************************************
; Global constants used in program
;***********************************************************
;***********************************************************
; This is the data structure for the Jungle grid
;***********************************************************
GRID .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
     .STRINGZ "| | | | | | | | |"
     .STRINGZ "+-+-+-+-+-+-+-+-+"
  
;***********************************************************
; this data stores the state of current position of Simba and his Home
;***********************************************************
CURRENT_ROW        .BLKW   #1       ; row position of Simba
CURRENT_COL        .BLKW   #1       ; col position of Simba 
HOME_ROW           .BLKW   #1       ; Home coordinates (row and col)
HOME_COL           .BLKW   #1

;***********************************************************
;***********************************************************
;***********************************************************
;***********************************************************
;***********************************************************
;***********************************************************
; The code above is provided for you. 
; DO NOT MODIFY THE CODE ABOVE THIS LINE.
;***********************************************************
;***********************************************************
;***********************************************************
;***********************************************************
;***********************************************************
;***********************************************************
;***********************************************************

;***********************************************************
; DISPLAY_JUNGLE
;   Displays the current state of the Jungle Grid 
;   This can be called initially to display the un-populated jungle
;   OR after populating it, to indicate where Simba is (*), any 
;   Hyena's(#) are, and Simba's Home (H).
; Input: None
; Output: None
; Notes: The displayed grid must have the row and column numbers
;***********************************************************
DISPLAY_JUNGLE      
; Your Program 3 code goes here

ST R0, DJSaveR0 ; Saving all old registers
ST R1, DJSaveR1
ST R2, DJSaveR2

ld r1, DJNum
lea R0, NumbersH 
TRAP  x22

lea r0, Space
TRAP x22
ld r2, DJGrid
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num0
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea r0, Space
TRAP x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num1
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea r0, Space
TRAP x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num2
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea r0, Space
TRAP x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num3
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea r0, Space
TRAP x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num4
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Space
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num5
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea r0, Space
TRAP x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num6
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea r0, Space
TRAP x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea R0, Num7
TRAP  x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22

lea r0, Space
TRAP x22
add r2, r2, r1
add r0, r2, #0
TRAP  x22
lea r0, NewLine
TRAP x22


LD R0, DJSaveR0 ; restoring all old registers
LD R1, DJSaveR1
LD R2, DJSaveR2
    JMP R7
    
; memory locations where registers are saved
DJSaveR0 .blkw #1   
DJSaveR1 .blkw #1
DJSaveR2 .blkW #1

; Strings to be outputted
DJNum .Fill #18
NumbersH       .STRINGZ "\n   0 1 2 3 4 5 6 7 \n"  
NewLine .STRINGZ "\n"
Num0 .STRINGZ "0 "
Num1 .STRINGZ "1 "
Num2 .STRINGZ "2 "
Num3 .STRINGZ "3 "
Num4 .STRINGZ "4 "
Num5 .STRINGZ "5 "
Num6 .STRINGZ "6 "
Num7 .STRINGZ "7 "
Space .STRINGZ "  "

;Pointers to grid
DJGrid .Fill GRID



;***********************************************************
; LOAD_JUNGLE
; Input:  R0  has the address of the head of a linked list of
;         gridblock records. Each record has four fields:
;       0. Address of the next gridblock in the list
;       1. row # (0-7)
;       2. col # (0-7)
;       3. Symbol (can be I->Initial,H->Home or #->Hyena)
;    The list is guaranteed to: 
;               * have only one Inital and one Home gridblock
;               * have zero or more gridboxes with Hyenas
;               * be terminated by a gridblock whose next address 
;                 field is a zero
; Output: None
;   This function loads the JUNGLE from a linked list by inserting 
;   the appropriate characters in boxes (I(*),#,H)
;   You must also change the contents of these
;   locations: 
;        1.  (CURRENT_ROW, CURRENT_COL) to hold the (row, col) 
;            numbers of Simba's Initial gridblock
;        2.  (HOME_ROW, HOME_COL) to hold the (row, col) 
;            numbers of the Home gridblock
;       
;***********************************************************
LOAD_JUNGLE 
; Your Program 3 code goes here
ST R0, LJSaveR0 ; Saving all old registers
ST R1, LJSaveR1
ST R2, LJSaveR2
ST R3, LJSaveR3
ST R4, LJSaveR4
ST R5, LJSaveR5
ST R6, LJSaveR6
ST R7, LJSaveR7

add r4, r0, #0 ; move to r4

LJLoop
ldr r1, r4, #1 ; load elements from linked list
ldr r2, r4, #2 
ldr r3, r4, #3

LJInitial
ld r6, AInitial
not r6, r6
add r6, r6, #1
add r5, r3, r6 ; check if it is initial
brnp LJHome
and r3, r3, #0
add r3, r3, #10 ; add the meaning of life (your character player:*)
add r3, r3, #10
add r3, r3, #10
add r3, r3, #10
add r3, r3, #2
sti r1, Loc_Cur_Row
sti r2, Loc_Cur_Col
br continue

LJHome
ld r6, AHome
not r6, r6
add r6, r6, #1
add r5, r3, r6 ; check if it is home
brnp LJHyena
sti r1, Loc_Home_Row
sti r2, Loc_Home_Col
br continue

LJHyena
ld r6, AHyena
not r6, r6
add r6, r6, #1
add r5, r3, r6 ; check if it is hyena
brnp LJFailed
br continue

LJFailed
lea r0, LJFailure
puts
br LJDone

continue
JSR GRID_ADDRESS
str r3, r0, #0
ldr r4, r4, #0
brz LJDone
br LJLoop

LJDone
LD R0, LJSaveR0 ; restoring all old registers
LD R1, LJSaveR1
LD R2, LJSaveR2
LD R3, LJSaveR3
LD R4, LJSaveR4
LD R5, LJSaveR5
LD R6, LJSaveR6
LD R7, LJSaveR7
    JMP  R7
    
LJSaveR0 .blkw #1   
LJSaveR1 .blkw #1
LJSaveR2 .blkw #1
LJSaveR3 .blkw #1
LJSaveR4 .blkw #1
LJSaveR5 .blkw #1
LJSaveR6 .blkw #1
LJSaveR7 .blkw #1

LJFailure .STRINGZ "Load Failed"

Loc_Cur_Row .Fill CURRENT_ROW
Loc_Cur_Col .Fill CURRENT_COL
Loc_Home_Row .Fill HOME_ROW
Loc_Home_Col .Fill HOME_COL
AInitial   .Fill x0049
AHome  .Fill x0048
AHyena .Fill x0023

;***********************************************************
; GRID_ADDRESS
; Input:  R1 has the row number (0-7)
;         R2 has the column number (0-7)
; Output: R0 has the corresponding address of the space in the GRID
; Notes: This is a key routine.  It translates the (row, col) logical 
;        GRID coordinates of a gridblock to the physical address in 
;        the GRID memory.
;***********************************************************
GRID_ADDRESS     
; Your Program 3 code goes here
ST R1, GASaveR1 ; Saving all old registers
ST R2, GASaveR2
ST R3, GASaveR3
ST R4, GASaveR4
ST R5, GASaveR5
ST R6, GASaveR6

and r0, r0, #0 ; clear r0 (output)
and r3, r3, #0 ; clear r3 (compare register)

ld r4, GANum18
ld r0, GAGrid
add r0, r0, r4
add r0, r0, #1
and r5, r5, #0


check0
add r3, r1, #0 ; check for 0
brnp check1
add r6, r5, #0
br GALoop

check1
add r3, r1, #-1
brnp check2
add r6, r5, #1
br GALoop

check2
add r3, r1, #-2
brnp check3
add r6, r5, #2
br GALoop

check3
add r3, r1, #-3
brnp check4
add r6, r5, #3
br GALoop

check4
add r3, r1, #-4
brnp check5
add r6, r5, #4
br GALoop

check5
add r3, r1, #-5
brnp check6
add r6, r5, #5
br GALoop

check6
add r3, r1, #-6
brnp check7
add r6, r5, #6
br GALoop

check7
add r3, r1, #-7
brnp fail
add r6, r5, #7
br GALoop

fail
add r0, r0, #-1
br restoreRegs


GALoop
brnz column
ld r5, GANum36
add r0, r0, r5
add r6, r6, #-1
br GALoop

column
add r0, r0, r2  ; first element in row + 2n column value
add r0, r0, r2

restoreRegs
LD R1, GASaveR1 ; restoring all old registers
LD R2, GASaveR2
LD R3, GASaveR3
LD R4, GASaveR4
LD R5, GASaveR5
LD R6, GASaveR6

    JMP R7
GAGrid .Fill GRID
GANum18 .Fill #18
GANum36 .Fill #36
GASaveR1 .blkw #1
GASaveR2 .blkw #1
GASaveR3 .blkw #1
GASaveR4 .blkw #1
GASaveR5 .blkw #1
GASaveR6 .blkw #1
;***********************************************************
; IS_INPUT_VALID
; Input: R0 has the move (character i,j,k,l)
; Output:  R2  zero if valid; -1 if invalid
; Notes: Validates move to make sure it is one of i,j,k,l
;        Only checks if a valid character is entered
;***********************************************************

IS_INPUT_VALID
; Your New (Program4) code goes here
ST R0, IIVSaveR0 ; Saving all old registers
ST R1, IIVSaveR1

and r2, r2, #0 ;clearing r2 and making input (r0) negative
not r0, r0
add r0, r0, #1

;check for each character (i,j,k,l)
ld r1, IIVValuei
add r1, r0, r1
brz IIVRestore

ld r1, IIVValuej
add r1, r0, r1
brz IIVRestore

ld r1, IIVValuek
add r1, r0, r1
brz IIVRestore

ld r1, IIVValuel
add r1, r0, r1
brz IIVRestore


IIVFail
add r2, r2, #-1

IIVRestore
LD R0, IIVSaveR0 ; restoring all old registers
LD R1, IIVSaveR1
    JMP R7
    
IIVSaveR0 .blkw #1   ; Save register location
IIVSaveR1 .blkw #1
IIVValuei .Fill x0069 
IIVValuej .Fill x006A 
IIVValuek .Fill x006B 
IIVValuel .Fill x006C 


;***********************************************************
; SAFE_MOVE
; Input: R0 has 'i','j','k','l'
; Output: R1, R2 have the new row and col if the move is safe
;         If the move is unsafe, that is, the move would 
;         take Simba to a Hyena or outside the Grid then 
;         return R1=-1 
; Notes: Translates user entered move to actual row and column
;        Also checks the contents of the intended space to
;        move to in determining if the move is safe
;        Calls GRID_ADDRESS
;        This subroutine does not check if the input (R0) is 
;        valid. This functionality is implemented elsewhere.
;***********************************************************

SAFE_MOVE      
; Your New (Program4) code goes here
ST R0, SMSaveR0 ; Saving all old registers
ST R2, SMSaveR2
ST R3, SMSaveR3
ST R4, SMSaveR4
ST R7, SMSaveR7

not r0, r0 ; make negative to compare to ijkl
add r0, r0, #1
ldi r1, SM_Cur_Row ;load current row and col
ldi r2, SM_Cur_Col

SMTryi
ld r3 SMValuei 
add r3, r0, r3
brnp SMTryj
add r1, r1, #-1 ; decrement row num
br SMCheckValid

SMTryj
ld r3, SMValuej
add r3, r0, r3
brnp SMTryk
add r2, r2, #-1 ; decremenet collum num
br SMCheckValid

SMTryk
ld r3, SMValuek
add r3, r0, r3
brnp SMTryl
add r1, r1, #1 ; increment row num
br SMCheckValid

SMTryl
add r2, r2, #1 ; increment collum num

SMCheckValid
and r0, r0, #0
add r0, r0, #7
not r0, r0
add r0, r0, #1

add r3, r1, r0
brp SMNotSafe
add r3, r2, r0
brp SMNotSafe
and r0, r0, #0
add r3, r1, r0
brn SMNotSafe
add r3, r2, r0
brn SMNotSafe

SMCheckHyena
; Reminder inputs for subroutine
; GRID_ADDRESS
; Input:  R1 has the row number (0-7)
;         R2 has the column number (0-7)
; Output: R0 has the corresponding address of the space in the GRID
JSR GRID_ADDRESS
ldr r3, r0, #0
not r3, r3
add r3, r3, #1
ld r4, SMValHyena
add r3, r3, r4
brz SMNotSafe
br SMRestore

SMNotSafe
and r1, r1, #0
add r1, r1, #-1
LD R2, SMSaveR2 ; restore r2

SMRestore
LD R0, SMSaveR0 ; restoring all old registers
LD R3, SMSaveR3
LD R4, SMSaveR4
LD R7, SMSaveR7
    JMP R7
    
SMSaveR0 .blkw #1
SMSaveR2 .blkw #1
SMSaveR3 .blkw #1
SMSaveR4 .blkw #1
SMSaveR7 .blkw #1
SM_Cur_Row .Fill CURRENT_ROW
SM_Cur_Col .Fill CURRENT_COL
SMValuei .Fill x0069 
SMValuej .Fill x006A 
SMValuek .Fill x006B 
SMValuel .Fill x006C 
SMValHyena .Fill x0023 
;***********************************************************
; APPLY_MOVE
; This subroutine makes the move if it can be completed. 
; It checks to see if the movement is safe by calling 
; SAFE_MOVE which returns the coordinates of where the move 
; goes (or -1 if movement is unsafe as detailed below). 
; If the move is Safe then this routine moves the player 
; symbol to the new coordinates and clears any walls (|�s and -�s) 
; as necessary for the movement to take place. 
; If the movement is unsafe, output a console message of your 
; choice and return. 
; Input:  
;         R0 has move (i or j or k or l)
; Output: None; However must update the GRID and 
;               change CURRENT_ROW and CURRENT_COL 
;               if move can be successfully applied.
; Notes:  Calls SAFE_MOVE and GRID_ADDRESS
;***********************************************************

APPLY_MOVE   
; Your New (Program4) code goes here
ST R0, AMSaveR0 ; Saving all old registers
ST R1, AMSaveR1
ST R2, AMSaveR2
ST R3, AMSaveR3
ST R4, AMSaveR4
ST R5, AMSaveR5
ST R6, AMSaveR6
ST R7, AMSaveR7

add r3, r0, #0 ; move keyboard input from r0 to r3
jsr SAFE_MOVE
add r1, r1, #0
brn AMNotSafe

AMSafe
ld r4, AM_Simba ; putting simba at new loc
; Reminder inputs for subroutine
; GRID_ADDRESS
; Input:  R1 has the row number (0-7)
;         R2 has the column number (0-7)
; Output: R0 has the corresponding address of the space in the GRID
JSR GRID_ADDRESS
str r4, r0, #0
add r5, r1, #0
add r6, r2, #0

ld r4, AM_Space ; deleting old simba
ldi r1, AM_Cur_Row
ldi r2, AM_Cur_Col
JSR GRID_ADDRESS
str r4, r0, #0
sti r5, AM_Cur_Row
sti r6, AM_Cur_Col

AMClearWall ; destory wall based on input value
not r3, r3 ; make my keyboard input negative
add r3, r3, #1

AMTryi 
ld r4, AMValuei 
add r4, r3, r4
brnp AMTryj
ld r1, number
not r1, r1
add r1, r1, #1
add r0, r0, r1 ; might NEEDS FIXING (-17)
ld r4, AM_Space
str r4, r0, #0
br AMRestore


AMTryj 
ld r4, AMValuej
add r4, r3, r4
brnp AMTryk
add r0, r0, #-1 ; move to left
ld r4, AM_Space
str r4, r0, #0
br AMRestore

AMTryk 
ld r4, AMValuek
add r4, r3, r4
brnp AMTryl
ld r1, number
add r0, r0, r1 ; might NEEDS FIXING (17)
ld r4, AM_Space
str r4, r0, #0
br AMRestore

AMTryl 
add r0, r0, #1 ; move to right
ld r4, AM_Space
str r4, r0, #0
br AMRestore



AMNotSafe
lea r0, AMUnsafe
puts

AMRestore
LD R0, AMSaveR0 ; restoring all old registers
LD R1, AMSaveR1
LD R2, AMSaveR2
LD R3, AMSaveR3
LD R4, AMSaveR4
LD R5, AMSaveR5
LD R6, AMSaveR6
LD R7, AMSaveR7
    JMP R7
AMSaveR0 .blkw #1
AMSaveR1 .blkw #1
AMSaveR2 .blkw #1
AMSaveR3 .blkw #1
AMSaveR4 .blkw #1
AMSaveR5 .blkw #1
AMSaveR6 .blkw #1
AMSaveR7 .blkw #1
AMUnsafe .STRINGZ "\nUnSafe Move"
AM_Cur_Row .Fill CURRENT_ROW
AM_Cur_Col .Fill CURRENT_COL
AM_Simba .Fill x002A
AM_Space .Fill x0020 
AMValuei .Fill x0069 
AMValuej .Fill x006A 
AMValuek .Fill x006B 
AMValuel .Fill x006C
number .fill #18

;***********************************************************
; IS_SIMBA_HOME
; Checks to see if the Simba has reached Home.
; Input:  None
; Output: R2 is zero if Simba is Home; -1 otherwise
; 
;***********************************************************

IS_SIMBA_HOME     
    ; Your code goes here
ST R0, ISHSaveR0 ; Saving all old registers
ST R1, ISHSaveR1
ST R3, ISHSaveR3
ST R7, ISHSaveR7

ldi r1, ISH_Cur_Row
ldi r2, ISH_Cur_Col
JSR GRID_ADDRESS
add r3, r0, #0
ldi r1, ISH_Home_Row
ldi r2, ISH_Home_Col
JSR GRID_ADDRESS

not r0, r0 ;make negative
add r0, r0, #1
add r0, r0, r3 ; compare vals
brz ISHYes
and r2, r2, #0
add r2, r2, #-1
br ISHRestore

ISHYes
and r2, r2, #0

ISHRestore
LD R0, ISHSaveR0 ; restoring all old registers
LD R1, ISHSaveR1
LD R3, ISHSaveR3
LD R7, ISHSaveR7
    JMP R7
    
ISHSaveR0 .blkw #1
ISHSaveR1 .blkw #1
ISHSaveR2 .blkw #1
ISHSaveR3 .blkw #1
ISHSaveR7 .blkw #1

ISH_Cur_Row .Fill CURRENT_ROW
ISH_Cur_Col .Fill CURRENT_COL
ISH_Home_Row .Fill HOME_ROW
ISH_Home_Col .Fill HOME_COL

    .END

