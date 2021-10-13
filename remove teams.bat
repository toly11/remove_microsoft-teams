@Echo Off
if /i "%1"=="-r" goto :restore

powershell Get-AppxPackage MicrosoftTeams* ^| Remove-AppxPackage

Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f
goto :end

:restore
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "1" /f

:end
timeout /t 3
exit /b
