.MODEL flat, stdcall

INCLUDELIB kernel32.lib

.DATA

string db "Hello World From Assembly!",0
string_len equ $-string

.CODE

GetStdHandle PROTO :DWORD
WriteFile    PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
ExitProcess  PROTO :DWORD

main PROC
    push -11
    call GetStdHandle
    
    xor ecx, ecx       ; 2
    push ecx           ; 1
    push ecx           ; 1
    push string_len    ; 5
    lea ebx, [string]  ; 6
    push ebx           ; 1
    push eax           ; 1
    call WriteFile     ; 5

    push ecx           ; 1
    call ExitProcess   ; 5
main ENDP

END main
