@echo off
setlocal

:: Purpose - Does atlas refresh then starts Unciv

:: Set your Unciv drive letter here
E:

:: Set for your Unciv environment
set UNCIV=e:\Dev\Unciv64
set MOD=UltimaV base

cd %UNCIV%

set MODPATH=%UNCIV%\mods\%MOD%
del "%MODPATH%\game.atlas"
del "%MODPATH%\game.png"

:: If you have additional atlases set those here to be deleted
REM del "%MODPATH%\Constructions.atlas"
REM del "%MODPATH%\Constructions.png"

:: java must be in your PATH env var
java -jar %UNCIV%\Unciv.jar

endlocal