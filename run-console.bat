@ECHO OFF
PUSHD %~dp0
CALL toolchain\scripts\setup-environment.bat x
POPD

REM restore working directory, counterpart is in home/.bash_profile
REM if we run the batch script by double click start in home folder
IF NOT EXIST %~nx0 (
	SET PREVIOUS_PWD=%CD%
)

REM start interactive bash terminal
REM login shell required because python modules need /usr/local/bin in the PATH!
CALL bash -l -i
