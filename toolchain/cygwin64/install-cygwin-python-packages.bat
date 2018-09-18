@ECHO OFF
SETLOCAL
ECHO ** Installing Python Packages in Cygwin for PX4 Toolchain
CD %~dp0
CALL ..\setup-environment-variables.bat x

REM install needed paython packages under cygwin
CALL bash -c "pip2 install toml && pip2 install pyserial && pip2 install pyulog && pip2 install empy && pip2 install pyyaml"

ENDLOCAL
