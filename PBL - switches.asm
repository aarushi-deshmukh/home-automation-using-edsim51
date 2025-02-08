main:
mov 20H, P2 
mov A, 20H
mov R0, #00H
mov R1, #08H
count_switches:
rlc A
jc down
djnz R1, count_switches
down:
inc R0
djnz R1, count_switches

mov A, R0
cjne A, #04H, not_equal
jz alert
sjmp main

not_equal:
cjne A, #03H, alert
cjne A, #02H, alert
cjne A, #01H, alert
acall alert
ret

alert:
mov p1, #00H
ret

END
