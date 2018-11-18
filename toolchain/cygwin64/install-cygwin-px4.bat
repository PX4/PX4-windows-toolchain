@ECHO OFF
SETLOCAL
ECHO ** Installing Cygwin for PX4 Toolchain
CD %~dp0

ECHO *** Downloading Cygwin Setup
certutil.exe -urlcache -split -f "https://cygwin.com/setup-x86_64.exe" setup-x86_64.exe

REM -- Configure our paths
SET SITE=http://mirrors.kernel.org/sourceware/cygwin/
SET LOCALDIR=%TEMP%/cygwin-installation-files
SET ROOTDIR=%CD%

REM -- These are the packages we will install (in addition to the default packages)
SET PACKAGES=cmake,gcc-g++,git,make,ninja,patch,xxd,nano,python2,python2-pip,python2-numpy,python2-jinja2,unzip,astyle,bash-completion,wget,libcurl-devel,procps-ng

REM -- Do it!
ECHO *** Installing Packages
ECHO Package list: %PACKAGES%
setup-x86_64.exe -q -D -L -d -g -o -W -s %SITE% -l "%LOCALDIR%" -R "%ROOTDIR%" -C Base -P %PACKAGES% > cygwin_setup_ouput.log
ECHO *** Cygwin Installation Done
ENDLOCAL
