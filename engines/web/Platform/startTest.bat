SETLOCAL

SET BROWSER=%1
SET URL=%2
SET CHROME_PATH=%3
SET FIREFOX_PATH=%4
SET FILE_NAME=%5
if "%~1" == "" set BROWSER=Chrome
if "%~2" == "" set URL=http://demo.metering-cloud.com/platform25
if "%~3" == "" set CHROME_PATH=C:\Program Files (x86)\Google\Chrome\Application
if "%~4" == "" set FIREFOX_PATH=C:\Program Files (x86)\Mozilla Firefox\


rem Set tool path
SET PATH=%PATH%;%cd%\..\drivers;%cd%\..\..\..\pypy2\;%cd%\..\..\..\pypy2\bin;%CHROME_PATH%;%FIREFOX_PATH%

rem Execut robot framework using the python interpreter from the repo
pypy.exe -m robot -d "%cd%\Results" -x "%cd%\Results\junit" ^
%cd%\Tests\%FILE_NAME%
