.data
str_1: .asciiz "please input the value of variable a: "
str_2: .asciiz "please input the value of variable b: "
str_3: .asciiz "the larger value of a,b is: "

.text #Print prompt a
li $v0, 4
la $a0, str_1
syscall

li $v0, 5 #take in int and assign to a
syscall
move $t0, $v0

li $v0, 4 #Print prompt b
la $a0, str_2
syscall

li $v0, 5 #take in int and assign to b
syscall
move $t1, $v0

blt $t0, $t1, temp_b #compare a and b
move $t2, $t0
j print_result

temp_b: 
move $t2, $t1

print_result: #print the larger value between a and b
li $v0, 4
la $a0, str_3
syscall

li $v0, 1
move $a0, $t2 #move large value (a or b) into $a0
syscall

li $v0, 10
syscall