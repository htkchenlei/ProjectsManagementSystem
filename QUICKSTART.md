# 快速开始指南

## 第一次运行？按照以下步骤操作

### 步骤 1：检查环境

```bash
# 检查 Python 版本
python --version
# 需要输出：Python 3.12.0 或更高版本

# 检查 MySQL 是否运行
mysql --version
# 需要能正常连接
```

### 步骤 2：进入项目目录

```bash
cd /workspace/projects/flask-tailwind
```

### 步骤 3：安装依赖

```bash
pip install -r requirements.txt
```

### 步骤 4：初始化数据库

```bash
# 创建数据库和表
mysql -u root -p < init_db.sql

# 如果提示输入密码，输入你的 MySQL root 密码
```

### 步骤 5：创建管理员用户

```bash
python add_user.py
```

这将创建管理员用户：
- 用户名：`Chenlei`
- 密码：`tianyu.123`

### 步骤 6：配置数据库连接（可选）

如果数据库密码不是 `root`，修改 `config.py`：

```python
DB_PASSWORD = 'your_password'  # 改为你的密码
```

### 步骤 7：启动应用

```bash
python app.py
```

### 步骤 8：访问应用

在浏览器中打开：http://localhost:5000

使用以下账号登录：
- 用户名：`admin` 或 `Chenlei`
- 密码：`123456` 或 `tianyu.123`

---

## 一键启动（推荐）

### Linux/Mac

```bash
cd /workspace/projects/flask-tailwind
chmod +x start.sh
./start.sh
```

### Windows

```bash
cd /workspace/projects/flask-tailwind
start.bat
```

---

## 常见错误处理

### 错误 1：ModuleNotFoundError

```
ModuleNotFoundError: No module named 'flask'
```

**解决方法：**
```bash
pip install -r requirements.txt
```

### 错误 2：Access denied for user

```
mysql.connector.errors.ProgrammingError: Access denied for user 'root'@'localhost'
```

**解决方法：**
1. 修改 `config.py` 中的数据库密码
2. 确保密码正确

### 错误 3：Unknown database

```
mysql.connector.errors.ProgrammingError: Unknown database 'ProjectManagement'
```

**解决方法：**
```bash
mysql -u root -p < init_db.sql
```

### 错误 4：Port already in use

```
Address already in use
```

**解决方法：**
```bash
# Linux/Mac
lsof -ti:5000 | xargs kill

# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

---

## 下一步

1. **创建新项目**: 点击"创建项目"按钮
2. **管理用户**: 进入"管理用户"页面添加用户
3. **查看统计**: 进入"统计分析"查看数据

需要更多帮助？查看 [README.md](README.md) 或 [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)
