REM 安装控制/游戏中心后使用！！！
REM 文本格式应为ANSI


@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close)&&exit
echo oemsevUEFILOGO修改工具
echo;
echo **********将图片文件放在当前目录下，输入文件名并执行。成功后重启生效**********
echo;
echo ***仅支持120KB以下*bmp*jpg和部分*png格式图像***
echo;
echo;
echo;
set /p name=#输入文件名(含扩展名)按回车键执行:
for /f "tokens=1,2,* " %%i in ('reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{6ea3ce12-b991-4b65-9f8d-b148eaaecd87}_is1 /v InstallLocation ^| find /i "InstallLocation"') do set var=%%k
cd /d %~dp0
copy "%name%" "%var%DefaultTool\" /y || goto fail
cd /d %var%DefaultTool&&OemServiceWinApp LOGO /Load /File %name%
del "*.bmp" "*.png" "*.jpg" /q /f >nul 2>nul
:fail
echo;
pause

