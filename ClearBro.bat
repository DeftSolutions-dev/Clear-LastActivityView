@ECHO OFF
COLOR 3
CLS
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
	IF (%adminTest%)==(�⪠����) GOTO errNoAdmin
	IF (%adminTest%)==(Access) GOTO errNoAdmin
ECHO Desire.pro (FUCK#9803)
ECHO.
ECHO  -���⪠ ��ୠ�� 蠫㭠 :�
ECHO  +1 - ���⪠ �᭮���� ����� � ॥���.
ECHO   +2 - ���⪠ ��� ����� � ॥���, 䠩��� Perfect � Minidump/Windows
ECHO    +3 - ���⪠ ��� �����, 䠩��� Perfect, ��ୠ��� Windows � Last Activity View.
ECHO.
ECHO  -��᫥ �롮� �㭪�, ����� �� Enter!
SET /p doset="�롥� �㭪�: " 
ECHO.
IF %doset% NEQ 1 (
	IF %doset% NEQ 2 (
		IF %doset% NEQ 3 EXIT
	)
)
IF %doset% EQU 3 (
	FOR /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
)
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\FirstFolder" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU"
IF %doset% NEQ 1 (
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"
)
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\AppCompatCache" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications"
FOR /F "tokens=2" %%i IN ('whoami /user /fo table /nh') DO SET usersid=%%i 
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f
	REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps"
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\UserSettings\%usersid%" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\UserSettings\%usersid%" /va /f
REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /va /f
IF %doset% NEQ 1 (
	REG DELETE  "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /va /f
)
REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f
REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2"
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\*.*
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*.*
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*.*
DEL /f /q %systemroot%\Panther\*.*
DEL /f /q %systemroot%\appcompat\Programs\*.txt
DEL /f /q %systemroot%\appcompat\Programs\*.xml
DEL /f /q %systemroot%\appcompat\Programs\Install\*.txt
DEL /f /q %systemroot%\appcompat\Programs\Install\*.xml
IF %doset% NEQ 1 (
	DEL /f /q %systemroot%\Prefetch\*.pf
	DEL /f /q %systemroot%\Prefetch\*.ini
	DEL /f /q %systemroot%\Prefetch\*.7db
	DEL /f /q %systemroot%\Prefetch\*.ebd
	DEL /f /q %systemroot%\Prefetch\*.bin
	DEL /f /q %systemroot%\Prefetch\*.db
	DEL /f /q %systemroot%\Prefetch\ReadyBoot\*.fx
	DEL /f /q %systemroot%\Minidump\*.*
)
ECHO.
PAUSE
EXIT
:do_clear 
ECHO [+] %1 
wevtutil.exe cl %1
GOTO :eof
:errNoAdmin
COLOR 2
ECHO �����-�㯁�� [������ �� ����� ������ BAKA :�]
ECHO.
PAUSE