@ECHO OFF
Pushd "%~dp0"

ECHO.
ECHO IMAGE ALBUM APPEND
ECHO.
ECHO DO NOT USE THIS SCRIPT IN AN EXISTING ALBUM FOLDER
ECHO.
ECHO Before starting, make sure the following has been done :
ECHO.
ECHO    1) Create a backup of the album you want to append to
ECHO    2) Create an empty temporary folder
ECHO    3) Copy into it :
ECHO          - this batch file
ECHO          - the album html file you want to append to
ECHO          - the images to be added
ECHO.
ECHO After this script has completed, copy the modified album file and the new 
ECHO images back to the album folder. If the files have been appended correctly,
ECHO the backup album file and the temporary folder can be deleted.
ECHO.

SET /P yesno=Do you want to continue? (y/n):
IF "%yesno%"=="y" GOTO Start
IF "%yesno%"=="yes" GOTO Start
IF "%yesno%"=="Y" GOTO Start
IF "%yesno%"=="YES" GOTO Start
GOTO Error

:Start

ECHO.
ECHO Album files in this folder
rem show the user the html file
dir /b /w *.html
ECHO.
SET /P fname=Enter the file name here (none to quit) : 
IF "%fname%"=="" GOTO Error

for %%a in (*.jpg;*.png) do (

   echo. >> %fname%
   echo ^<li^> >> %fname%
   
   echo ^<!-- The user click image ^(Can be changed^) --^> >> %fname%
   echo ^<a href="%%~nxa"^> >> %fname%
   
   echo ^<!-- The display image and alt words in case the file is missing--^> >> %fname%
   echo ^<img src="%%~nxa" alt="%%~nxa" >> %fname%
   echo style='height:320px;' /^> ^</a^> ^<div class="desc"^> >> %fname%
   
   echo ^<center^> >> %fname%
   echo ^<!-- The image caption below is the file name but can be changed --^> >> %fname%
   echo %%~na >> %fname%
   echo ^<!-- The caption can include a link ^(activate the line below and change the url^)--^> >> %fname%
   echo ^<!-- ^<br^> ^<a href="details.pdf"^>Click for details^</a^> --^> >> %fname%
   
   echo ^</center^> >> %fname%
   echo ^</div^> >> %fname%
   echo ^</li^> >> %fname%
)


GOTO End

:Error
ECHO No entry..
:End
