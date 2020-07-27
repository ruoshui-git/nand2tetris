// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// method: repeated add num at R1 for R0 times

@i // i refers to some mem. location.
M=1 // i=1

@0
D=A
@R2 // R2 is the product
M=D
(LOOP)
@i
D=M // D=i
@R0
D=D-M // D=i-counter(R0)
@END
D;JGT // If (i-counter(R0))>0 goto END
@R1
D=M // D=i
@R2
M=D+M // sum=sum+i
@i
M=M+1 // i=i+1
@LOOP
0;JMP // Goto LOOP
(END)
@END
0;JMP // Infinite loop