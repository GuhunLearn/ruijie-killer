@echo off
mshta vbscript:msgbox("���Ҽ��ԡ�����Ա������С��˽ű�������Ȩ�޲��㣡�ɻý���Huanjianjing��������ɱ�����Զ�̹������������һ�����ɵ���Ϣ�Ρ�",64,"���ɱ��")(window.close)
setlocal enabledelayedexpansion

:: ----------- ���ò��� -----------
set "ԭ�ļ�·��=C:\Program Files (x86)\RG-CloudManagerRemote\CMLauncher.exe"
set "���ļ�����=CMLauncher-killed.exe"
:: ------------------------------

:: ����Ƿ��Թ���Ա�������
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ���Ҽ��ԡ�����Ա������С��˽ű�������Ȩ�޲��㣡
    pause
    exit /b
)

:: ���ԭ�ļ��Ƿ����
if not exist "%ԭ�ļ�·��%" (
    echo �����ļ��� "%ԭ�ļ�·��%" �����ڣ�
    pause
    exit /b
)

:: ִ������������
ren "%ԭ�ļ�·��%" "%���ļ�����%" 2>nul && (
    echo �ɹ����ļ�������Ϊ "%���ļ�����%"
) || (
    echo ������ʧ�ܣ�����ԭ��
    echo 1. Ŀ������ "%���ļ�����%" �Ѵ���
    echo 2. ϵͳȨ�޲��㣨��ȷ���Թ���Ա������У�
    echo 3. ԭ�ļ����ڱ���������ռ��
)
TASKKILL /F /IM CMLauncher.exe /T
mshta vbscript:msgbox("�ɹ���",64,"��ʾ")(window.close)

pause
