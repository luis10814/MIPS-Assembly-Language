###############################################
#                  Luis Pena                  #
#           Assignment 2 Part 1 A             #
###############################################


	.data
	
IntPro:	.asciiz		"Enter an integer: "
StrPro: .asciiz		"Enter a string no more than 35 characters long: "
ChrPro:	.asciiz		"Enter a Character: "
IntMsg:	.asciiz		"You Entered an integer number "
StrMsg:	.asciiz		"You Entered a string that says "
ChrMsg:	.asciiz		"You Entered a character "
Str:	.space 36
	.globl		main
	.text
	
main:
	li	$v0, 4
	la	$a0, IntPro  	#print message
	syscall
	
	
	li 	$v0, 5		#read Int
	syscall
	
	move	$t1, $v0	#move entered Int into $t1
	
	
	li	$v0, 4
	la	$a0, StrPro	#print message
	syscall
	
	
	li	$v0, 8
	la	$a0, Str	#read String
	li	$a1, 36
	syscall
	
	li 	$v0, 4
	la	$a0, ChrPro	#print message
	syscall
	
	
	li	$v0, 12		#read Char
	syscall
	
	move	$t2, $v0	#move entered Char into $t2
	
	
	li 	$v0, 11
	li 	$a0, '\n'	#print blank line
	syscall
	
	li	$v0, 11
	li	$a0, '\n'
	syscall
	
	li	$v0, 4
	la	$a0, IntMsg
	syscall
	
	li	$v0, 1
	move	$a0, $t1	#print Integer entered
	syscall
	
	li 	$v0, 11
	li 	$a0, '\n'	#print blank line
	syscall
	
	li	$v0, 4
	la	$a0, StrMsg
	syscall
	
	li	$v0, 4
	la	$a0, Str	#print String entered
	syscall
	
	li	$v0, 4
	la	$a0, ChrMsg
	syscall
	
	li	$v0, 11		#print Char entered
	move	$a0, $t2
	syscall
	
	
	li $v0, 10		# exit gracefully
        syscall
