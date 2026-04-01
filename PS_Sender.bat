@echo off
set TOKEN="API_KEY"
set CHATID="CHAT_ID"
set PROXY="http://172.16.80.1:8988"

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0PS_Sender.ps1" -token %TOKEN% -chatId %CHATID% -proxyUrl %PROXY% -message "%*"
