.data
string1:
.ascii "This is an example of a test for your function"
length1:
.int 49
string2:
.ascii "your"
length2:
.int 4

.text
.globl scan

scan : 
push %ebp
mov %esp,%ebp
push %ebx

###

mov $string1, %esi  #un pointeur pour string1
lea length1, %ecx
mov (%ecx), %ecx
mov $string2, %edi  #un pointeur pour string2
lea length2, %edx
mov (%edx), %edx
lea length2, %ebx
mov (%ebx), %ebx
mov $0, %eax

compare:
    cld
    inc %eax
    cmpsb   #compare esi et edi (str1 et str2)
    jne status
    je match

status:

    mov $string2, %edi  #un pointeur pour string2
    lea length2, %edx
    mov (%edx), %edx
    lea length2, %ebx
    mov (%ebx), %ebx

    loop compare
    jmp empty

match:
    #lea length2, %eax
    #mov (%eax), %eax
    dec %ebx
    cmp $0, %ebx
    jz found
    loop compare    #ecx decremente
    jmp found

found:
    mov $length2, %ebx
    mov (%ebx),%ebx
    subl %ebx, %eax
    jmp end

empty:
    mov $0, %eax

end:
###

pop %ebx
pop %ebp
ret
