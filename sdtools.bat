@ECHO off
REM #############################################################
REM # Name:         SD.bat
REM # Creator:      Nathaniel Offer
REM # CreationDate: 2019.10.02
REM # LastModIFied: 2020.02.11
REM # Version: 0.4
REM #
REM # Description: Script to enable quick access to network tools

REM # Check and Create Directory
SETLOCAL
:checkdir
IF EXIST C:\Config\SD_Tool\ GOTO PROMPT
:makedir
MD C:\Config\SD_Tool\
:setdir
SET sdfolder=C:\Config\SD_Tool\

:prompt
color 0B
CLS

:restart
TITLE Service Desk Network Tools
ECHO ========================
ECHO == SD Network Tools ==
ECHO    ================
ECHO == ENTER HOST ID:   ==
ECHO =======================
SET /p host="HOST ID = "

:options
CLS
ECHO ========================
ECHO == MENU OPTIONS: %host%
ECHO ========================
ECHO  1 - QUICK PING
ECHO  2 - CONTINUOUS PING
ECHO  3 - REGIONAL SERVER PING
ECHO  4 - O/S SERVER PING
ECHO  5 - WIN EXPLORER C$ share
ECHO  6 - NSLOOKUP ^> Clipboard
ECHO      ==============
ECHO  R - RESET TO ANOTHER ID
ECHO  T - TRACERT
ECHO  C - OPEN CMD WINDOW
ECHO  X - EXIT PROGRAM
ECHO ========================
SET "input=R"
SET /p input="Enter Option Here: "

IF "%input%"=="1" GOTO:PING
IF "%input%"=="2" GOTO:PINGLOOP
IF "%input%"=="3" GOTO:RSERVERPING
IF "%input%"=="4" GOTO:OSERVERPING
IF "%input%"=="5" GOTO:EXPLORER
IF "%input%"=="6" GOTO:NSLOOKUP
IF /I "%input%"=="r" GOTO:RESET
IF /I "%input%"=="t" GOTO:TRACERT
IF /I "%input%"=="c" GOTO:CMD
IF /I "%input%"=="x" GOTO:exit

ECHO Please choose from the Options listed above!
pause
GOTO:options

:PING
ping "%host%"
pause
GOTO:options

:PINGLOOP
start cmd /k ping "%host%" -t
GOTO:options

:RSERVERPING
start cmd /k rservercheck.bat
GOTO:options

:OSERVERPING
start cmd /k oservercheck.bat
GOTO:options

:EXPLORER
explorer "\\%host%\C$"
GOTO:options

:TRACERT
tracert %host%
pause
GOTO:options

:NSLOOKUP
nslookup %host% | clip
GOTO:options

:RESET
CLS
GOTO:restart

:cmd
start cmd
GOTO:options

:exit
ENDLOCAL
exit