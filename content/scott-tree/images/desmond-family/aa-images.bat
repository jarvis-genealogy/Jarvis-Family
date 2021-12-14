@echo OFF
Pushd "%~dp0"

rem
rem Automatic picture album generator
rem
rem Fill a folder with the images to be included in the album
rem and run this batch file "aa-images.bat"
rem
rem An album webpage "all-images.html" is produced in the folder.
rem Rename it as required before running the batch file again.
rem To append images to an existing album see aa-append.bat:
rem
rem Based on a simple method
rem for %i in (*.jpg) do echo img src="%i"
rem echo ^<img src="%%a" /^> >> images.html
rem

echo.
echo IMAGE ALBUM GENERATOR
echo.
echo THIS SCRIPT WILL CREATE AN ALBUM HTML FILE FROM A FOLDER OF IMAGES
echo.
echo Before starting, make sure the following has been done :
echo.
echo    2) Create a folder for the album
echo    3) Copy into it :
echo          - this batch file
echo          - the images to be added
echo.
echo After this script has completed, you will find "all-images.html". Rename it as required.
echo Instructions for modification of the album are contained in the html.
echo To add new images to the album see "aa-append.bat".
echo.

pause

rem show the user the html files
rem echo html files in this folder.
rem echo.
rem dir /b /w *.html
rem echo.

rem if "all-images.html" does not exist, create it.
if not exist "all-images.html" goto Create

echo.
echo "all-images.html" already exists.
SET /P yesno=Do you want to replace it? (y/n):
IF "%yesno%"=="y" GOTO Start
IF "%yesno%"=="yes" GOTO Start
IF "%yesno%"=="Y" GOTO Start
IF "%yesno%"=="YES" GOTO Start
GOTO Error

:Start

rem Delete all-images.html if it exists
del all-images.html

:Create

echo ^<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"^>  >> all-images.html
echo ^<html xmlns="http://www.w3.org/1999/xhtml"^> >> all-images.html
echo ^<head^> >> all-images.html
echo ^<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /^> >> all-images.html
echo ^<title^>Image gallery^</title^> >> all-images.html
echo ^<style type="text/css"^> >> all-images.html

echo li{ >> all-images.html
echo    font-family:Arial, Helvetica, sans-serif; font-size: 14px; >> all-images.html
echo 	list-style-type:none; >> all-images.html
echo 	margin-right:10px; >> all-images.html
echo 	margin-bottom:10px; >> all-images.html
echo 	float:left; >> all-images.html
echo } >> all-images.html


echo div.desc  { >> all-images.html
echo   text-align: center; >> all-images.html
echo   word-wrap: break-word; >> all-images.html
echo } >> all-images.html

echo img { >> all-images.html
echo   height:320px; >> all-images.html
echo } >> all-images.html

echo ^</style^> >> all-images.html
echo ^</head^> >> all-images.html

echo ^<body^> >> all-images.html

echo ^<div style="padding:6px; font-family:Arial, Helvetica, sans-serif;" ^> >> all-images.html
echo ^<h2^>Image Gallery^</h2^> >> all-images.html
echo   ^<p^>Collected photos scanned from prints or slides. >> all-images.html
echo   ^<br^>Some have been colourised using open source >> all-images.html
echo   ^<a href="https://github.com/jantic/DeOldify" target="blank"^>DeOldify^</a^> >> all-images.html
echo   ^</p^> >> all-images.html
echo ^</div^> >> all-images.html

echo ^<ul^> >> all-images.html

for %%a in (*.jpg;*.png) do (
   rem - this works
   rem echo ^<li^>^<a href="%%~nxa"^>^<img src="%%~nxa" alt="%%~nxa" style='height:320px;' /^> ^<br^>^<center^>%%~na ^</center^> ^</a^>^</li^> >> all-images.html
   
   echo. >> all-images.html
   echo ^<li^> >> all-images.html
   
   echo ^<!-- The user click image --^> >> all-images.html
   echo ^<a href="%%~nxa"^> >> all-images.html
   
   echo ^<!-- The album display image and alt words --^> >> all-images.html
   echo ^<img src="%%~nxa" alt="%%~nxa" ^> >> all-images.html
   echo ^</a^> >> all-images.html
   echo ^<div class="desc"^> >> all-images.html
   
   echo ^<!-- The image caption --^> >> all-images.html
   echo %%~na >> all-images.html
   echo ^<!-- The caption link ^(example below^)--^> >> all-images.html
   echo ^<!-- ^<br^> ^<a href="details.pdf"^>Click for details^</a^> --^> >> all-images.html
   
   echo ^</div^> >> all-images.html
   echo ^</li^> >> all-images.html
   
   rem echo ^<li^>^<a href="%%~nxa"^>^<img src="%%~nxa" alt="%%~nxa" style='height:320px;' /^> ^<br^>%%~na ^</a^>^</li^> >> all-images.html
   rem ?? echo ^<li^>^<a href="%%~nxa"^> ^<figure^> ^<img src="%%~nxa" alt="%%~nxa" style='height:320px;' /^> ^<figcaption^>%%~na ^</figcaption^> ^</figure^>^</a^>^</li^> >> all-images.html   
)

rem
rem href is the image that comes up when clicked. e.g colourised
rem img is the thumbnail that is displayed
rem 
rem The first href for the user click can be changed to another image (e.g. colourised)
rem For example :
rem 
rem <li><a href="alice-olive-lily-2_colourised.jpg">
rem     <img src="alice-olive-lily-2.jpg" alt="alice-olive-lily-2.jpg" style='height:320px;' /> </a>
rem     <div class="desc"><center>alice-olive-lily-2
rem
rem div can include some details e.g. pdf
rem for example :
rem
rem <li><a href="harold-band-2.jpg"><img src="harold-band-2.jpg" alt="harold-band-2.jpg" style='height:320px;' /> </a>
rem <div class="desc"><center>harold-band-2 </center> </div> </li> 
rem
rem to :
rem
rem <li><a href="harold-band-2.jpg"><img src="harold-band-2.jpg" alt="harold-band-2.jpg" style='height:320px;' /> </a>
rem <div class="desc"><center>
rem      Postcard from Jinnie. Victor Harbor brass band.<br> <a href="harold-band-back.pdf">Click for details</a>
rem      </center> </div> </li> 
rem

echo. >> all-images.html
echo. >> all-images.html

echo ^<!-- Here is where the contents can be added --^> >> all-images.html
echo ^<!-- ============================================================= --^> >> all-images.html
echo. >> all-images.html
echo. >> all-images.html
echo ^<!-- =============================================================  --^> >> all-images.html
echo. >> all-images.html


echo ^<br^> >> all-images.html
echo ^<br^> >> all-images.html

echo ^</ul^> >> all-images.html


echo ^</body^> >> all-images.html
echo ^</html^> >> all-images.html


GOTO End

:Error
ECHO No entry..
:End

echo.
echo Finished.

pause
