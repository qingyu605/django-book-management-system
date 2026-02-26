# 图书管理系统 (Book Management System)

基于Python Django框架开发的轻量级图书管理系统，适用于小型图书馆、个人书籍管理等场景，支持图书信息管理、用户权限管理等核心功能，项目结构规范，可快速部署和二次开发。

## 🌟 项目特性
- 完整的图书信息管理（新增、查询、编辑、删除）
- 基于Django Auth的用户身份认证与权限管理
- 简洁的前端页面（适配基础CRUD操作）
- 标准化的项目结构，易扩展、易维护
- 支持SQLite（默认）/MySQL数据库切换

## 🛠️ 技术栈
- 后端：Python 3.8+、Django 4.x
- 前端：HTML、CSS、JavaScript、Bootstrap（可选）
- 数据库：SQLite（开发环境）、MySQL（生产环境）
- 其他：Django ORM、Django Templates

## 📋 环境要求
- Python 3.8 及以上版本
- pip（Python包管理工具）
- Git（可选，克隆仓库用）
- MySQL（可选，生产环境替换SQLite）

## 🚀 快速部署
### 1. 克隆仓库
```bash
git clone https://github.com/your-username/book-management.git
cd book-management
```

### 2. 创建并激活虚拟环境（推荐）
#### Windows
```bash
# 创建虚拟环境
python -m venv venv
# 激活虚拟环境
venv\Scripts\activate
```

#### Linux/macOS
```bash
# 创建虚拟环境
python3 -m venv venv
# 激活虚拟环境
source venv/bin/activate
```

### 3. 安装依赖
```bash
# 安装项目依赖（需提前创建requirements.txt，见下方说明）
pip install -r requirements.txt
```

### 4. 配置数据库（可选）
- 默认使用SQLite数据库，无需额外配置；
- 如需切换为MySQL，修改项目根目录的`settings.py`：
  ```python
  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.mysql',
          'NAME': 'book_management',  # 你的MySQL数据库名
          'USER': 'root',  # 你的MySQL用户名
          'PASSWORD': 'your-password',  # 你的MySQL密码
          'HOST': '127.0.0.1',
          'PORT': '3306',
      }
  }
  ```

### 5. 数据库迁移
```bash
# 生成迁移文件
python manage.py makemigrations
# 执行迁移，创建数据表
python manage.py migrate
```

### 6. 创建超级管理员（用于后台管理）
```bash
python manage.py createsuperuser
# 按提示输入用户名、邮箱、密码
```

### 7. 启动项目
```bash
python manage.py runserver
```
启动成功后，访问以下地址：
- 前台页面：http://127.0.0.1:8000/
- 后台管理页面：http://127.0.0.1:8000/admin/

## 📁 项目结构（核心目录）
```
book-management/
├── book_management/       # 项目核心配置目录
│   ├── settings.py        # 项目配置文件
│   ├── urls.py            # 全局路由配置
│   └── wsgi.py            # WSGI部署配置
├── books/                 # 图书功能模块（示例）
│   ├── models.py          # 图书数据模型
│   ├── views.py           # 视图逻辑
│   └── urls.py            # 模块路由
├── templates/             # HTML模板文件
├── static/                # 静态资源（CSS/JS/图片）
├── media/                 # 媒体文件（上传的图书封面等）
├── manage.py              # Django项目管理入口
└── requirements.txt       # 项目依赖清单
```

## 📌 补充说明
### 1. 生成requirements.txt
若未创建依赖清单，执行以下命令生成：
```bash
pip freeze > requirements.txt
```

### 2. 常见问题
- 启动报错：检查Python版本、依赖是否安装完整、端口是否被占用；
- 数据库迁移失败：确保数据库服务已启动（MySQL），配置信息正确；
- 静态资源加载异常：确认`settings.py`中`STATIC_URL`和`STATIC_ROOT`配置正确。

## 📄 许可证
本项目基于 MIT 许可证开源，你可自由使用、修改和分发。
```

### 配套说明（提升实用性）
1. requirements.txt 示例：如果项目还没有这个文件，可创建并填入基础依赖：
   ```
   Django>=4.0,<5.0
   mysqlclient>=2.2.0  # 仅使用MySQL时需要
   pillow>=10.0.0      # 处理图片上传时需要
   ```
2. 个性化调整：你可根据项目实际情况修改以下内容：
   - 仓库地址（`git clone`后的链接）；
   - 技术栈版本（如Django具体版本）；
   - 功能特性（补充项目实际实现的功能）；
   - 项目结构（匹配你的实际目录）。
