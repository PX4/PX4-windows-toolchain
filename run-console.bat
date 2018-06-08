@ECHO OFF
CD %~dp0

CALL toolchain\setup-environment-variables.bat x

REM start logged in bash terminal
CALL bash -l
