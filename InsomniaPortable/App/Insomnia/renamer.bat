@echo off

set root=%~dp0
set keyword="Insomnia.Core"
set unnamed_file=""

@REM 切换到当前路径,避免使用管理员模式启动带来的工作路径变化
cd /d %root%

@REM 递归读取当前路径下所有文件
for /r %%f in (*) do (
    @REM 使用管道读取包含bin_keyword的文件名并赋值
    echo %%~nxf | findstr /c:%keyword% > nul && (
        set unnamed_file=%%f
    ) || (
        echo "" > nul
    )
)

move %unnamed_file% "Insomnia.Core-portable.exe"