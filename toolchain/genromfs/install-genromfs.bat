@ECHO OFF

CALL ..\setup-environment-variables.bat x

REM install genromfs in this folder
CALL bash -c "git submodule update --init --recursive --force && cd genromfs && make all && mv genromfs.exe ../"
