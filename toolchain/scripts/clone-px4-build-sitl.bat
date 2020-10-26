@echo off

pushd %~dp0
call setup-environment.bat x
popd

pushd %PX4_DIR%

if not exist ".\home\" mkdir home
cd home

:: start clone PX4 repo, build and run SITL (login shell required because python modules need /usr/local/bin in the PATH!)
call bash --login -c "git clone --recursive -j8 https://github.com/PX4/Firmware.git ; cd Firmware && make px4_sitl"
popd
