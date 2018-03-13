@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Have you changed the version number and exported both .ttf and .woff? (Y/[N])?
IF /I "%AREYOUSURE%" == "E" GOTO EXPORT
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
set /P ver=Enter Version: 
mkdir "..\release\PrimaryLines-%ver%"
copy "..\FONTLOG.txt" "..\release\PrimaryLines-%ver%\"
copy "..\OFL.txt" "..\release\PrimaryLines-%ver%\"
copy "..\ReadMe.txt" "..\release\PrimaryLines-%ver%\"
copy "*.ttf" "..\release\PrimaryLines-%ver%\"
copy "*.otf" "..\release\PrimaryLines-%ver%\"
mkdir "..\release\PrimaryLines-%ver%\web\"
copy "*.woff" "..\release\PrimaryLines-%ver%\web\"
CScript  zip.vbs  "..\release\PrimaryLines-%ver%"  "..\release\PrimaryLines Current.zip
CScript  zip.vbs  "..\release\PrimaryLines-%ver%"  "..\release\PrimaryLines-%ver%.zip
GOTO END

:EXPORT
fontforge -c 'Open($1); Generate($2)' PrimaryLines.sfd PrimaryLines2.ttf
fontforge -c 'Open($1); Generate($2)' PrimaryLines.sfd PrimaryLines2.woff

:END
endlocal
