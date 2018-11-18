@ECHO OFF
SETLOCAL
ECHO *** Installing Java Development Kit
CD %~dp0
CALL ..\setup-environment-variables.bat x

REM install jdk
CALL bash -c "wget -nv -O jdk.zip -nc https://s3-us-west-2.amazonaws.com/px4-tools/PX4+Windows+Cygwin+Toolchain/jdk1.8.0_152.zip && unzip -q jdk.zip && rm jdk.zip"

ENDLOCAL
