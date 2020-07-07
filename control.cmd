@echo off
title speedtest

setlocal
set uac=~uac_permission_tmp_%random%
md "%SystemRoot%\system32\%uac%" 2>nul
if %errorlevel%==0 ( rd "%SystemRoot%\system32\%uac%" >nul 2>nul ) else (
    echo set uac = CreateObject^("Shell.Application"^)>"%temp%\%uac%.vbs"
    echo uac.ShellExecute "%~s0","","","runas",1 >>"%temp%\%uac%.vbs"
    echo WScript.Quit >>"%temp%\%uac%.vbs"
    "%temp%\%uac%.vbs" /f
    del /f /q "%temp%\%uac%.vbs" & exit )
endlocal  

:BG
cls
echo ©°©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©´
echo ©¦                        speedtest                            ©¦
echo ©À©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©È
echo ©¦                                                             ©¦
echo ©¦INS USE                                                      ©¦
echo ©¦        build      run go get and build                      ©¦
echo ©¦        run        run speedtest                             ©¦
echo ©¦        install    install speedtest as service (use nssm)   ©¦
echo ©¦        uninstall  uninstall speedtest service               ©¦
echo ©¦        start      start speedtest service (after install)   ©¦
echo ©¦        stop       stop speedtest service                    ©¦
echo ©¦        restart    stop and start speedtest                  ©¦
echo ©¦        version    show speedtest version                    ©¦
echo ©¦                                                             ©¦
echo ©¸©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¼

%~d0
cd %~dp0
::SET select=
SET /P select="Please Enter Instructions:"
IF "%select%"=="build" (
    go get -v ./...
    ::go build -o %~dp0\bin\goping.exe  %~dp0\src\ping\goping\goping.go
    go build -o %~dp0\bin\speedtest.exe  %~dp0\src\speedtest.go
    echo Build Finish.. 
    pause
    GOTO BG
) ELSE (
    IF "%select%"=="run" (
        %~dp0/bin/speedtest.exe 
    ) ELSE ( 
        IF "%select%"=="install" (
            %~dp0\\bin\\nssm.exe install speedtest %~dp0\\bin\\speedtest.exe 
            pause
            GOTO BG
        ) ELSE ( 
            IF "%select%"=="start" (
                net start speedtest 
                pause
                GOTO BG
            ) ELSE (
                IF "%select%"=="stop" (
                    net stop speedtest 
                    pause
                    GOTO BG
                ) ELSE (
                    IF "%select%"=="restart" (
                        net stop speedtest 
                        net start speedtest 
                        pause
                        GOTO BG
                    ) ELSE (
                        IF "%select%"=="uninstall" (
                            sc delete speedtest 
                            pause
                            GOTO BG
                        ) ELSE (
                             IF "%select%"=="version" (
                                %~dp0\bin\speedtest.exe -v 
                                pause
                                GOTO BG
                            ) ELSE (
                                 echo Param Error Try Again!
                                 pause
                                 GOTO BG
                            )
                        ) 
                    ) 
                ) 
            ) 
        ) 
    )
)

pause

exit