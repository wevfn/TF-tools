@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close)&&exit
echo oemsevUEFILOGO�޸Ĺ���
echo;
echo **********��ͼƬ�ļ����ڵ�ǰĿ¼�£������ļ�����ִ�С��ɹ���������Ч**********
echo;
echo ***��֧��120KB����*bmp*jpg�Ͳ���*png��ʽͼ��***
echo;
echo;
echo;
set /p name=#�����ļ���(����չ��)���س���ִ��:
for /f "tokens=1,2,* " %%i in ('reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{6ea3ce12-b991-4b65-9f8d-b148eaaecd87}_is1 /v InstallLocation ^| find /i "InstallLocation"') do set var=%%k
cd /d %~dp0
copy "%name%" "%var%DefaultTool\" /y || goto fail
cd /d %var%DefaultTool&&OemServiceWinApp LOGO /Load /File %name%
del "*.bmp" "*.png" "*.jpg" /q /f >nul 2>nul
:fail
echo;
pause
