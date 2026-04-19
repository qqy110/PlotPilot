@echo off
chcp 65001 >nul
title PlotPilot-1 启动器

echo ========================================
echo   PlotPilot-1 本地部署版启动器
echo ========================================
echo.

:: 停止可能存在的旧进程
echo [1/4] 停止旧进程...
taskkill /F /IM python.exe >nul 2>&1
taskkill /F /IM node.exe >nul 2>&1
timeout /t 2 >nul

:: 启动后端
echo [2/4] 启动后端服务 (端口 8006)...
cd /d "%~dp0"
start "PlotPilot-1 Backend" cmd /k "cd /d %~dp0 && .venv\Scripts\python.exe -m uvicorn interfaces.main:app --host 127.0.0.1 --port 8006"

:: 启动前端
echo [3/4] 启动前端服务 (端口 3001)...
start "PlotPilot-1 Frontend" cmd /k "cd /d %~dp0frontend && E:\tools\nodejs\node.exe node_modules\vite\bin\vite.js --host 127.0.0.1 --port 3001"

:: 等待服务启动
timeout /t 5 >nul

:: 打开浏览器
echo [4/4] 打开浏览器...
start http://127.0.0.1:3001

echo.
echo ========================================
echo   启动完成！
echo   前端: http://127.0.0.1:3001
echo   后端: http://127.0.0.1:8006/docs
echo ========================================
echo.
pause
