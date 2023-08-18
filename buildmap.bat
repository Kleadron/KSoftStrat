@echo off

REM Change this variable to whatever directory you cloned the
REM Quake 2 source code into:
set quake2repo="C:\GitHub\Quake-2"

set map=%1

REM pushd tools\mapcompilers2\Windows64

rem copy .\ksoft\maps\%map%.map .\working
echo --------------QBSP--------------
tools\mapcompilers2\Windows64\4bsp.exe -moddir ksoft/ -basedir baseq2/ -gamedir ./ ksoft\maps\%map% 

echo --------------VIS---------------
tools\mapcompilers2\Windows64\4vis.exe -moddir ksoft/ -basedir baseq2/ -gamedir ./ ksoft\maps\%map% 

echo -------------LIGHT--------------
tools\mapcompilers2\Windows64\4rad.exe -moddir ksoft/ -basedir baseq2/ -gamedir ./ ksoft\maps\%map% 

rem copy .\working\%map%.bsp .\ksoft\maps



echo --------------RUN---------------
rem pushd ksoft\maps
rem copy %map%.bsp %quake2repo%\ksoft\maps
rem pushd %quake2repo%
call debug\Quake2.exe +map %1 +set game ksoft +set developer 1

rem popd
rem popd



