@ECHO OFF
SETLOCAL
ECHO * Automated PX4 Toolchain Components Installation

REM -- Change directory relative to the batch file
CD %~dp0\..

CALL cygwin64\install-cygwin-px4.bat
CALL cygwin64\install-cygwin-python-packages.bat
CALL gcc-arm\install-gcc-arm.bat
CALL jdk\install-jdk.bat
CALL apache-ant\install-apache-ant.bat
CALL genromfs\install-genromfs.bat

ENDLOCAL
