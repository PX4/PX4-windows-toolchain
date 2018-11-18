@ECHO OFF
SETLOCAL
ECHO *** Installing genromfs
CD %~dp0
CALL ..\setup-environment-variables.bat x

REM install genromfs in this folder
CALL bash -c "git submodule update --init --recursive --force && cd genromfs-src && make all && mv genromfs.exe ../"

ENDLOCAL
