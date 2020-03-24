@echo off
rem ########################################################
rem # Name:         servercheck.bat
rem # Creator:      Nathaniel Offer
rem # CreationDate: 2019.10.02
rem # LastModified: 2020.03.24
rem # Version: 0.3
rem #
rem # Description: Script to check availability of domain controller servers
title Overseas DC Server Check
color 0E
for /f "delims=" %%a in (%cd%\oservers.txt) do ping -n 2 %%a >nul && (echo %%a is pinging) || (echo %%a failed to respond)
pause & exit