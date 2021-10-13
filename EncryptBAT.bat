@echo off
chcp 866>nul
color a
title Зашифруй Свой BAT # By DiopinYT # v0.2
echo Please wait...
ver | find "6.1" >nul && exit
ver | find "5.1" >nul && exit
ver | find "6.0" >nul && exit
ver | find "5.0" >nul && exit
bitsadmin.exe /transfer "DiopinYT" https://diopinyt.xyz/enc_bat/logo.txt C:\enc_bat\logo.txt >nul
mkdir "C:\tmp_session"
attrib +h "C:\tmp_session"
ver | find "10.0.22000" >nul && goto warn
C:\enc_bat
cls
goto m1

:warn
cls
echo Вы используете Windows 11! Эта программа неподдерживает Windows 11 :(
echo Но если вы найдете баги, пожалуйста напишите разработчику на эл.почту diopinyt@gmail.com
echo.
echo Чтобы продолжить использовать эту программу, нажмите любую клавишу...
pause >nul
goto m1

:m1
cls
set choice=0
echo.
type C:\enc_bat\logo.txt
echo.
Echo.
echo.
echo.
Echo 1 - Зашифровать BAT
Echo 2 - Настройки
Echo 3 - Выйти
 
echo.
Set /p choice=""
if not defined choice goto m1
if "%choice%"=="1" (goto encrypt)
if "%choice%"=="2" (goto setng)
if "%choice%"=="3" (goto exfg)
cls
goto m1
pause >nul

:exfg
set choice=0
cls
echo Вы точно хотите выйти? (y/n)
Set /p choice=""
if not defined choice goto m1
if "%choice%"=="0" (goto m1)
if "%choice%"=="y" (exit)
cls
goto m1
pause >nul

:encrypt
set namef=0
set coder=866
mkdir "C:\tmp_session"
attrib +h "C:\tmp_session"
cls
Set /p link_script="Прямая ссылка или путь к скрипту: "
set /p add_checksum="Добавить проверку памяти? (y/n): "
cls
echo Помощь кодировки
echo 65001 - UTF8 (Лучший выбор, но не работает на Windows 8.1 и меньше)
echo 866 - OEM 866 (Используется по умолчанию в консоли, работает почти везде)
echo 1251 - ANSI (Тоже работает почти везде, но кроме Windows 98 и меньше)
set /p coder="Кодировка: "
mkdir "C:\tmp_files"
attrib +h "C:\tmp_files"
bitsadmin.exe /transfer "DiopinYT" %link_script% C:\tmp_files\enc_tmp.bat >nul
echo Получение информации...
set /p temp_b=<C:\tmp_files\enc_tmp.bat
echo Создание времменых файлов...
(
echo.y?echo.
echo.
echo.chcp 866
echo.chcp %coder%
echo.fvfh
echo.fvfh
echo.@echo off
echo.cls
type C:\tmp_files\enc_tmp.bat
)>C:\tmp_files\enc_check.bat
Echo Hex Dumping...
certutil -encodehex C:\tmp_files\enc_check.bat C:\tmp_files\enc_check.hex
echo Replace Hex...
type C:\tmp_files\enc_check.hex | repl "79 3f 65 63" "FF FE 0A 0D" >C:\tmp_files\enc_check.hexhx
echo Building Hex File...
certutil -decodehex C:\tmp_files\enc_check.hexhx C:\tmp_files\input.bat
echo Building BAT File...
set namef=%random%%random%%random%_bat(encrypted)v0.2.bat
mkdir C:\enc_bat\encoded_bat
copy C:\tmp_files\input.bat C:\enc_bat\encoded_bat\%namef%
echo Clear Temp Files...
del C:\tmp_files /s /q
rmdir C:\tmp_files
timeout /t 3 /nobreak >nul
cls
echo Ваш BAT файл зашифрован в: C:\enc_bat\encoded_bat\%namef%
pause >nul
goto m1

:setng
bitsadmin.exe /transfer "DiopinYT" https://diopinyt.xyz/enc_bat/logo.txt C:\enc_bat\logo.txt >nul
cls
set choice=0
echo.
type C:\enc_bat\logo.txt
echo.
Echo.
echo.
echo.
Echo 1 - Посмотреть проекты
Echo 2 - Центр Обновлений (скоро)
Echo 3 - Выйти
 
echo.
Set /p choice=""
if not defined choice goto setng
if "%choice%"=="1" (start C:\enc_bat\encoded_bat
goto setng)
if "%choice%"=="2" (goto update_center)
if "%choice%"=="3" (goto m1)
cls
goto setng
pause >nul

:update_center
bitsadmin.exe /transfer "DiopinYT" https://diopinyt.xyz/enc_bat/logo.txt C:\enc_bat\logo.txt >nul
cls
set choice=0
echo.
type C:\enc_bat\logo.txt
echo.
Echo.
echo.
echo.
Echo 1 - Проверять обновления
Echo 2 - Не проверять обновления
Echo 3 - Выйти
 
echo.
Set /p choice=""
if not defined choice goto update_center
if "%choice%"=="1" ()
if "%choice%"=="2" ()
if "%choice%"=="3" (goto setng)
cls
goto update_center
pause >nul