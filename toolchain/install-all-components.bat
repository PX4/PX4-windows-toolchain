@ECHO OFF
ECHO * Automated PX4 Toolchain Components Installation

REM -- Change to the directory of the executing batch file
CD %~dp0

CALL cygwin64\install-cygwin-px4.bat
CALL gcc-arm\install-gcc-arm.bat
CALL jdk\install-jdk.bat
CALL apache-ant\install-apache-ant.bat
CALL genromfs\install-genromfs.bat

PAUSE