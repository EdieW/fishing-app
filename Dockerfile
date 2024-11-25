FROM python:3.11-slim

# 设置工作目录
WORKDIR /code

# 复制依赖文件并安装
COPY requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码到容器中
COPY . /code

# 暴露端口
EXPOSE 8000

# 启动命令
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "fishing_game_backend.wsgi:application"]
