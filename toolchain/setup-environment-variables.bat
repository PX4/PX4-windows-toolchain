@ECHO OFF

REM catch double clicking
IF "%1" == "" (
	ECHO This file is automatically run by the other scripts, no need to execute manually.
	ECHO Open environment-setup.bat in an editor to modify the toolchain!
	PAUSE
)

REM this is the PX4 directory which is one layer above this script
SET PX4_DIR=%~dp0..

REM home directory for the unix environment
SET HOME=%PX4_DIR%\home

REM path to Cygwin Unix Environment
SET PATH=%PX4_DIR%\toolchain\cygwin64\bin
REM path to GCC for ARM Compiler
SET PATH=%PATH%;%PX4_DIR%\toolchain\gcc-arm\bin
REM path to Java Developement Kit
SET PATH=%PATH%;%PX4_DIR%\toolchain\jdk\bin
REM path to Apache Ant, a Java build tool
SET PATH=%PATH%;%PX4_DIR%\toolchain\apache-ant\bin
REM path to genromfs
SET PATH=%PATH%;%PX4_DIR%\toolchain\genromfs\
