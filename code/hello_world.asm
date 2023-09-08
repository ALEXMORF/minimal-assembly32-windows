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
    
    xor ecx, ecx
    push ecx
    push ecx
    push string_len
    lea ebx, [string]
    push ebx
    push eax
    call WriteFile

    push ecx
    call ExitProcess
main ENDP

END main
