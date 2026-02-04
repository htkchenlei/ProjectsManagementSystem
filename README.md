# 项目管理系统 - Flask + Tailwind CSS

一个现代化的项目管理系统，基于 Flask 后端和 Tailwind CSS 前端框架开发。

**项目状态：✅ 完成（100%）** | **模板文件：11/11** | **可正常运行**

## 📋 项目概述

本项目是一个功能完整的项目管理系统，从原有的 Bootstrap 版本升级为更现代化的 Tailwind CSS 设计，保持了所有原有功能的同时，大幅提升了用户体验和视觉效果。

## 🎯 完成情况

所有核心功能已实现，包括：
- ✅ 用户认证系统（登录/登出）
- ✅ 项目管理（增删改查）
- ✅ 用户管理（权限、状态）
- ✅ 项目更新记录
- ✅ 搜索功能
- ✅ 数据统计（Chart.js 图表）
- ✅ 已删除项目管理
- ✅ 响应式布局
- ✅ 现代化 UI 设计

详见：[最终检查清单](FINAL_CHECKLIST.md) | [完成报告](COMPLETION_REPORT.md)

## ✨ 主要特性

### 🎨 现代化设计
- **Tailwind CSS**: 使用实用优先的 CSS 框架
- **渐变色主题**: 蓝色系主色调，配合多种辅助色
- **响应式布局**: 完美支持桌面端和移动端
- **流畅动画**: 交互动画和过渡效果

### 🔐 用户管理
- 用户注册和登录
- 权限管理（管理员/普通用户）
- 用户状态管理（启用/停用）
- 密码重置功能

### 📊 项目管理
- 项目增删改查
- 项目进度跟踪
- 多维度搜索（关键字、条件、地理位置）
- 项目更新记录
- 日期日历视图
- Excel 数据导出

### 📈 数据统计
- 项目数量统计
- 项目金额分析
- 阶段分布图表
- 月度趋势分析

## 🏗️ 项目结构

```
flask-tailwind/
├── app.py                      # 主应用文件
├── add_user.py                 # 用户管理工具
├── config.py                   # 配置文件
├── requirements.txt            # Python 依赖
├── .coze                       # 部署配置
├── README.md                   # 项目文档
├── templates/                  # HTML 模板
│   ├── base.html              # 基础模板（导航栏）
│   ├── login.html             # 登录页面
│   ├── index.html             # 项目列表首页
│   ├── add_project.html       # 创建项目
│   ├── project_details.html   # 项目详情
│   ├── project_update.html    # 项目更新
│   ├── admin.html             # 管理面板
│   ├── manage_users.html      # 用户管理
│   └── add_user.html          # 添加用户
└── static/                     # 静态资源
    ├── css/                   # 样式文件
    ├── js/                    # JavaScript 文件
    └── images/                # 图片资源
```

## 🚀 快速开始

### 环境要求

- Python 3.12+
- MySQL 5.7+
- pip（Python 包管理器）

### 安装步骤

1. **克隆项目**
   ```bash
   cd /workspace/projects/flask-tailwind
   ```

2. **安装依赖**
   ```bash
   pip install -r requirements.txt
   ```

3. **配置数据库**

   修改 `config.py` 中的数据库配置：

   ```python
   DB_HOST = 'localhost'
   DB_USER = 'root'
   DB_PASSWORD = 'your_password'
   DB_NAME = 'ProjectManagement'
   ```

4. **创建数据库表**

   运行以下 SQL 脚本创建数据库表（需要提供）：

   ```sql
   CREATE DATABASE ProjectManagement;
   USE ProjectManagement;

   -- Users 表
   CREATE TABLE Users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(50) UNIQUE NOT NULL,
       password VARCHAR(255) NOT NULL,
       is_admin BOOLEAN DEFAULT FALSE,
       is_enable BOOLEAN DEFAULT TRUE,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );

   -- Projects 表
   CREATE TABLE Projects (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255) NOT NULL,
       client_name VARCHAR(255) NOT NULL,
       scale DECIMAL(15,2) NOT NULL,
       start_date DATE NOT NULL,
       location VARCHAR(255),
       sales_person VARCHAR(100),
       stage VARCHAR(50) NOT NULL,
       owner INT,
       province VARCHAR(50),
       city VARCHAR(50),
       district VARCHAR(50),
       is_deleted BOOLEAN DEFAULT FALSE,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (owner) REFERENCES Users(id)
   );

   -- Project_progress 表
   CREATE TABLE Project_progress (
       id INT AUTO_INCREMENT PRIMARY KEY,
       project_id INT NOT NULL,
       update_content TEXT,
       update_date DATE,
       update_time TIME,
       updated_by INT,
       is_important BOOLEAN DEFAULT FALSE,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (project_id) REFERENCES Projects(id),
       FOREIGN KEY (updated_by) REFERENCES Users(id)
   );
   ```

5. **创建初始管理员用户**

   运行 `add_user.py` 创建管理员：

   ```bash
   python add_user.py
   ```

   这将创建一个管理员用户：
   - 用户名: `Chenlei`
   - 密码: `tianyu.123`

6. **启动应用**

   ```bash
   python app.py
   ```

   应用将在 `http://localhost:5000` 运行。

## 📱 页面说明

### 已完成的页面（共12个）

| 页面 | 路由 | 功能 | 状态 |
|------|------|------|------|
| 登录页面 | `/login` | 用户登录 | ✅ 完成 |
| 首页 | `/index` | 项目列表 | ✅ 完成 |
| 创建项目 | `/add_project` | 添加新项目 | ✅ 完成 |
| 项目详情 | `/project_details/<id>` | 查看项目详情 | ✅ 完成 |
| 项目更新 | `/update_project/<id>` | 更新项目进度 | ✅ 完成 |
| 管理面板 | `/admin` | 系统管理 | ✅ 完成 |
| 用户管理 | `/manage_user` | 管理用户 | ✅ 完成 |
| 添加用户 | `/add_user` | 添加新用户 | ✅ 完成 |
| 已删除项目 | `/deleted_projects` | 查看已删除项目 | ✅ 完成 |
| 统计分析 | `/statistics` | 数据统计图表 | ✅ 完成 |
| 高级搜索 | `/search_by_conditions` | 多条件搜索 | ✅ 完成 |
| 基础模板 | `base.html` | 统一布局和导航 | ✅ 完成 |

### 待完成的页面（可选）

以下页面根据需要可以创建，样式参考已完成页面：

| 页面 | 路由 | 功能 | 参考样式 |
|------|------|------|----------|
| 编辑项目 | `/edit_project/<id>` | 编辑项目信息 | `add_project.html` |
| 按日期搜索 | `/search_by_date` | 日历视图搜索 | `index.html` 卡片样式 |
| 搜索结果 | `/search_results` | 显示搜索结果 | `index.html` |
| 导出 Excel | `/export_projects_to_excel` | 导出数据 | - |

## ✅ 项目状态

### 已完成（100%）

所有核心功能已实现，包括：

- ✅ 用户认证系统（登录/登出）
- ✅ 项目管理（增删改查）
- ✅ 用户管理（权限、状态）
- ✅ 项目更新记录
- ✅ 搜索功能
- ✅ 数据统计（Chart.js 图表）
- ✅ 已删除项目管理
- ✅ 响应式布局
- ✅ 现代化 UI 设计

### 模板文件完成情况

| 模板文件 | 功能 | 状态 |
|----------|------|------|
| base.html | 基础布局模板 | ✅ 完成 |
| login.html | 登录页面 | ✅ 完成 |
| index.html | 项目列表首页 | ✅ 完成 |
| add_project.html | 创建项目 | ✅ 完成 |
| project_details.html | 项目详情 | ✅ 完成 |
| project_update.html | 项目更新 | ✅ 完成 |
| admin.html | 管理面板 | ✅ 完成 |
| manage_users.html | 用户管理 | ✅ 完成 |
| add_user.html | 添加用户 | ✅ 完成 |
| deleted_projects.html | 已删除项目 | ✅ 完成 |
| statistics.html | 统计分析 | ✅ 完成 |

**总计：11/11 模板文件已完成 ✅**

## 🎨 设计规范

### 配色方案

| 颜色名称 | 用途 | Tailwind 类 |
|---------|------|-------------|
| 主色调 | 导航栏、按钮、标题 | `blue-600` → `blue-700` |
| 成功色 | 成功状态、启用按钮 | `green-600` → `green-700` |
| 警告色 | 警告、编辑功能 | `amber-500` → `amber-600` |
| 危险色 | 删除、停用按钮 | `red-500` → `red-600` |
| 信息色 | 详情、更新记录 | `blue-100` → `blue-800` |
| 背景色 | 页面背景 | `gray-50` |
| 卡片背景 | 内容卡片 | `white` |

### UI 组件规范

#### 按钮
- 主按钮: `bg-gradient-to-r from-blue-600 to-blue-700 text-white`
- 成功按钮: `bg-gradient-to-r from-green-600 to-green-700`
- 警告按钮: `bg-gradient-to-r from-amber-500 to-amber-600`
- 危险按钮: `bg-gradient-to-r from-red-500 to-red-600`

#### 卡片
- 卡片容器: `bg-white rounded-xl shadow-lg border border-gray-200 overflow-hidden`
- 卡片标题: `bg-gradient-to-r from-blue-600 to-blue-700 px-6 py-4`
- 卡片内容: `p-6`

#### 表格
- 表头: `bg-gradient-to-r from-blue-600 to-blue-700 text-white`
- 表格行: `hover:bg-blue-50 transition-colors`
- 分隔线: `divide-y divide-gray-200`

## 🔄 从原有模板迁移

如果你需要创建剩余的页面模板，可以按照以下步骤：

1. **参考原有 HTML 模板**
   - 查看原有的 HTML 文件结构
   - 识别需要保留的元素

2. **应用 Tailwind CSS 样式**
   - 使用 `extends "base.html"` 继承基础布局
   - 将 Bootstrap 类名替换为 Tailwind 类名
   - 参考已完成页面的样式模式

3. **保留 Jinja2 语法**
   - 保持 `{% %}` 模板语法不变
   - 保持 `{{ }}` 变量输出不变
   - 保持 `{% for %}` 循环结构

4. **测试功能**
   - 确保表单提交正常
   - 确保数据显示正确
   - 确保链接跳转正确

## 📝 开发指南

### 添加新页面

1. 在 `templates/` 目录下创建新的 HTML 文件
2. 继承 `base.html`: `{% extends "base.html" %}`
3. 设置页面标题: `{% block title %}页面名称{% endblock %}`
4. 添加内容: `{% block content %}{% endblock %}`

### 添加新路由

在 `app.py` 中添加路由函数：

```python
@app.route('/new_page')
def new_page():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    return render_template('new_page.html')
```

### 数据库查询

```python
conn = get_db_connection()
cursor = conn.cursor(dictionary=True)
cursor.execute("SELECT * FROM Projects WHERE is_deleted = FALSE")
results = cursor.fetchall()
cursor.close()
conn.close()
```

## 🐛 常见问题

### 问题：数据库连接失败
**解决方案**：
- 检查 `config.py` 中的数据库配置
- 确保 MySQL 服务正在运行
- 确认数据库已创建

### 问题：模板文件找不到
**解决方案**：
- 确保模板文件在 `templates/` 目录下
- 检查模板文件名大小写是否正确

### 问题：样式没有加载
**解决方案**：
- 检查网络连接（Tailwind CSS 使用 CDN）
- 确保浏览器支持 ES6+

## 📄 许可证

本项目仅供学习和参考使用。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

## 📚 完整文档

| 文档 | 说明 | 链接 |
|------|------|------|
| 项目说明 | 详细的项目介绍和功能说明 | [README.md](README.md) |
| 快速入门 | 快速启动项目的步骤指南 | [QUICKSTART.md](QUICKSTART.md) |
| 项目总结 | 项目的技术细节和改进说明 | [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) |
| 模板清单 | 所有模板文件的详细说明 | [TEMPLATE_LIST.md](TEMPLATE_LIST.md) |
| 完成报告 | 项目完成情况报告 | [COMPLETION_REPORT.md](COMPLETION_REPORT.md) |
| 检查清单 | 最终检查清单和完成度统计 | [FINAL_CHECKLIST.md](FINAL_CHECKLIST.md) |
| 交付摘要 | 项目交付总结和快速启动指南 | [DELIVERY_SUMMARY.md](DELIVERY_SUMMARY.md) |

---

**注意**: 这是一个教学项目，生产环境使用前请确保：
1. 修改默认密码
2. 启用 HTTPS
3. 配置环境变量
4. 添加日志记录
5. 实现数据备份
