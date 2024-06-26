@echo off

echo Downloading python installer
curl -o %cd%\assets\python-3.10.11-amd64.exe https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

echo Granting write permissions to current user's directory... (for installing python)
set dir=.
for /f "tokens=*" %%a in ('whoami') do set current=%%a
icacls "%dir%" /grant "%current%:(oi)(ci)f" /t

echo Installing python....
assets\python-3.10.11-amd64.exe /simple AssociateFiles=0 Shortcuts=0 Include_doc=0 Include_launcher=0 InstallAllUsers=0 DefaultJustForMeTargetDir=%cd%\python

pause
