#!/bin/bash

# 项目管理系统快速启动脚本

echo "======================================"
echo "  项目管理系统 - Flask + Tailwind CSS"
echo "======================================"
echo ""

# 检查 Python 是否安装
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 未安装，请先安装 Python 3.12+"
    exit 1
fi

echo "✅ Python 版本: $(python3 --version)"
echo ""

# 检查是否在虚拟环境中
if [[ "$VIRTUAL_ENV" == "" ]]; then
    echo "⚠️  建议在虚拟环境中运行"
    echo ""
    read -p "是否创建虚拟环境? (y/n): " create_venv
    if [ "$create_venv" = "y" ] || [ "$create_venv" = "Y" ]; then
        echo "📦 创建虚拟环境..."
        python3 -m venv venv
        source venv/bin/activate
        echo "✅ 虚拟环境已激活"
    fi
fi

# 安装依赖
echo ""
echo "📦 安装依赖..."
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "✅ 依赖安装完成"
echo ""

# 检查数据库配置
echo "🔍 检查数据库配置..."
if [ ! -f "config.py" ]; then
    echo "❌ 配置文件 config.py 不存在"
    exit 1
fi

echo "✅ 配置文件已找到"
echo ""

# 提示用户初始化数据库
echo "⚠️  首次运行需要初始化数据库"
echo "请执行以下步骤："
echo "  1. 确保 MySQL 服务正在运行"
echo "  2. 创建数据库: mysql -u root -p < init_db.sql"
echo "  3. 运行 add_user.py 创建管理员用户: python add_user.py"
echo ""

read -p "数据库是否已初始化? (y/n): " db_ready

if [ "$db_ready" != "y" ] && [ "$db_ready" != "Y" ]; then
    echo "请先初始化数据库后再运行此脚本"
    exit 1
fi

echo ""
echo "🚀 启动应用..."
echo ""
echo "应用将在 http://localhost:5000 运行"
echo "按 Ctrl+C 停止应用"
echo ""

# 启动应用
python app.py
