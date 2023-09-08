@echo off

IF NOT EXIST ..\build mkdir ..\build
pushd ..\build
ml /c /coff ..\code\hello_world.asm
link /merge:.data=.text /merge:.rdata=.text /align:16 hello_world.obj /subsystem:console
del hello_world.obj
popd
