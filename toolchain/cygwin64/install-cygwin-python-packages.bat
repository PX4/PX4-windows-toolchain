@ECHO OFF
SETLOCAL
ECHO ** Installing Python Packages in Cygwin for PX4 Toolchain
CD %~dp0
CALL ..\setup-environment-variables.bat x

REM install needed paython packages under cygwin
CALL bash -c "pip2 -q install toml"
CALL bash -c "pip2 -q install pyserial"
CALL bash -c "pip2 -q install pyulog"
CALL bash -c "pip2 -q install empy"
CALL bash -c "pip2 -q install pyyaml"
CALL bash -c "pip2 -q install cerberus"

ENDLOCAL
