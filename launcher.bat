@echo off
chcp 866>nul
color a
title ������ ���� BAT # By DiopinYT # Checking Updates...
echo Please wait...
ver | find "6.1" >nul && exit
ver | find "5.1" >nul && exit
ver | find "6.0" >nul && exit
ver | find "5.0" >nul && exit
bitsadmin.exe /transfer "DiopinYT" http://diopinyt.xyz/enc_bat/latest_version.txt C:\enc_bat\latest_version.txt >nul
mkdir "C:\tmp_session"
attrib +h "C:\tmp_session"
ver | find "10.0.22000" >nul && goto warn
C:\enc_bat
cls
goto upd

:warn
cls
echo �� �ᯮ���� Windows 11! �� �ணࠬ�� �������ন���� Windows 11 :(
echo �� �᫨ �� ������ ����, �������� ������ ࠧࠡ��稪� �� �.����� diopinyt@gmail.com
echo.
echo �⮡� �த������ �ᯮ�짮���� ��� �ணࠬ��, �������� 3 ᥪ㭤�...
timeout /t 3 /nobreak >nul
goto upd

:upd
cls
find /I latest_version.txt "0.2"
if %errorlevel% equ 0 (
  goto launch
) else (
    goto update
  )

:update
bitsadmin.exe /transfer "DiopinYT" http://diopinyt.xyz/enc_bat/update.exe C:\enc_bat\update.exe
start C:\enc_bat\update.exe
del C:\enc_bat\latest_version.txt
exit

:launch
del C:\enc_bat\latest_version.txt
start C:\enc_bat\EncryptBAT.bat
cls 
exit