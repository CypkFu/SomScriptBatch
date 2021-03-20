@ echo off
Rem -------------------------------------
Rem  Script SOM 
Rem  version 1.0 -Final
Rem  Autor: DaniNoneC
Rem  funciones del Script

Rem -------------------------------------

Rem Algo relacionado con las variables y el espacio permitido por ".bat" de lotes, etc.
setlocal enabledelayedexpansion 
setlocal enableextensions

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
set ESC=%%b
)
echo -----------------------------------------------------
echo %ESC%[35m Hola^! Bienvenido %USERNAME% %ESC%[0m
echo -----------------------------------------------------
echo %ESC%[31m ############## MENU ##############%ESC%[0m
echo %ESC%[32m 1. Actualizar sistema%ESC%[0m                                   
echo %ESC%[33m 2. Identificar los usuarios registrados%ESC%[0m            
echo %ESC%[32m 3. Mostrar todas las unidades de almacenamiento%ESC%[0m                                
echo %ESC%[32m 4. Mostar fecha%ESC%[0m                                
echo %ESC%[32m 5. Copiar el perfil personal de usuario que se le indique a un PenDrive%ESC%[0m
echo %ESC%[32m 6. Buscar un archivo por consola%ESC%[0m                             
echo %ESC%[32m 7. Copiar todos los archivos que cumplan ciertas características por ejemplo que sean .MP3 a un Pendrive%ESC%[0m                            
echo %ESC%[32m 8. Chequear el disco por si hay algun fallo en el%ESC%[0m
echo %ESC%[20m 9. Instalar desde Internet y ejecutar%ESC%[0m
echo %ESC%[21m 10.SALIR%ESC%[0m
echo %ESC%[22m##################################"


Rem Entradas de usuario.
set /p opcion="Ingrese la opcion: "
echo Has seleccionado: %opcion%

Rem Decisiones del Script >> seleccion de operacion

if  "%opcion%" == "1" (
    echo  Actualizando sistema
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" (
        
        powershell "Get-WindowsUpdate"
        powershell "Install-WindowsUpdate"
        powershell "Install-WindowsUpdate"

    )
    if "!confirmacion!"=="N" exit /B 0 

)

if  "%opcion%" == "2" ( 
    echo  Identificar los usuarios registrados
    set /p confirmacion="Seguro que quieres continuar S o N: " 
    if "!confirmacion!"=="S" net user 
    if "!confirmacion!"=="N" exit /B 0
    
)

if  "%opcion%" == "3" ( 
    echo  Mostrar todas las unidades de almacenamiento
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" duf
    if "!confirmacion!"=="N" exit /B 0

)

if  "%opcion%" == "4" ( 
    echo  Copiar el perfil personal de tu usuario
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" echo la fecha es: %DATE%
    if "!confirmacion!"=="N" exit /B 0
    
)

if  "%opcion%" == "5" ( 
    echo  Copiar el perfil personal de usuario que se le indique a un PenDrive
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" echo opcion 5.
    if "!confirmacion!"=="N" exit /B 0
)

if  "%opcion%" == "6" ( 
    echo  Buscar un archivo por consola
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" (
    :opcion6
        set /p archivo= "Introduce el nombre del archivo y extension para buscar: "
        set /p ruta="Ubicacion donde buscar: "
        echo !ruta!
        echo !archivo!
        rem cambiar al directorio actaul
        cd /d !ruta!
        rem contar los archivos
        dir /b %archivo% /s 2> nul | find "" /v /c > %temp%\count
        set /p _count=<%temp%\count
        Rem limpiar los archivos temporeales
        del %temp%\count
        
        rem Print los archivos o el resultado
        echo Direccion de los archivos
        echo ---------------------------
        Rem la busqueda del archivo con "dir".
        dir /b !archivo! /s
        endlocal
        goto :setESC
    )
    if "!confirmacion!"=="N" exit /B 0

)

if  "%opcion%" == "7" ( 
    echo  Copiar todos los archivos que cumplan ciertas características por ejemplo que sean .MP3 a un Pendrive
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" echo opcion 7.
    if "!confirmacion!"=="N" exit /B 0
)

if  "%opcion%" == "8" ( 
    echo  Chequear el disco por si hay algun fallo en el
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" echo opcion 8.
    if "!confirmacion!"=="N" exit /B 0
)

if  "%opcion%" == "9" ( 
    echo  Instalar desde Internet y ejecutar
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" echo opcion 9.
    if "!confirmacion!"=="N" exit /B 0
)

if  "%opcion%" == "10" ( 
    set /p confirmacion="Seguro que quieres continuar S o N: "
    if "!confirmacion!"=="S" echo opcion salir.
    if "!confirmacion!"=="N" exit /B 0
)
