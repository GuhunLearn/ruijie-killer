@echo off
setlocal enabledelayedexpansion

:: ----------- 配置参数 -----------
set "原文件夹路径=C:\Program Files (x86)\RG-CloudManagerRemote\CMLauncher-killed.exe"
set "新文件夹名称=CMLauncher.exe"
:: ------------------------------

:: 检查是否以管理员身份运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请右键以【管理员身份运行】此脚本，否则权限不足！
    pause
    exit /b
)

:: 检查原文件夹是否存在
if not exist "%原文件夹路径%" (
    echo 错误：文件夹 "%原文件夹路径%" 不存在！
    pause
    exit /b
)

:: 执行重命名操作
ren "%原文件夹路径%" "%新文件夹名称%" 2>nul && (
    echo 成功将文件重命名为 "%新文件夹名称%"
) || (
    echo 重命名失败！可能原因：
    echo 1. 目标名称 "%新文件夹名称%" 已存在
    echo 2. 系统权限不足（请确认以管理员身份运行）
    echo 3. 原文件夹正在被其他程序占用
)
start C:\Users\Public\Desktop\教学管理软件.lnk
pause
