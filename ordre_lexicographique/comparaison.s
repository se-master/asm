.data
string1:
.ascii "tes1"
length1:
.int 4
string2:
.ascii "teSw"
length2:
.int 4

.text
.globl comparaison

comparaison :
###
    #initialisation

    mov $string1, %esi  #un pointeur pour string1
    mov $string2, %edi  #un pointeur pour string2

    movw length1, %cx   #len1
    movw length2, %ax   #len2

    cmp %ax, %cx        #compare la len des str
    jb compare          #jb ou jl

    xchg %cx, %ax

compare:
    #LODSB             #LODSB: Loads a byte into the AL
    cld
    repe cmpsb
    je equal
    jg bigger

smaller:
    mov $255, %eax
    ret

bigger:
    mov $1, %eax
    ret

equal:
movl length1, %ecx
movl length2, %eax
cmpl %eax, %ecx
jg bigger
jl smaller
movl $0, %eax

pop %ebx
pop %ebp
###
ret
