@ECHO OFF

CALL ..\setup-environment-variables.bat x

REM install needed paython packages under cygwin
CALL bash -c "pip2 install toml && pip2 install pyserial && pip2 install pyulog"
