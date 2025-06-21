@echo off
REM === プロジェクトルートを現在フォルダに固定 ==================
cd /d "%~dp0"

REM === asm6.exe をリポジトリ直下から実行 ========================
set ASM6=asm6.exe
if not exist "%ASM6%" (
    echo エラー: %ASM6% が見つかりませんでした。chatGPT フォルダ直下に置いてください。
    pause
    exit /b 1
)

"%ASM6%" src\game.asm game.nes

REM === 結果表示  =================================================
if exist game.nes (
    echo.
    echo *** build OK → game.nes を生成しました ***
) else (
    echo.
    echo *** build 失敗：エラーメッセージを確認してください ***
)

pause
