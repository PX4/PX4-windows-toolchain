@echo off

pushd %~dp0
call setup-environment.bat x
popd

pushd %PX4_DIR%

:: remove symbolic link backup
call bash -c "cd toolchain && rm -f links links.tar"
popd