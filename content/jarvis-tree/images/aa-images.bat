rem for %i in (*.jpg) do echo img src="%i"
rem echo ^<img src="%%a" /^> >> all.html
echo ^<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"^>

echo ^<html xmlns="http://www.w3.org/1999/xhtml"^> >> all.html
echo ^<head^> >> all.html
echo ^<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /^> >> all.html
echo ^<title^>Family images^</title^> >> all.html
echo ^<style type="text/css"^> >> all.html
echo li{ >> all.html
echo 	list-style-type:none; >> all.html
echo 	margin-right:10px; >> all.html
echo 	margin-bottom:10px; >> all.html
echo 	float:left; >> all.html
echo } >> all.html

echo ^</style^> >> all.html
echo ^</head^> >> all.html

echo ^<body^> >> all.html

echo ^<h2^>Family images^</h2^> >> all.html

echo ^<ul^> >> all.html

for %%a in (*.jpg;*.png;*.pdf) do (
   rem echo ^<li^>^<a href="%%~nxa"^>^<img src="%%~nxa" alt="%%~nxa" style='height:320px;' /^> ^<br^>%%~na ^</a^>^</li^> >> all.html
   echo ^<li^>^<a href="%%~nxa"^>^<img src="%%~nxa" alt="%%~nxa" style='height:320px;' /^> ^<br^>^<center^>%%~na ^</center^> ^</a^>^</li^> >> all.html
   rem ?? echo ^<li^>^<a href="%%~nxa"^> ^<figure^> ^<img src="%%~nxa" alt="%%~nxa" style='height:320px;' /^> ^<figcaption^>%%~na ^</figcaption^> ^</figure^>^</a^>^</li^> >> all.html   
)

echo ^</ul^> >> all.html

echo ^</body^> >> all.html
echo ^</html^> >> all.html
