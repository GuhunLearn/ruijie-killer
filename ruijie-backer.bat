@echo off
setlocal enabledelayedexpansion

:: ----------- ���ò��� -----------
set "ԭ�ļ���·��=C:\Program Files (x86)\RG-CloudManagerRemote\CMLauncher-killed.exe"
set "���ļ�������=CMLauncher.exe"
:: ------------------------------

:: ����Ƿ��Թ���Ա�������
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ���Ҽ��ԡ�����Ա������С��˽ű�������Ȩ�޲��㣡
    pause
    exit /b
)

:: ���ԭ�ļ����Ƿ����
if not exist "%ԭ�ļ���·��%" (
    echo �����ļ��� "%ԭ�ļ���·��%" �����ڣ�
    pause
    exit /b
)

:: ִ������������
ren "%ԭ�ļ���·��%" "%���ļ�������%" 2>nul && (
    echo �ɹ����ļ�������Ϊ "%���ļ�������%"
) || (
    echo ������ʧ�ܣ�����ԭ��
    echo 1. Ŀ������ "%���ļ�������%" �Ѵ���
    echo 2. ϵͳȨ�޲��㣨��ȷ���Թ���Ա������У�
    echo 3. ԭ�ļ������ڱ���������ռ��
)
start C:\Users\Public\Desktop\��ѧ�������.lnk
pause
