@ECHO OFF
SETLOCAL
ECHO *** Installing Java Development Kit
CD %~dp0
CALL ..\scripts\setup-environment.bat x

REM install jdk
CALL bash -c "wget -nv -O jdk.zip -nc https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_windows-x64_bin.zip && unzip -q jdk.zip && rm jdk.zip && f=(./*) && mv ./*/* . && rmdir "${f}""

ENDLOCAL
