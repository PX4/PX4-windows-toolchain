@ECHO OFF

CALL ..\setup-environment-variables.bat x

REM install gcc-arm in this folder
CALL bash -c "wget -O gcc-arm.zip -nc https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-win32.zip && unzip gcc-arm.zip && rm gcc-arm.zip"
