@echo off
chcp 866>nul
color a
title Зашифруй Свой BAT # By DiopinYT # Checking Updates...
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
echo Вы используете Windows 11! Эта программа неподдерживает Windows 11 :(
echo Но если вы найдете баги, пожалуйста напишите разработчику на эл.почту diopinyt@gmail.com
echo.
echo Чтобы продолжить использовать эту программу, подождите 3 секунды...
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