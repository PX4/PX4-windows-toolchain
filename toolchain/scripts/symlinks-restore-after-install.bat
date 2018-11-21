@echo off

pushd %~dp0
call setup-environment.bat x
popd

pushd %PX4_DIR%

:: restore symbolic links from previously backed up tar file
call bash -c "cd toolchain && tar x --files-from=links < links.tar"
popd