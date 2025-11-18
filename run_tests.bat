@echo off
REM 激活虚拟环境
call .venv\Scripts\activate.bat

REM 运行 pytest 并生成 Allure 结果
pytest -vv tests --alluredir=allure-results

REM 确认生成了结果文件再生成报告
if exist allure-results (
    REM 生成 Allure 报告
    D:\allure-2.34.1\allure-2.34.1\bin\allure.bat generate allure-results -c -o allure-report

    REM 打开报告
    start "" allure-report\index.html
) else (
    echo "Allure results not found, report generation skipped."
)

