@ECHO OFF
SETLOCAL
ECHO ** Installing Python Packages in Cygwin for PX4 Toolchain
CD %~dp0
CALL ..\scripts\setup-environment.bat x

REM create symbolic link to make python3 the default python binary
CALL bash -c "ln -sf /usr/bin/python3 /usr/local/bin/python"
REM install needed Python 2 packages under cygwin
CALL bash -c "pip2 -q --disable-pip-version-check install toml pyserial pyulog empy pyyaml cerberus pyros-genmsg kconfiglib"
REM install needed Python 3 packages under cygwin
CALL bash -c "pip3 -q --disable-pip-version-check install toml pyserial pyulog empy pyyaml cerberus pyros-genmsg packaging kconfiglib"

ENDLOCAL
