org 0000H
main:
call light
call fan
sjmp main

;LED Lights on switch 0
light:
jnb P2.0, lights_on   
mov P1, #0FFH       
ret         
lights_on:
mov P1, #00H        
ret 

;Fan on switch 1
fan:
jnb P2.1, fan_off
setb P3.1    
ret
fan_off:
clr P3.1
ret

END
