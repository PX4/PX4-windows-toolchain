@echo off

pushd %~dp0
call setup-environment.bat x
popd

pushd %PX4_DIR%

:: backup symbolic links into tar file such that they survive the installation and can be recovered
call bash -c "cd toolchain && find -type l > links && tar c --files-from=links > links.tar"
popd
