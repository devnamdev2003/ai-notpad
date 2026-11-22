; Inno Setup script - makes installer_output\SmartNotepad-Setup.exe
; Run build_exe.bat first, then open this file in Inno Setup and click Compile.

[Setup]
AppName=Smart Notepad
AppVersion=1.0
AppPublisher=Smart Notepad
DefaultDirName={autopf}\Smart Notepad
DefaultGroupName=Smart Notepad
OutputDir=installer_output
OutputBaseFilename=SmartNotepad-Setup
Compression=lzma
SolidCompression=yes
; installs for the current user only, so friends do not need admin rights
PrivilegesRequired=lowest
UninstallDisplayIcon={app}\SmartNotepad.exe
; remove the next line if you do not have an app.ico
; SetupIconFile=app.ico

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Shortcuts:"

[Files]
Source: "dist\SmartNotepad\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

[Icons]
Name: "{group}\Smart Notepad"; Filename: "{app}\SmartNotepad.exe"
Name: "{autodesktop}\Smart Notepad"; Filename: "{app}\SmartNotepad.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\SmartNotepad.exe"; Description: "Launch Smart Notepad"; Flags: nowait postinstall skipifsilent
