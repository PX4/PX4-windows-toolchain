@ECHO OFF
SETLOCAL
ECHO *** Installing Java Development Kit for PX4 Toolchain
CD %~dp0
CALL ..\setup-environment-variables.bat x

REM install jdk
CALL bash -c "wget -O jdk.zip -nc https://s3-us-west-2.amazonaws.com/px4-tools/PX4+Windows+Cygwin+Toolchain/jdk1.8.0_152.zip && unzip jdk.zip && rm jdk.zip"

ENDLOCAL
