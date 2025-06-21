@echo off
REM === プロジェクトルートを現在フォルダに固定 ==================
cd /d "%~dp0"

REM === asm6 でアセンブル  =======================================
REM  ※ asm6.exe が PATH に通っていない場合はフルパスで書く：
REM     C:\dev\asm6\asm6.exe src\game.asm game.nes
asm6 src\game.asm game.nes

REM === 結果表示  =================================================
if exist game.nes (
    echo.
    echo *** build OK → game.nes を生成しました ***
) else (
    echo.
    echo *** build 失敗：エラーメッセージを確認してください ***
)

pause
