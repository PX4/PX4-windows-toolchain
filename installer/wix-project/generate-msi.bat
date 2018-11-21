@ECHO OFF
SETLOCAL
ECHO ** Generating PX4 Toolchain MSI Installer

REM determine version number from script call parameter
SET version=%1
IF "version" == "" (
	ECHO Please pass a version number to the script [0.0, 255.255]
	PAUSE
    EXIT /b
)
ECHO Version number: %version%

REM base directory of the source files
SET BASEDIR=%~dp0..\..
REM get rid of the ..\.. in the variable
PUSHD %BASEDIR%
SET BASEDIR=%CD%
POPD
ECHO Base driectory to create the installer for: %CD%

REM WiX Toolset binaries folder
SET WIXDIR=%~dp0..\wix-binaries

REM packing cygwin symbolic links into an archive
REM to preserve them for after the installation
ECHO *** Symbolic links: Backing up
call %BASEDIR%\toolchain\scripts\symlinks-backup-before-install.bat

REM create and switch to output folder
CD %~dp0
if not exist ".\build\" mkdir build
cd build

REM run WiX Toolset to create the msi installer
ECHO *** Running WiX Heat to harvest source file database
%WIXDIR%\heat.exe ^
dir %BASEDIR% ^
-out heat.wxs ^
-dr INSTALLDIR ^
-cg MainComponents ^
-gg -g1 -sreg -srd -sfrag -ke ^
-t ..\exclude.xslt

ECHO *** Running WiX Candle to compile installation scripts
%WIXDIR%\candle.exe ..\PX4.wxs ..\ui.wxs heat.wxs

ECHO *** Running WiX Light to link the installer file
%WIXDIR%\light.exe ^
-ext WixUIExtension ^
heat.wixobj PX4.wixobj ui.wixobj ^
-b %BASEDIR% ^
-loc ..\custom_ui_text.wxl ^
-out "PX4 Windows Cygwin Toolchain %version%.msi"

REM remove the symbolic link backup archive from the source directory
ECHO *** Symbolic links: Removing Backup
call %BASEDIR%\toolchain\scripts\symlinks-remove-backup.bat

ENDLOCAL
