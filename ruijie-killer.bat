@echo off
mshta vbscript:msgbox("请右键以【管理员身份运行】此脚本，否则权限不足！由幻渐境Huanjianjing制作，可杀死锐捷远程管理软件，还你一个自由的信息课。",64,"锐捷杀手")(window.close)
setlocal enabledelayedexpansion

:: ----------- 配置参数 -----------
set "原文件路径=C:\Program Files (x86)\RG-CloudManagerRemote\CMLauncher.exe"
set "新文件名称=CMLauncher-killed.exe"
:: ------------------------------

:: 检查是否以管理员身份运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请右键以【管理员身份运行】此脚本，否则权限不足！
    pause
    exit /b
)

:: 检查原文件是否存在
if not exist "%原文件路径%" (
    echo 错误：文件夹 "%原文件路径%" 不存在！
    pause
    exit /b
)

:: 执行重命名操作
ren "%原文件路径%" "%新文件名称%" 2>nul && (
    echo 成功将文件重命名为 "%新文件名称%"
) || (
    echo 重命名失败！可能原因：
    echo 1. 目标名称 "%新文件名称%" 已存在
    echo 2. 系统权限不足（请确认以管理员身份运行）
    echo 3. 原文件正在被其他程序占用
)
TASKKILL /F /IM CMLauncher.exe /T
mshta vbscript:msgbox("成功！",64,"提示")(window.close)

pause
