@ECHO OFF

CALL ..\setup-environment-variables.bat x

REM start console
CALL bash -c "pip2 install toml && pip2 install pyserial && pip2 install pyulog"
