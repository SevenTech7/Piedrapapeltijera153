include libmac.txt

data segment
    num1 db ?
    num2 db ?
    numx1 db ? 
    numx2 db ?
    cad db 09,09,09,"Piedra-Papel-Tijera 'The Game' $"
    cad0 db 10,13,"Reglas del juego: $"
    cad1 db 10,13,"Piedra=1  ***  Papel=2  ***  Tijera=3$" 
    cad2 db 10,10,13,"Jugador 1 - Ingrese su eleccion$"
    cad3 db 10,13,"Computadora 'PC' - Ingresando eleccion...$"
    cadx1 db " ->  Eligio Piedra$"
    cadx2 db " ->  Eligio Papel$"
    cadx3 db " ->  Eligio Tijera$"
    cadw1 db 10,10,13,"Jugador 1 es el GANADOR$"   
    cadw2 db 10,10,13,"Computadora 'PC' es el GANADOR$"
    cadw3 db 10,10,13,"***Empate***$"   
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov dx, offset cad
    mostrarcad
    mov dx, offset cad0
    mostrarcad 
    mov dx, offset cad1
    mostrarcad 
    mov dx, offset cad2
    mostrarcad
    
    salto
    
    seleccion
    mov numx1, bl
    mostrarselec numx1 
    
    mov dx, offset cad3
    mostrarcad
    
    salto
    
    seleccionPC
    mov numx2, bh
    mostrarsalec numx2
    
    ganador numx1, numx2  
    
    mov ax, 4c00h
    int 21h  
          
ends

end start
