###############################################################################
# Title: Assign 03P01                     Author: Luis Pena
# Class: CS 2318-251, Spring 2015         Submitted: <04-13-2015>
###############################################################################
# Program: MIPS tranlation of variable to stack variables
###############################################################################


			.data
#iArr:			.space 40			
#einPrompt:		.asciiz "\nInput integer #"
#colSpace:		.asciiz ": "
#oveMsg:			.asciiz "Value is odd... add 1 to evenize..."
#moMsg:			.asciiz "Max of "
#veMsg:			.asciiz " values entered..."
#eaPrompt:		.asciiz "Input another? (n or N = no, anything else = yes) "
#veLab:			.asciiz " value(s) entered: "
#minLab:			.asciiz "Min is "
#maxLab:			.asciiz "Max is "
#hasDupMsg:		.asciiz "At least a duplicate..."
#noDupMsg:		.asciiz "No duplicate..."
			.text
			.globl main
main:
########################################
# Register Usage
########################################
# $t0: used
# $t1: hopPtr1
# $t2: hopPtr2
# $t8: endPtr1
# $t9: endPtr2
# $t4: oneInt
# $t5: short-lived temporary
# $v1: reply
# $a2: min
# $a3: max
# $t3: hasDup
########################################
			li $t0, 0
#			la $t1, iArr
			addiu $sp, $sp, -40
			move $t1, $sp
			addiu $sp, $sp, 40
			
			
begDW1:
			addiu $sp, $sp, -16
			li $t3, '\n'
			sb $t3, 0($sp)
			
			li $t3, 'I'
			sb $t3, 1($sp)
			
			li $t3, 'n'
			sb $t3, 2($sp)
			
			li $t3, 'p'
			sb $t3, 3($sp)
			
			li $t3, 'u'
			sb $t3, 4($sp)
			
			li $t3, 't'
			sb $t3, 5($sp)
			
			li $t3, ' '
			sb $t3, 6($sp)
			
			li $t3, 'i'
			sb $t3, 7($sp)
			
			li $t3, 'n'
			sb $t3, 8($sp)
			
			li $t3, 't'
			sb $t3, 9($sp)
			
			li $t3, 'e'
			sb $t3, 10($sp)
			
			li $t3, 'g'
			sb $t3, 11($sp)
			
			li $t3, 'e'
			sb $t3, 12($sp)
			
			li $t3, 'r'
			sb $t3, 13($sp)
			
			li $t3, ' '
			sb $t3, 14($sp)
			
			li $t3, '#'
			sb $t3, 15($sp)
			

			move $a0, $sp

			li $v0, 4
#			la $a0, einPrompt
			syscall
			
			addiu $sp, $sp, 16
			
			li $v0, 1
			addi $a0, $t0, 1
			syscall
			
			addiu $sp, $sp, -2
			li $t3, ':'
			sb $t3, 0($sp)
			
			li $t3, ' '
			sb $t3, 1($sp)
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, colSpace
			syscall
			
			addiu $sp, $sp, 2
			
			li $v0, 5
			syscall
			move $t4, $v0
			andi $t5, $t4, 1
			beqz $t5, endI1
begI1:

			addiu $sp, $sp, -35
			li $t3, 'V'
			sb $t3, 0($sp)
			
			li $t3, 'a'
			sb $t3, 1($sp)
			
			li $t3, 'l'
			sb $t3, 2($sp)
			
			li $t3, 'u'
			sb $t3, 3($sp)
			
			li $t3, 'e'
			sb $t3, 4($sp)
			
			li $t3, ' '
			sb $t3, 5($sp)
			
			li $t3, 'i'
			sb $t3, 6($sp)
			
			li $t3, 's'
			sb $t3, 7($sp)
			
			li $t3, ' '
			sb $t3, 8($sp)
			
			li $t3, 'o'
			sb $t3, 9($sp)
			
			li $t3, 'd'
			sb $t3, 10($sp)
			
			li $t3, 'd'
			sb $t3, 11($sp)
			
			li $t3, '.'
			sb $t3, 12($sp)
			
			li $t3, '.'
			sb $t3, 13($sp)
			
			li $t3, '.'
			sb $t3, 14($sp)
			
			li $t3, ' '
			sb $t3, 15($sp)
			
			
			li $t3, 'a'
			sb $t3, 16($sp)
			
			li $t3, 'd'
			sb $t3, 17($sp)
			
			li $t3, 'd'
			sb $t3, 18($sp)
			
			li $t3, ' '
			sb $t3, 19($sp)
			
			li $t3, '1'
			sb $t3, 20($sp)
			
			li $t3, ' '
			sb $t3, 21($sp)
			
			li $t3, 't'
			sb $t3, 22($sp)
			
			li $t3, 'o'
			sb $t3, 23($sp)
			
			li $t3, ' '
			sb $t3, 24($sp)
			
			li $t3, 'e'
			sb $t3, 25($sp)
			
			li $t3, 'v'
			sb $t3, 26($sp)
			
			li $t3, 'e'
			sb $t3, 27($sp)
			
			li $t3, 'n'
			sb $t3, 28($sp)
			
			li $t3, 'i'
			sb $t3, 29($sp)
			
			li $t3, 'z'
			sb $t3, 30($sp)
			
			li $t3, 'e'
			sb $t3, 31($sp)
			
			li $t3, '.'
			sb $t3, 32($sp)
			
			li $t3, '.'
			sb $t3, 33($sp)
			
			li $t3, '.'
			sb $t3, 34($sp)

			move $a0, $sp

			li $v0, 4
#			la $a0, oveMsg
			syscall
			
			addiu $sp, $sp, 35
			
			li $v0, 11
			li $a0, '\n'
			syscall
			addi $t4, $t4, 1
endI1:
			sw $t4, 0($t1)
			addi $t0, $t0, 1
			addi, $t1, $t1, 4
			li $t5, 10
			bne $t0, $t5, else2
begI2:
			addiu, $sp, $sp, -6
			li $t3, 'M'
			sb $t3, 0($sp)
			li $t3, 'a'
			sb $t3, 1($sp)
			li $t3, 'x'
			sb $t3, 2($sp)
			li $t3, ' '
			sb $t3, 3($sp)
			li $t3, 'o'
			sb $t3, 4($sp)
			li $t3, 'f'
			sb $t3, 5($sp)
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, moMsg
			syscall
			
			addiu, $sp, $sp, 6
			
			li $v0, 1
			li $a0, 10
			syscall
			
			addiu, $sp, $sp, -18
			li $t3, ' '
			sb $t3, 0($sp)
			li $t3, 'v'
			sb $t3, 1($sp)
			li $t3, 'a'
			sb $t3, 2($sp)
			li $t3, 'l'
			sb $t3, 3($sp)
			li $t3, 'u'
			sb $t3, 4($sp)
			li $t3, 'e'
			sb $t3, 5($sp)
			li $t3, 's'
			sb $t3, 6($sp)
			li $t3, ' '
			sb $t3, 7($sp)
			li $t3, 'e'
			sb $t3, 8($sp)
			li $t3, 'n'
			sb $t3, 9($sp)
			li $t3, 't'
			sb $t3, 10($sp)
			li $t3, 'e'
			sb $t3, 11($sp)
			li $t3, 'r'
			sb $t3, 12($sp)
			li $t3, 'e'
			sb $t3, 13($sp)
			li $t3, 'd'
			sb $t3, 14($sp)
			li $t3, '.'
			sb $t3, 15($sp)
			li $t3, '.'
			sb $t3, 16($sp)
			li $t3, '.'
			sb $t3, 17($sp)
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, veMsg
			syscall
			
			addiu $sp, $sp, 18
			
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v1, 'n'
			j endI2
else2:
			addiu $sp, $sp, -49
			li $t3, 'I'
			sb $t3, 0($sp)
			li $t3, 'n'
			sb $t3, 1($sp)
			li $t3, 'p'
			sb $t3, 2($sp)
			li $t3, 'u'
			sb $t3, 3($sp)
			li $t3, 't'
			sb $t3, 4($sp)
			li $t3, ' '
			sb $t3, 5($sp)
			li $t3, 'a'
			sb $t3, 6($sp)
			li $t3, 'n'
			sb $t3, 7($sp)
			li $t3, 'o'
			sb $t3, 8($sp)
			li $t3, 't'
			sb $t3, 9($sp)
			li $t3, 'h'
			sb $t3, 10($sp)
			li $t3, 'e'
			sb $t3, 11($sp)
			li $t3, 'r'
			sb $t3, 12($sp)
			li $t3, '?'
			sb $t3, 13($sp)
			li $t3, ' '
			sb $t3, 14($sp)
			li $t3, '('
			sb $t3, 15($sp)
			li $t3, 'n'
			sb $t3, 16($sp)
			li $t3, ' '
			sb $t3, 17($sp)
			li $t3, 'o'
			sb $t3, 18($sp)
			li $t3, 'r'
			sb $t3, 19($sp)
			li $t3, ' '
			sb $t3, 20($sp)
			li $t3, 'N'
			sb $t3, 21($sp)
			li $t3, ' '
			sb $t3, 22($sp)
			li $t3, '='
			sb $t3, 23($sp)
			li $t3, ' '
			sb $t3, 24($sp)
			li $t3, 'n'
			sb $t3, 25($sp)
			li $t3, 'o'
			sb $t3, 26($sp)
			li $t3, ','
			sb $t3, 27($sp)
			li $t3, ' '
			sb $t3, 28($sp)
			li $t3, 'a'
			sb $t3, 29($sp)
			li $t3, 'n'
			sb $t3, 30($sp)
			li $t3, 'y'
			sb $t3, 31($sp)
			li $t3, 't'
			sb $t3, 32($sp)
			li $t3, 'h'
			sb $t3, 33($sp)
			li $t3, 'i'
			sb $t3, 34($sp)
			li $t3, 'n'
			sb $t3, 35($sp)
			li $t3, 'g'
			sb $t3, 36($sp)
			li $t3, ' '
			sb $t3, 37($sp)
			li $t3, 'e'
			sb $t3, 38($sp)
			li $t3, 'l'
			sb $t3, 39($sp)
			li $t3, 's'
			sb $t3, 40($sp)
			li $t3, 'e'
			sb $t3, 41($sp)
			li $t3, ' '
			sb $t3, 42($sp)
			li $t3, '='
			sb $t3, 43($sp)
			li $t3, ' '
			sb $t3, 44($sp)
			li $t3, 'y'
			sb $t3, 45($sp)
			li $t3, 'e'
			sb $t3, 46($sp)
			li $t3, 's'
			sb $t3, 47($sp)
			li $t3, ')'
			sb $t3, 48($sp)
			li $t3, ' '
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, eaPrompt
			syscall
			
			addiu $sp, $sp, 49
			
			li $v0, 12
			syscall
			move $v1, $v0
 endI2:

endDW1:
DWTest1:
			li $t5, 'n'
			beq $v1, $t5, xitDW1
			li $t5, 'N'
			bne $v1, $t5, begDW1
xitDW1:

			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 1
			move $a0, $t0
			syscall
			
			addiu $sp, $sp, -18
			li $t3, ' '
			sb $t3, 0($sp)
			li $t3, 'v'
			sb $t3, 1($sp)
			li $t3, 'a'
			sb $t3, 2($sp)
			li $t3, 'l'
			sb $t3, 3($sp)
			li $t3, 'u'
			sb $t3, 4($sp)
			li $t3, 'e'
			sb $t3, 5($sp)
			li $t3, '('
			sb $t3, 6($sp)
			li $t3, 's'
			sb $t3, 7($sp)
			li $t3, ')'
			sb $t3, 8($sp)
			li $t3, ' '
			sb $t3, 9($sp)
			li $t3, 'e'
			sb $t3, 10($sp)
			li $t3, 'n'
			sb $t3, 11($sp)
			li $t3, 't'
			sb $t3, 12($sp)
			li $t3, 'e'
			sb $t3, 13($sp)
			li $t3, 'r'
			sb $t3, 14($sp)
			li $t3, 'e'
			sb $t3, 15($sp)
			li $t3, 'd'
			sb $t3, 16($sp)
			li $t3, ':'
			sb $t3, 17($sp)
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, veLab
			syscall
			
			addiu $sp, $sp, 18
			
#			la $t5, iArr
			addiu $sp, $sp, -40
			move $t5, $sp
			addiu $sp, $sp, 40
			
			sll $t8, $t0, 2
			add $t8, $t8, $t5
#			la $t1, iArr
			addiu $sp, $sp, -40
			move $t1, $sp
			addiu $sp, $sp, 40
			
			j FTest1
begF1:
			addi $t5, $t8, -4
			bge $t1, $t5, else3
begI3:
			li $v0, 1
			lw $a0, 0($t1)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
			j endI3
else3:
			li $v0, 1
			lw $a0, 0($t1)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
endI3:
			addi $t1, $t1, 4

FTest1:			blt $t1, $t8, begF1
endF1:

#			la $t1, iArr
			addiu $sp, $sp, -40
			move $t1, $sp
			addiu $sp, $sp, 40
			
			sll $t8, $t0, 2
			add $t8, $t8, $t1

			lw $a2, 0($t1)
			move $a3, $a2
			addi $t1, $t1, 4
			j WTest1
begW1:
			lw $t5, 0($t1)
			bge $t5, $a2, else4
begI4:
			move $a2, $t5
			j endI4
else4:
			ble $t5, $a3, endI5
begI5:
			move $a3, $t5
endI5:
endI4:
			addi $t1, $t1, 4
WTest1:			blt $t1, $t8, begW1
endW1:
			addiu $sp, $sp, -7
			li $t3, 'M'
			sb $t3, 0($sp)
			li $t3, 'i'
			sb $t3, 1($sp)
			li $t3, 'n'
			sb $t3, 2($sp)
			li $t3, ' '
			sb $t3, 3($sp)
			li $t3, 'i'
			sb $t3, 4($sp)
			li $t3, 's'
			sb $t3, 5($sp)
			li $t3, ' '
			sb $t3, 6($sp)
			
			move $a0, $sp

			li $v0, 4
#			la $a0, minLab
			syscall
			
			addiu $sp, $sp, 7
			
			li $v0, 1
			move $a0, $a2
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			addiu, $sp, $sp, -7
			li $t3, 'M'
			sb $t3, 0($sp)
			li $t3, 'a'
			sb $t3, 1($sp)
			li $t3, 'x'
			sb $t3, 2($sp)
			li $t3, ' '
			sb $t3, 3($sp)
			li $t3, 'i'
			sb $t3, 4($sp)
			li $t3, 's'
			sb $t3, 5($sp)
			li $t3, ' '
			sb $t3, 6($sp)
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, maxLab
			syscall
			
			addiu $sp, $sp, 7
			
			li $v0, 1
			move $a0, $a3
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			li $t3, 0
#			la $t5, iArr
			addiu $sp, $sp -40
			move $t5, $sp
			addiu $sp, $sp, 40
			
			sll $t8, $t0, 2
			addi $t8, $t8, -4
			add $t8, $t8, $t5
			
			addi $t9, $t8, 4
# 			la $t1, iArr
 			addiu $sp, $sp, -40
 			move $t1, $sp
 			addiu $sp, $sp, 40
 			
			j FTest2
begF2:
			lw $t4, 0($t1)
			addi $t2, $t1, 4
			j FTest3
begF3:
			lw $t5, 0($t2)
			bne $t5, $t4, endI6
begI6:
			li $t3, 1
			j endF3
endI6:
			addi $t2, $t2, 4

FTest3:			blt $t2, $t9, begF3
endF3:

			addi $t1, $t1, 4

FTest2:			bnez $t3, xitF2
			blt $t1, $t8, begF2
xitF2:
endF2:

			beqz $t3, else7
begI7:
			addiu $sp, $sp, -23
			li $t3, 'A'
			sb $t3, 0($sp)
			li $t3, 't'
			sb $t3, 1($sp)
			li $t3, ' '
			sb $t3, 2($sp)
			li $t3, 'l'
			sb $t3, 3($sp)
			li $t3, 'e'
			sb $t3, 4($sp)
			li $t3, 'a'
			sb $t3, 5($sp)
			li $t3, 's'
			sb $t3, 6($sp)
			li $t3, 't'
			sb $t3, 7($sp)
			li $t3, ' '
			sb $t3, 8($sp)
			li $t3, 'a'
			sb $t3, 9($sp)
			li $t3, ' '
			sb $t3, 10($sp)
			li $t3, 'd'
			sb $t3, 11($sp)
			li $t3, 'u'
			sb $t3, 12($sp)
			li $t3, 'p'
			sb $t3, 13($sp)
			li $t3, 'l'
			sb $t3, 14($sp)
			li $t3, 'i'
			sb $t3, 15($sp)
			li $t3, 'c'
			sb $t3, 16($sp)
			li $t3, 'a'
			sb $t3, 17($sp)
			li $t3, 't'
			sb $t3, 18($sp)
			li $t3, 'e'
			sb $t3, 19($sp)
			li $t3, '.'
			sb $t3, 20($sp)
			li $t3, '.'
			sb $t3, 21($sp)
			li $t3, '.'
			sb $t3, 22($sp)
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, hasDupMsg
			syscall
			
			addiu $sp, $sp, 23
			
			li $v0, 11
			li $a0, '\n'
			syscall
			j endI7
else7:
			addiu $sp, $sp, -15
			li $t3, 'N'
			sb $t3, 0($sp)
			li $t3, 'o'
			sb $t3, 1($sp)
			li $t3, ' '
			sb $t3, 2($sp)
			li $t3, 'd'
			sb $t3, 3($sp)
			li $t3, 'u'
			sb $t3, 4($sp)
			li $t3, 'p'
			sb $t3, 5($sp)
			li $t3, 'l'
			sb $t3, 6($sp)
			li $t3, 'i'
			sb $t3, 7($sp)
			li $t3, 'c'
			sb $t3, 8($sp)
			li $t3, 'a'
			sb $t3, 9($sp)
			li $t3, 't'
			sb $t3, 10($sp)
			li $t3, 'e'
			sb $t3, 11($sp)
			li $t3, '.'
			sb $t3, 12($sp)
			li $t3, '.'
			sb $t3, 13($sp)
			li $t3, '.'
			sb $t3, 14($sp)
			
			move $a0, $sp
			
			li $v0, 4
#			la $a0, noDupMsg
			syscall
			
			addiu $sp, $sp, 15
			
			li $v0, 11
			li $a0, '\n'
			syscall
endI7:

			li $v0, 10
			syscall

