// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(PROGRAM)
// Check if any key is pressed
@KBD
D=M

// if keycode at KBD(stored in D) == 0, draw white
@DRWT
D;JEQ 
// otherwise, draw white
@DRBK
0;JMP

(DRWT) // Draw white

@SCREEN
D=M

// init counter
@i
M=0

(WLOOP)
@i
D=M
@8192 // CONST: 256 rows * 32 consecutive register-size (16-bit) words
D=D-A;
@PROGRAM
D;JGE

@i
D=M
@SCREEN
A=A+D
// tmp is now at screen + counter
M=0

// increment counter
@i
M=M+1

// start drawing black again
@WLOOP
0;JMP
(WEND)

@PROGRAM // infinite loop
0;JMP

(DRBK) // Draw black
@SCREEN
D=M

// init counter
@i
M=0

(BLOOP)
@i
D=M
@8192 // CONST: 256 rows * 32 consecutive register-size (16-bit) words
D=D-A;
@PROGRAM
D;JGE

@i
D=M
@SCREEN
A=A+D
// tmp is now at screen + counter
M=-1

// increment counter
@i
M=M+1

// start drawing black again
@BLOOP
0;JMP
(BEND)

@PROGRAM // infinite loop
0;JMP

(END)