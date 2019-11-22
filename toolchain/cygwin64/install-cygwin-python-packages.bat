@ECHO OFF
SETLOCAL
ECHO ** Installing Python Packages in Cygwin for PX4 Toolchain
CD %~dp0
CALL ..\scripts\setup-environment.bat x

REM install needed Python 2 packages under cygwin
CALL bash -c "pip2 -q --disable-pip-version-check install toml pyserial pyulog empy pyyaml cerberus"
REM install needed Python 3 packages under cygwin
CALL bash -c "pip3 -q --disable-pip-version-check install toml pyserial pyulog empy pyyaml cerberus"

ENDLOCAL
