.data
string1:
.asciz "This is a TEST, of the conversion program!\n"
length:
.int 43 

.text
.globl main

main : 
    push %ebp
    mov %esp,%ebp
    push %ebx
    movl length, %ecx

mov $string1, %esi  #un pointeur pour comparer
mov $string1, %edi  #un pointeur pour remplacer
CLD                 #Routine d'incrementation de esi/edi

compare:               #Verifie si le pointeur pointe une minuscule
    LODSB               #LODSB: Loads a byte into the AL
    cmpb $0x61, %al #compare 0x61 avec le char actuel
    jb noconvert    #si al est plus petit, ne convertit pas
    cmpb $0x7a, %al #compare 0x7a avec le char actuel
    ja noconvert    #si al est plus grand, ne convertit pas
    jmp convert     #Les conditions montrent que c'est une minuscule

convert:
    sub $0x20, %al  #Soustrait 20 en hexa afin de convertir la minuscule en majuscule
    STOSB           #Remplace le char dans la string
    jmp check       #Va verifier si la string est fini

noconvert:
    #remplace le char dans la string, car pas minuscule (A,.!)
    STOSB           #Si on ne modifie pas pourquoi le STOSB? A voir
    jmp check       #Va verifier si la string est fini

check:
    cmp $0, %ecx   #compare lenght avec ecx (esi incremente a cause de CLD
    jz show
    loop compare

show:
    pushl $string1  #-4 sur le pointeur esp
    call printf     #Affiche la nouvelle string
    addl $4, %esp   #(toujours faire un addl apres un push)
                    #incremente de 4 pour remettre le pointeur a sa place

#remettre la pile comme on l'a trouvee
pop %ebx
pop %ebp
ret
