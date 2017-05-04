###############################################################################
# Title: Assign02P3                     Author: Luis Pena
# Class: CS 2318-251, Spring 2015         Submitted: <date>
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################
##include <iostream>
#using namespace std;
################################ Data Segment ########################################
		.data
#int a1[12],
#    a2[12],
#    a3[12];
a1:		.space 48
a2:		.space 48
a3:		.space 48
einStr:		.asciiz "Enter integer #"
moStr: 		.asciiz "Max of "
ieStr:		.asciiz " ints entered..."
emiStr:		.asciiz "Enter more ints? (n or N = no, others = yes) "
begA1Str:	.asciiz "beginning a1: "
nn09A1Str:	.asciiz "a1 (noneg09): "
procA1Str:	.asciiz "processed a1: "
procA2Str:	.asciiz "          a2: "
procA3Str:	.asciiz "          a3: "
dacStr:		.asciiz "Do another case? (n or N = no, others = yes) "
dlStr:		.asciiz "================================"
byeStr:		.asciiz "bye..."
#int main()
#{
################################ Code Segment #########################################
		.text
		.globl main
main:
##########################################
# Register Usage
##########################################
# $t0: hopPtr11
# $t1: hopPtr1
# $t2: hopPtr2
# $t3: hopPtr3
# $t4: endPtr1
# $t5: endPtr2
# $t6: endPtr3
# $t7: used1
# $t8: used2
# $t9: used3
# $a1: target
# $a2: intHolder
# $s1: count
# $s2: iter
# $s3: shortlived variables
# $s4: shortlived variables
# $v1: reply
##########################################
#            char reply;
#            int used1,
#                used2,
#                used3,
#                target,
#                intHolder,
#               count,
#               iter,
#                *hopPtr1,
#                *hopPtr11,
#                *hopPtr2,
#                *hopPtr3,
#                *endPtr1,
#                *endPtr2,
#                *endPtr3;

#            reply = 'y';
		li $v1, 'y'
#            goto WTest1;
            	j WTest1
begW1:
#            used1 = 0;
		li $t7, 0
#            hopPtr1 = a1;
		la $t1, a1
#            goto WTest2;
            	j WTest2
begW2:
#            cout << einStr;
		li $v0, 4
		la $a0, einStr
		syscall
#            cout << (used1 + 1);            	
            	li $v0, 1
            	addi $a0, $t7, 1
            	syscall
#            cout << ':' << ' ';
		li $v0, 11
		li $a0, ':'
		syscall
		li $v0, 11
		li $a0, ' '
		syscall
#            cin >> *hopPtr1;
            	li $v0, 5
            	syscall
            	#move $t1, $v0
            	lw $v0, 0($t1)
#            ++used1;
            	addi $t7, $t7, 1
#            ++hopPtr1;
            	addi $t1, $t1, 4
#            if (used1 >= 12) goto else1;
            	li $s3, 12     
            	bge $t7, $s3, else1
            
#            cout << emiStr;
		li $v0, 4
		la $a0, emiStr
		syscall
#            cin >> reply;
		li $v0, 12
		syscall
		move $v1, $v0
		
		li $v0, 11
		li $a0, '\n'
		syscall
		
#            goto endI1;
            	j endI1
else1:
#            cout << moStr << 12 << ieStr << endl;
            	li $v0, 4
            	la $a0, moStr
            	syscall
            	li $v0, 1
            	li $a0, 12
            	syscall
            	li $v0, 4
            	la $a0, ieStr
            	syscall
            	li $v0, 11
            	li $a0, '\n'
            	syscall
#            reply = 'n';
		li $v1, 'n'
endI1:
WTest2:         #if (reply == 'n') goto xitW2;
		li $s3, 'n'
		beq $v1, $s3, xitW2
#            if (reply != 'N') goto begW2;
            	li $s3, 'N'
		bne $v1, $s3, begW2
            
			
xitW2:

#            cout << begA1Str;
		li $v0, 4
		la $a0, begA1Str
		syscall
#            if (used1 <= 0) goto endI2;
            	blez $t7, endI2
#            hopPtr1 = a1;
		la $t1, a1
#            endPtr1 = a1 + used1;
		la $s3, a1
            	sll $t4, $t7, 2    #########################################################
		add $t4, $t4, $s3
begDW1:
#            cout << *hopPtr1 << ' ' << ' ';
            	li $v0, 1
            	lw $a0, 0($t1)
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
#            ++hopPtr1;
            	addi $t1, $t1, 4
DWTest1:        #if (hopPtr1 < endPtr1) goto begDW1;
		blt $t1, $t4, begDW1
endI2:
#            cout << endl;
		li $v0, 11
		li $a0, '\n'
		syscall

#            if (used1 <= 0) goto endI3;
            	blez $t7, endI3
#            hopPtr1 = a1;
            	la $t1, a1
#            endPtr1 = a1 + used1;
		la $s3, a1
            	sll $t4, $t7, 2    #########################################################
		add $t4, $t4, $s3
#            goto FTest1;
            	j FTest1
begF1:
#            target = *hopPtr1;
            	lw $a1, 0($t1)
#            if (target < 0) goto goodI4;
            	bltz $a1, goodI4
            
#            if (target <= 9) goto endI4;
            	li $s3, 9         
            	ble $a1, $s3, endI4
goodI4:
#            hopPtr11 = hopPtr1 + 1;
            	addi $t0, $t1, 4
begF2:
#            *(hopPtr11 - 1) = *hopPtr11;
            	lw $s3, 0($t0)
            	sw $s3, -4($t0)
#            ++hopPtr11;
            	addi $t0, $t0, 4
FTest2:         #if (hopPtr11 < endPtr1) goto begF2;
		blt $t0, $t4, begF2
#            --used1;
            	addi $t7, $t7, -1
#            --endPtr1;
            	addi $t4, $t4, -4  ############################################
#            --hopPtr1;
            	addi $t1, $t1, -4
endI4:
#            ++hopPtr1;
            	addi $t1, $t1, 4
FTest1:         #if (hopPtr1 < endPtr1) goto begF1;
		blt $t1, $t4, begF1
#            cout << nn09A1Str;
            	li $v0, 4
            	la $a0, nn09A1Str
            	syscall
#            if (used1 <= 0) goto endI5;
            	blez $t7, endI5
#            hopPtr1 = a1;
            	la $t1, a1
#            endPtr1 = a1 + used1;
		la $s3, a1
            	sll $t4, $t7, 2    #########################################################
		add $t4, $t4, $s3
begDW2:
#            cout << *hopPtr1 << ' ' << ' ';
            	li $v0, 1
            	lw $a0, 0($t1)
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
#            ++hopPtr1;
            	addi $t1, $t1, 4
DWTest2:        #if (hopPtr1 < endPtr1) goto begDW2;
		blt $t1, $t4, begDW2
endI5:
#            cout << endl;
            	li $v0, 11
            	li $a0, '\n'
            	syscall

#            used2 = 0;
            	li $t8, 0
#            used3 = 0;
            	li $t9, 0
#            hopPtr1 = a1;
            	la $t1, a1
#            hopPtr2 = a2;
            	la $t2, a2
#            hopPtr3 = a3;
            	la $t3, a3
#            endPtr1 = a1 + used1;
		la $s3, a1
            	sll $t4, $t7, 2    #########################################################
		add $t4, $t4, $s3
#            goto WTest3;
            	j WTest3
begW3:
#            intHolder = *hopPtr1;
            	lw $a2, 0($t1)
#            *hopPtr2 = intHolder;
            	sw $a2, 0($t1)
#            ++used2;
            	addi $t8, $t8, 1
#            ++hopPtr2;
            	addi $t2, $t2, 4
#            *hopPtr3 = intHolder;
            	sw $a2, 0($t3)
#            ++used3;
            	addi $t9, $t9, 1
#            ++hopPtr3;
            	addi $t3, $t3, 4
#            ++hopPtr1;
            	addi $t1, $t1, 4
WTest3:         #if (hopPtr1 < endPtr1) goto begW3;
		blt $t1, $t4, begW3

#            iter = 0;
            	li $s2, 0
begDW3:
#            ++iter;
            	addi $s2, $s2, 1
#            count = 0;
            	li $s1, 0
#            if (iter != 1) goto else6;
            	li $s3, 1         
            	bne $s2, $s3, else6
#            hopPtr1 = a1;
            	la $t1, a1
#            endPtr1 = a1 + used1;
		la $s3, a1
            	sll $t4, $t7, 2    #########################################################
		add $t4, $t4, $s3
#            goto FTest3;
            j FTest3
begF3:
#            target = *hopPtr1;
            	lw $a1, 0($t1)
#            if (target == 5) goto else7;
            	li $s3, 5        
            	beq $a1, $s3, else7
#            ++count;
            	addi $s1, $s1, 1
#            goto endI7;
            	j endI7
else7:
#            if (count == 0) goto endI8;
            	beqz $s1, endI8
#            *(hopPtr1 - count) = *hopPtr1;
            	
            	
            	lw $s3, 0($t1)
            	sll $s4, $s1, 2
            	sub $t1, $t1, $s4   ############################################
            	
            	sw $s3, 0($t1)
            	
endI8:
endI7:
#            ++hopPtr1;
            	addi $t1, $t1, 4
FTest3:         #if (hopPtr1 < endPtr1) goto begF3;
		blt $t1, $t4, begF3
#            used1 -= count;
            	sub $t7, $t7, $s1
            #if (used1 != 0) goto endI9;
            	bnez $t7, endI9
#            hopPtr1 = a1;
            	la $t1, a1
#            *hopPtr1 = -99;
            	li $s3, -99         ###############################################
            	sw $s3, 0($t1)
#            ++used1;
            	addi $t7, $t7, 1
endI9:
            #goto endI6;
            	j endI6
else6:
#            if (iter != 2) goto elseI10;
            	li $s3, 2        
            	bne $s2, $s3, elseI10
#            hopPtr2 = a2;
            	la $t2, a2
#            endPtr2 = a2 + used2;
		la $s3, a2
            	sll $t5, $t8, 2    #########################################################
		add $t5, $t5, $s3
#            goto FTest4;
            	j FTest4
begF4:
#            target = *hopPtr2;
            	lw $a1, 0($t2)
#            if (target <= 4) goto elseI11;
            	li $s3, 4        
            	ble $a1, $s3, elseI11
#            ++count;
            	addi $s1, $s1, 1
#            goto endI11;
            	j endI11
elseI11:
#            if (count == 0) goto endI12;
            	beqz $s1, endI12
#            *(hopPtr2 - count) = *hopPtr2;
            	lw $s3, 0($t2)
            	sll $s4, $s1, 2
            	sub $t2, $t2, $s4   ############################################
            	sw $s3, 0($t2)
endI12:
endI11:
#            ++hopPtr2;
            	addi $t2, $t2, 4
FTest4:         #if (hopPtr2 < endPtr2) goto begF4;
		blt $t2, $t5, begF4
#            used2 -= count;
            	sub $t8, $t8, $s1
#            if (used2 != 0) goto endI13;
            	bnez $t8, endI13
#            hopPtr2 = a2;
            	la $t2, a2
#            *hopPtr2 = -99;
            	li $s3, -99         ###############################################
            	sw $s3, 0($t2)
#            ++used2;
            	addi $t8, $t8, 1
endI13:
#            goto endI10;
            	j endI10
elseI10:
#            hopPtr3 = a3;
            	la $t3, a3
#            endPtr3 = a3 + used3;
		la $s3, a3
            	sll $t6, $t9, 2    #########################################################
		add $t6, $t6, $s3
#            goto FTest5;
            	j FTest5
begF5:
#            target = *hopPtr3;
            	lw $a1, 0($t3)
#            if (target >= 6) goto elseI14;
            	li $s3, 6       
            	bge $a1, $s3, elseI14
#            ++count;
            	addi $s1, $s1, 1
#            goto endI14;
            	j endI14
elseI14:
#            if (count == 0) goto endI15;
            	beqz $s1, endI15
            	
#            *(hopPtr3 - count) = *hopPtr3;
            	lw $s3, 0($t3)
            	sll $s4, $s1, 2
            	sub $t3, $t3, $s4   ############################################
            	sw $s3, 0($t3)
endI15:
endI14:
#            ++hopPtr3;
            	addi $t3, $t3, 4
FTest5:         #if (hopPtr3 < endPtr3) goto begF5;
		blt $t3, $t6, begF5
#            used3 -= count;
            	sub $t9, $t9, $s1
#            if (used3 != 0) goto endI16;
            	bnez $t9, endI16
#            hopPtr3 = a3;
            	la $t3, a3
#            *hopPtr3 = -99;
            	li $s3, -99         ###############################################
            	sw $s3, 0($t3)
#            ++used3;
            	addi $t9, $t9, 1
endI16:
endI10:
endI6:
DWTest3:        #if (iter < 3) goto begDW3;
		li $s3, 3        
		blt $s2, $s3, begDW3
endI3:

#            cout << procA1Str;
            	li $v0, 4
            	la $a0, procA1Str
            	syscall
#            if (used1 <= 0) goto endI17;
            	blez $t7, endI17
#            hopPtr1 = a1;
            	la $t1, a1
#            endPtr1 = a1 + used1;
		la $s3, a1
            	sll $t4, $t7, 2    #########################################################
		add $t4, $t4, $s3
begDW4:
#            cout << *hopPtr1 << ' ' << ' ';
            	li $v0, 1
            	lw $a0, 0($t1)
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
#            ++hopPtr1;
            	addi $t1, $t1, 4
DWTest4:        #if (hopPtr1 < endPtr1) goto begDW4;
		blt $t1, $t4, begDW4
endI17:
#            cout << endl;
            	li $v0, 11
            	li $a0, '\n'
            	syscall

#            cout << procA2Str;
            	li $v0, 4
            	la $a0, procA2Str
            	syscall
#            if (used2 <= 0) goto endI18;
            	blez $t8, endI18
#            hopPtr2 = a2;
            	la $t2, a2
#            endPtr2 = a2 + used2;
		la $s3, a2
            	sll $t5, $t8, 2    #########################################################
		add $t5, $t5, $s3
begDW5:
#            cout << *hopPtr2 << ' ' << ' ';
            	li $v0, 1
            	lw $a0, 0($t2)
            	syscall
#            ++hopPtr2;
            	addi $t2, $t2, 4
DWTest5:        #if (hopPtr2 < endPtr2) goto begDW5;
		blt $t2, $t5, begDW5
endI18:
#            cout << endl;
            	li $v0, 11
            	li $a0, '\n'
            	syscall

#            cout << procA3Str;
            	li $v0, 4
            	la $a0, procA3Str
            	syscall
#            if (used3 <= 0) goto endI19;
            	blez $t9, endI19
#            hopPtr3 = a3;
            	la $t3, a3
#            endPtr3 = a3 + used3;
		la $s3, a3
            	sll $t6, $t9, 2    #########################################################
		add $t6, $t6, $s3
            	
begDW6:
#            cout << *hopPtr3 << ' ' << ' ';
            	li $v0, 1
            	lw $a0, 0($t3)
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
            	li $v0, 11
            	li $a0, ' '
            	syscall
#            ++hopPtr3;
            	addi $t3, $t3, 4
DWTest6:        #if (hopPtr3 < endPtr3) goto begDW6;
		blt $t3, $t6, begDW6
endI19:
#            cout << endl;
		li $v0, 11
		li $a0, '\n'
		syscall

#            cout << dacStr;
		li $v0, 4
		la $a0, dacStr
		syscall
#            cin >> reply;
		li $v0, 12
		syscall
		move $v1, $v0
		
		li $v0, 11
		li $a0, '\n'
		syscall
		
		
		

WTest1:          #if (reply == 'n') goto xitW2;
		li $s3, 'n'
		beq $v1, $s3, xitW1
#            if (reply != 'N') goto begW2;
            	li $s3, 'N'
		bne $v1, $s3, begW1
xitW1:

#            cout << dlStr << '\n';
            	li $v0, 4
            	la $a0, dlStr
            	syscall
            	li $v0, 11
            	li $a0, '\n'
            	syscall
#            cout << byeStr << '\n';
            	li $v0, 4
            	la $a0, byeStr
            	syscall
            	li $v0, 11
            	li $a0, '\n'
            	syscall
#            cout << dlStr << '\n';
            	li $v0, 4
            	la $a0, dlStr
            	syscall
            	li $v0, 11
            	li $a0, '\n'
            	syscall

#            return 0;
#}
