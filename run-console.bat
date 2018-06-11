@ECHO OFF
PUSHD %~dp0
CALL toolchain\setup-environment-variables.bat x
POPD

REM start logged in bash terminal
CALL bash -l
