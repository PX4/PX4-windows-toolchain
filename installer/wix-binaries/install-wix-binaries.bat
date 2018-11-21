@ECHO OFF
SETLOCAL
ECHO ** Installing WiX Toolset for PX4 Toolchain installer generation
CD %~dp0
CALL ..\..\toolchain\scripts\setup-environment.bat x

ECHO *** Downloading WiX Toolset
REM install gcc-arm in this folder
CALL bash -c "wget -nv -O wix-binaries.zip -nc https://github.com/wixtoolset/wix3/releases/download/wix3111rtm/wix311-binaries.zip && unzip -q wix-binaries.zip && rm wix-binaries.zip"

ENDLOCAL
