#
# Usage: ./calculator <op> <arg1> <arg2>
#

# Make `main` accessible outside of this module
.global main

# Start of the code section
.text

# int main(int argc, char argv[][])
main:
  # Function prologue
  enter $0, $0

  # Variable mappings:
  # op -> %r12
  # arg1 -> %r13
  # arg2 -> %r14
  movq 8(%rsi), %r12  # op = argv[1]
  movq 16(%rsi), %r13 # arg1 = argv[2]
  movq 24(%rsi), %r14 # arg2 = argv[3]


  # Hint: Convert 1st operand to long int
  movq %r13, %rdi
  call atol
  movq %rax, %r13

  # Hint: Convert 2nd operand to long int
  movq %r14, %rdi
  call atol
  movq %rax, %r14

  # Hint: Copy the first char of op into an 8-bit register
  # i.e., op_char = op[0] - something like mov 0(%r12), ???
  mov 0(%r12), %al

  cmpb $'+', %al
  je addition
  cmpb $'-', %al
  je subtraction
  cmpb $'*', %al
  je multiplication
  cmpb $'/', %al
  je division

  mov $inv, %r11
  jmp invalid
 
  addition:
	addq %r13, %r14
	movq %r14, %rsi	
	jmp done

  subtraction:
	subq %r14, %r13
	movq %r13, %rsi
	jmp done

  multiplication:
	imulq %r13, %r14
	movq %r14, %rsi
	jmp done

  division:
	cmpq $0, %r14
	movq $div_0, %r11
	je invalid
	
	movq %r13, %rax 
    	cqto   
	idivq %r14
	movq %rax, %rsi
	jmp done

  invalid:
	movq %r11, %rdi  # Set the format string to the "Unknown operation" message
	mov $0, %al
    	call printf
	leave
	ret
	

done:

 # movq %r14, %rsi
  movq $format, %rdi
  mov $0, %al
  call printf
  # Function epilogue
  leave
  ret


# Start of the data section
.data

format: 
  .asciz "%ld\n"

div_0:
   .asciz "Divide by zero\n"

inv:
  .asciz "Unknown operation\n"