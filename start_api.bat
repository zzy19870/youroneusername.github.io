@echo off
REM 自动激活虚拟环境并启动 FastAPI
set VENV_DIR=%~dp0venv
set REQUIREMENTS=%~dp0requirements.txt

:: 检查虚拟环境是否存在，不存在则创建
if not exist "%VENV_DIR%" (
    python -m venv "%VENV_DIR%"
    echo 正在安装依赖...
    call "%VENV_DIR%\Scripts\activate.bat"
    pip install -r "%REQUIREMENTS%"
) else (
    call "%VENV_DIR%\Scripts\activate.bat"
)

:: 启动 FastAPI
uvicorn app:app --reload --host 0.0.0.0 --port 8000
pause