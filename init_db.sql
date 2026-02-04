-- 项目管理系统数据库初始化脚本
-- 执行此脚本创建必要的数据库表

CREATE DATABASE IF NOT EXISTS ProjectManagement CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ProjectManagement;

-- 用户表
CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    is_enable BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 项目表
CREATE TABLE IF NOT EXISTS Projects (
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
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner) REFERENCES Users(id) ON DELETE SET NULL,
    INDEX idx_is_deleted (is_deleted),
    INDEX idx_stage (stage),
    INDEX idx_owner (owner)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 项目进度表
CREATE TABLE IF NOT EXISTS Project_progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    update_content TEXT,
    update_date DATE,
    update_time TIME,
    updated_by INT,
    is_important BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES Projects(id) ON DELETE CASCADE,
    FOREIGN KEY (updated_by) REFERENCES Users(id) ON DELETE SET NULL,
    INDEX idx_project_id (project_id),
    INDEX idx_update_date (update_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 插入示例管理员用户（需要在运行 add_user.py 之前执行）
-- 密码: tianyu.123 (哈希后的值)
INSERT INTO Users (username, password, is_admin) VALUES ('admin', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5NU7xqOj1j9V2W', TRUE)
ON DUPLICATE KEY UPDATE username=username;

-- 插入示例普通用户
-- 密码: 123456 (哈希后的值)
INSERT INTO Users (username, password, is_admin) VALUES ('test_user', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', FALSE)
ON DUPLICATE KEY UPDATE username=username;

-- 插入示例项目
INSERT INTO Projects (name, client_name, scale, start_date, location, sales_person, stage, owner, province, city, district) VALUES
('智慧城市建设项目', '某市政府', 500.00, '2024-01-01', '北京市 朝阳区', '张三', '3', 1, '北京市', '北京市', '朝阳区'),
('企业数字化转型', '某科技公司', 800.00, '2024-02-15', '上海市 浦东新区', '李四', '5', 2, '上海市', '上海市', '浦东新区'),
('电商平台升级项目', '某电商公司', 1200.00, '2024-03-01', '广东省 深圳市', '王五', '7', 2, '广东省', '深圳市', '南山区')
ON DUPLICATE KEY UPDATE name=name;

-- 插入示例项目进度记录
INSERT INTO Project_progress (project_id, update_content, update_date, update_time, updated_by, is_important) VALUES
(1, '创建项目', '2024-01-01', '09:00:00', 1, FALSE),
(1, '完成需求分析', '2024-01-15', '14:30:00', 1, TRUE),
(2, '项目立项申请已提交', '2024-02-15', '10:00:00', 2, FALSE),
(2, '招投标参数编制完成', '2024-03-10', '16:00:00', 2, FALSE),
(3, '招标文件已挂网', '2024-03-15', '11:00:00', 2, FALSE)
ON DUPLICATE KEY UPDATE project_id=project_id;

COMMIT;

-- 查看创建的表
SHOW TABLES;

-- 查看用户数据
SELECT id, username, is_admin, is_enable FROM Users;

-- 查看项目数据
SELECT id, name, client_name, scale, stage FROM Projects;
