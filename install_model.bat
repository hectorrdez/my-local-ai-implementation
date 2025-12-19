@echo off
setlocal ENABLEDELAYEDEXPANSION


echo Modelos actualmente instalados:
echo ------------------------------------------
docker exec -it ollama ollama list
echo ------------------------------------------
echo.

set /p MODEL_NAME=Introduce el nombre del modelo a instalar (ej: qwen2.5-coder:7b) :

if "%MODEL_NAME%"=="" (
    echo ERROR: No has introducido ningún modelo.
    pause
    exit /b 1
)

echo.
echo Instalando modelo: %MODEL_NAME%
echo ------------------------------------------

docker exec -it ollama ollama pull %MODEL_NAME%

if errorlevel 1 (
    echo.
    echo ERROR: Ha fallado la descarga del modelo "%MODEL_NAME%".
    echo Revisa que el nombre sea correcto.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Modelo "%MODEL_NAME%" instalado correctamente.
echo ==========================================
echo.

echo Lista actualizada de modelos:
echo ------------------------------------------
docker exec -it ollama ollama list
echo ------------------------------------------

pause
endlocal
