set /p m=
hexo g && hexo d && git add * && git commit -m "%m%" && git push origin hexo