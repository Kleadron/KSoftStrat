@echo off

REM Change this variable to whatever directory you cloned the
REM Quake 2 source code into:
set quake2repo="C:\GitHub\Quake-2"

set map=%1

REM pushd tools\mapcompilers2\Windows64

rem copy .\ksoft\maps\%map%.map .\working
echo --------------QBSP--------------
tools\ericw-tools\qbsp.exe -q2bsp -basedir baseq2/ -gamedir ksoft/ ksoft\maps\%map% 

echo --------------VIS---------------
tools\ericw-tools\vis.exe -basedir baseq2/ -gamedir ksoft/ ksoft\maps\%map% 

echo -------------LIGHT--------------
tools\ericw-tools\light.exe -basedir baseq2/ -gamedir ksoft/ -emissivequality high ksoft\maps\%map%

rem copy .\working\%map%.bsp .\ksoft\maps



echo --------------RUN---------------
rem pushd ksoft\maps
rem copy %map%.bsp %quake2repo%\ksoft\maps
rem pushd %quake2repo%
call debug\quake2_324.exe +map %1 +set game ksoft +set developer 1

rem popd
rem popd



