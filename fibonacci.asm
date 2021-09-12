.model small

.stack 100H  

FIBONACCI proc
    
    push BP
    mov  BP, SP
    
    sub  [BP-12], -1
    
    mov [BP-12], -1 ; move -1 para end. onde ficaria
                    ; variavel fib
    mov [BP-4], 1   ; move 1 para end. onde ficaria
                    ; variavel t_1 
    
    mov [BP-8], 0   ; move 1 para end. onde ficaria
                    ; variavel t_2. 
    jmp LACO_FIB

OPS_FIB:

LACO_FIB:
    
    cmp [BP+8], 1 ; Valor passado como parametro agor
                  ; agora esta na pilha, sendo acessado
                  ; acima do BP
    jg OPS_FIB
    mov AX, [BP+8]
    
    ret
endp

MAIN:     

    mov AX, @DATA
    mov DS, AX 

    mov  [BP-4], 5 
    push [BP-4]   ; o valor de parametro eh salvo na 
                  ; pilha para ser passado para a funcao
                  ; fibonacci. Como [BP-4] foi empilhado,
                  ; ele agora sera acessado na pilha  
    
    
    call FIBONACCI
                  
    mov AH, 4ch
    int 21h
    
end MAIN