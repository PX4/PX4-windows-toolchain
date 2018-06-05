@ECHO OFF
ECHO *** Automated Cygwin Installation and Update for PX4

SETLOCAL

REM -- Change to the directory of the executing batch file
CD %~dp0

REM -- Configure our paths
SET SITE=http://mirrors.kernel.org/sourceware/cygwin/
SET LOCALDIR=%TEMP%/cygwin-installation-files
SET ROOTDIR=C:/PX4/toolchain/cygwin64

REM -- These are the packages we will install (in addition to the default packages)
SET PACKAGES=cmake,gcc-g++,git,make,ninja,patch,xxd,nano,python2,python2-pip,python2-numpy,python2-jinja2,unzip,astyle,bash-completion

REM -- Do it!
ECHO *** Installing Packages
setup-x86_64.exe -q -D -L -d -g -o -s %SITE% -l "%LOCALDIR%" -R "%ROOTDIR%" -C Base -P %PACKAGES%

REM -- Show what we did
ECHO.
ECHO.
ECHO cygwin installation updated
ECHO  - %PACKAGES%
ECHO.

ENDLOCAL

PAUSE
EXIT /B 0