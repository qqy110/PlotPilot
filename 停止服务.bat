@echo off
chcp 65001 >nul
title PlotPilot-1 停止服务

echo ========================================
echo   停止 PlotPilot-1 服务
echo ========================================
echo.

taskkill /F /IM python.exe >nul 2>&1
taskkill /F /IM node.exe >nul 2>&1

echo   服务已停止！
echo.
pause
