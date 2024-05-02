cd ..\%1
call npm run build
del /q /s ..\vue-github-deploy\dist\*
@REM for /d %x in ("..\vue-github-deploy\dist\*") do rmdir /s /q "%x"
xcopy dist ..\vue-github-deploy\dist /s /e
git commit -a -m .
git checkout gh-pages
del /q /s js\*
del /q /s css\*
xcopy ..\vue-github-deploy\dist . /s /e /y
git add .
git commit -a -m .
git push
git checkout master
cd ..\vue-github-deploy
