org 0000H

;AC on switch 2
;inc temperature using switch 3
;dec temperature using switch 4
mov 20H, #01H
mov 21H, #06H

check_condition:
jnb p2.2, airc_on
mov p1, #0FFH
sjmp check_condition

airc_on:
mov dptr, #30H
setb p3.3
setb p3.4
mov a, 20H
acall display

mov p1, #0FFH
clr p3.3
setb p3.4
mov a, 21H
acall display
mov p1, #0FFH
jnb p2.3, incr
jnb p2.4, decr
sjmp check_condition 

org 30H
digits:
db 0C0H, 0F9H, 0A4H, 0B0H, 99H, 92H, 82H, 0F8H, 80H, 90H

display:
movc a, @a+dptr
mov p1, a
ret

incr:
mov a, 21H            
cjne a, #09H, inc_ok  
mov 21H, #00H
inc 20H
sjmp airc_on

inc_ok:
inc 21H 
sjmp airc_on

decr:
mov a, 21H
cjne a, #00H, dec_ok
mov 21H, #09H
dec 20H
sjmp airc_on

dec_ok:
dec 21H
sjmp airc_on

END