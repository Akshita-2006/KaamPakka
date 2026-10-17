@echo off
setlocal
cd /d "%~dp0"
title KaamPakka local server
echo.
echo Starting KaamPakka at http://127.0.0.1:5000
echo Keep this window open while using the site.
echo.
"C:\Python313\python.exe" -u app.py
echo.
echo KaamPakka stopped. The message above explains why.
pause
