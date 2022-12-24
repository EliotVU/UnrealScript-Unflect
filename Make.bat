@echo off

set projn=Unflect

title %projn%
color 0F

echo.
echo Deleting compiled files %projn%
echo.
cd..
cd system
del %projn%.u
del %projn%.ucl
del %projn%.int

ucc.exe MakeCommandletUtils.EditPackagesCommandlet 1 %projn%
ucc.exe editor.MakeCommandlet -EXPORTCACHE -SHOWDEP
ucc.exe MakeCommandletUtils.EditPackagesCommandlet 0 %projn%
pause