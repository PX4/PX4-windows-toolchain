@ECHO OFF

REM catch double clicking
IF "%1" == "" (
	ECHO This file is automatically run by the other scripts, no need to execute manually.
	ECHO Open environment-setup.bat in an editor to modify the toolchain!
	PAUSE
	EXIT /b
)

REM this is the PX4 directory which is two layers above this script
SET PX4_DIR=%~dp0..\..
REM get rid of the ..\.. in the variable
PUSHD %PX4_DIR%
SET PX4_DIR=%CD%
POPD

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
REM path to miscellaneous executables e.g. custom shell scripts
SET PATH=%PATH%;%PX4_DIR%\toolchain\misc\

REM determine home directory
cygpath -u %PX4_DIR%\home > tmp_cygpath
SET /p PX4_HOME= <tmp_cygpath
del tmp_cygpath
REM set home directory for the unix environment
CALL bash -c "sed '/db_home:/c\db_home:  '$PX4_HOME /etc/nsswitch.conf | sponge /etc/nsswitch.conf"

REM fix cygwin messing up NTFS permissions with unsupported execution bit
REM https://georgik.rocks/how-to-fix-incorrect-cygwin-permission-inwindows-7/
CALL bash -c "sed '/cygdrive/c\none /cygdrive cygdrive binary,noacl,posix=0,user 0 0' /etc/fstab | sponge /etc/fstab"

REM create optional symlinks to system wide .gitconfig and .ssh
CALL bash %PX4_DIR%\toolchain\scripts\configure-symlinks.sh
