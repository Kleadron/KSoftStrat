@echo off

REM Change this variable to whatever directory you cloned the
REM Quake 2 source code into:
set quake2repo="C:\GitHub\Quake-2"

set map=%1

REM pushd tools\mapcompilers2\Windows64

rem copy .\ksoft\maps\%map%.map .\working
echo --------------QBSP--------------
tools\q2tool.exe -bsp -moddir ksoft/ -basedir baseq2/ ksoft\maps\%map% 

echo --------------VIS---------------
tools\q2tool.exe -vis -moddir ksoft/ -basedir baseq2/ ksoft\maps\%map% 

echo -------------LIGHT--------------
tools\q2tool.exe -rad -moddir ksoft/ -basedir baseq2/ ksoft\maps\%map%

rem copy .\working\%map%.bsp .\ksoft\maps



echo --------------RUN---------------
rem pushd ksoft\maps
rem copy %map%.bsp %quake2repo%\ksoft\maps
rem pushd %quake2repo%
call debug\quake2_324.exe +map %1 +set game ksoft +set developer 1

rem popd
rem popd



