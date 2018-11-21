@ECHO OFF
SETLOCAL
ECHO *** Installing genromfs
CD %~dp0
CALL ..\scripts\setup-environment.bat x

REM install genromfs in this folder
CALL bash -c "git submodule update --init --recursive --force && cd genromfs-src && make all && mv genromfs.exe ../"

ENDLOCAL
