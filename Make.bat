@echo off

for %%* in (.) do set project_name=%%~n*
set project_dir=%~dp0

title %project_name%
color 0F

echo.
echo Deleting compiled files %project_name%
echo.
cd..
cd system
del %project_name%.u
del %project_name%.ucl
del %project_name%.int

ucc.exe editor.MakeCommandlet -ini="%project_dir%make.ini"
pause