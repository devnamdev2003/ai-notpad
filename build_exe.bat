@echo off
REM Builds SmartNotepad.exe (no terminal window) into dist\SmartNotepad\
cd /d "%~dp0"

where py >nul 2>nul
if %errorlevel%==0 (set PY=py) else (set PY=python)

echo Installing PyInstaller...
%PY% -m pip install --upgrade pyinstaller
if errorlevel 1 goto :fail

set ICON=
if exist app.ico set ICON=--icon app.ico

echo Building...
%PY% -m PyInstaller --noconfirm --clean --noconsole --name SmartNotepad %ICON% smart_notepad.py
if errorlevel 1 goto :fail

echo.
echo Done. Your app is in: dist\SmartNotepad\SmartNotepad.exe
echo Next: open installer.iss in Inno Setup and press Compile to make the Setup.exe
pause
exit /b 0

:fail
echo.
echo Build failed - see the messages above.
pause
exit /b 1
