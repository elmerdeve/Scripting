##--------------------------------------------------##
#Ayuda
##--------------------------------------------------##

<#
.SYNOPSIS 
Verificación de procesos en ejecución.

.DESCRIPTION
Este script lee los procesos en ejecución en el sistema y guarda en un archivo de texto el id y el nombre de cada proceso.
    
.PARAMETER pathsalida
Path del directorio donde se almacenará el archivo de texto con los resultados.

.EXAMPLE
.\Ejercicio1.ps1 -pathsalida "C:\temp" -cantidad 5
                     
#>

######################################################
# Script: 	 	Ejercicio1.ps1
# TP:     	 	1
# Ejercicio: 	1
# Integrantes:	
#   Feito, Gustavo
#   Soro, Emmanuel
#   Funes, Hernán Javier
#   
# ENTREGA NÚMERO 1
#
#Respuestas:
#
# a- Este script recibe dos parámetros: Un string con un path y un número entero. Si no los recibe, entonces utiliza por 
#  defecto el path donde se está ejecutando y el número 3. Si estos datos se reciben y son válidos, lee los procesos 
#  en ejecución en el sistema y los imprime por consola tantas veces como el valor del entero recibido. Además, guarda
#  en un archivo de texto el id y el nombre de cada proceso, con formato de lista. Este archivo se llama procesos.txt y
#  se guarda en el directorio donde se ejecutó el script; si el archivo ya existe entonces lo actualiza. Si el path recibido
#  por parámetro no existe, entonces se indicará por consola "El path no existe".
# b- Si, agregaría [Parameter(Position = 0, Mandatory = $false)][ValidateRange(1,10)] al segundo parámetro. Position sería 
# para validar la ubicación del entero recibido. Mandatory con valor false indica que el parámetro no es obligatorio. 
# ValidateRange indica que el número recibido debe ser positivo, y además limita la cantidad de procesos a 10 para cuidar 
# el consumo de memoria en el sistema.
######################################################

Param
(
[Parameter(Position = 1, Mandatory = $false)][String] $pathsalida = ".",
[Parameter(Position = 0, Mandatory = $false)][ValidateRange(1,10)][int] $cantidad = 3
)
$existe = Test-Path $pathsalida
if ($existe -eq $true)
{
$listaproceso = Get-Process
    foreach ($proceso in $listaproceso)
    {
        $proceso | Format-List -Property Id,Name >> procesos.txt
    }
    for ($i = 0; $i -lt $cantidad ; $i++)
    {
        Write-Host $listaproceso[$i].Name-$listaproceso[$i].Id
    }
}
else
{
    Write-Host "El path no existe"
}