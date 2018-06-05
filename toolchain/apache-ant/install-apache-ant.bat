@ECHO OFF

CALL ..\setup-environment-variables.bat x

REM start console
CALL bash -c "wget -O apache-ant.zip -nc http://mirror.easyname.ch/apache//ant/binaries/apache-ant-1.10.3-bin.zip && unzip apache-ant.zip && rm apache-ant.zip && f=(./*) && mv ./*/* . && rmdir "${f}""
