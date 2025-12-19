@echo off
setlocal

echo ========================================
echo  Setup de comandos Ollama / IA Local
echo ========================================
echo.

set SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

REM Obtener PATH actual del usuario
for /f "tokens=2*" %%A in ('reg query HKCU\Environment /v Path 2^>nul') do set USER_PATH=%%B

echo %USER_PATH% | findstr /i "%SCRIPT_DIR%" >nul
if not errorlevel 1 (
    echo ✔ La carpeta ya esta en el PATH del usuario.
    goto end
)

echo ➕ Añadiendo la carpeta al PATH del usuario...
set NEW_PATH=%USER_PATH%;%SCRIPT_DIR%

reg add HKCU\Environment /v Path /t REG_EXPAND_SZ /d "%NEW_PATH%" /f >nul

echo ✔ Carpeta añadida correctamente.
echo.
echo ⚠️ Cierra y vuelve a abrir la terminal para que tenga efecto.

:end
pause
endlocal
