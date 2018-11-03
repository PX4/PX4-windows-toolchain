@ECHO OFF
PUSHD %~dp0
CALL toolchain\setup-environment-variables.bat x
POPD

SET PREVIOUS_PATH=%CD%

REM start bash terminal
REM login shell required because python modules need /usr/local/bin in the PATH!
REM if we run the batch script by double click stay in home folder else restore path
IF EXIST %~nx0 (
	CALL bash -l
) ELSE (
	CALL bash -l -c "cd $PREVIOUS_PATH && bash"
)
