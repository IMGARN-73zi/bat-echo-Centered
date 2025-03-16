@echo off
chcp 936 >nul
setlocal enabledelayedexpansion

set "str=孜雾灯编写"
set "t2=%str%"
set "s=━"

for /f "delims=" %%a in ('mode con ^| findstr "列"') do set "cols=%%a"
set "len1=%cols:    列:　　     =%"

set /a len2=-1
:1
if defined str (
    set "str=%str:~1%"
    set /a len2+=2
    goto 1
)

set /a d=len1 - len2
if !d! LEQ 4 (
    goto 溢出
)

set /a "k1=(!len1! - !len2! )/2 - 1"
set /a "k2=!len1! - !k1! - !len2! - 2"

set "cols1="
for /l %%i in (1,1,!k1!) do set "cols1=!cols1!!s!"
set "cols2="
for /l %%i in (1,1,!k2!) do set "cols2=!cols2!!s!"

for /f %%a in ('echo prompt $H ^| cmd') do set "t1=%%a"
set "t2=!cols1! !t2!!cols2!"
goto 输出

:溢出
set /a "len1=!len1!/2 *2 - 1"
set "t1=!s!"
for /l %%i in (1,1,%len1%) do set "t1=!t1!!s!"

:输出
echo !t1!
echo !t2!
echo !t1!
endlocal
pause>nul