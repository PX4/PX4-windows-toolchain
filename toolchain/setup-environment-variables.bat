@ECHO OFF

REM catch double clicking
IF "%1" == "" (
	ECHO This file is automatically run by the other scripts, no need to execute manually.
	ECHO Open environment-setup.bat in an editor to modify the toolchain!
	PAUSE
)

REM this is the PX4 directory which is one layer above this script
SET PX4_DIR=%~dp0..

REM backup windows path variable to detect windows git installation
SET WINDOWS_PATH=%PATH%

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
REM path to shell scripts
SET PATH=%PATH%;%PX4_DIR%\toolchain\scripts\

REM determine home directory
cygpath -u %PX4_DIR%\home > tmp_cygpath
SET /p PX4_HOME= <tmp_cygpath
del tmp_cygpath
REM set home directory for the unix environment
CALL bash -c "sed -i '/db_home:/c\db_home:  '$PX4_HOME /etc/nsswitch.conf"

REM create optional symlinks to system wide .gitconfig and .ssh
CALL bash %PX4_DIR%\toolchain\configuration-symlinks.sh
