@echo off
chcp 65001 >nul
echo ======================================
echo   项目管理系统 - Flask + Tailwind CSS
echo ======================================
echo.

REM 检查 Python 是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python 未安装，请先安装 Python 3.12+
    pause
    exit /b 1
)

echo ✅ Python 版本:
python --version
echo.

REM 安装依赖
echo 📦 安装依赖...
pip install -r requirements.txt

if errorlevel 1 (
    echo ❌ 依赖安装失败
    pause
    exit /b 1
)

echo ✅ 依赖安装完成
echo.

REM 提示用户初始化数据库
echo ⚠️  首次运行需要初始化数据库
echo 请执行以下步骤：
echo   1. 确保 MySQL 服务正在运行
echo   2. 创建数据库: mysql -u root -p ^< init_db.sql
echo   3. 运行 add_user.py 创建管理员用户: python add_user.py
echo.

set /p db_ready="数据库是否已初始化? (y/n): "

if /i not "%db_ready%"=="y" (
    echo 请先初始化数据库后再运行此脚本
    pause
    exit /b 1
)

echo.
echo 🚀 启动应用...
echo.
echo 应用将在 http://localhost:5000 运行
echo 按 Ctrl+C 停止应用
echo.

REM 启动应用
python app.py

pause
