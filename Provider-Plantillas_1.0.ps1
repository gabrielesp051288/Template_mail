# Establecer la codificación de salida de la consola a UTF-8
$OutputEncoding = [System.Text.Encoding]::UTF8

# --- Variables con los mensajes ANONIMIZADOS ---

$Anonymized_Email_Proveedor = "XXXXXXXXXXX.XX@XX.XXX"

$Mensaje_BT_Brazil_Primary = @"
Dear XX Team,
We are writing to report a service outage affecting the primary link path between Location and Location.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected primary link path:	
    -Customer Site ID: X0000000
    -Primary SIID: XXXXX0X-00000000-0000
    -Router Location: xx-xx-xx-xxx-x00-00-xxxx
    -loopback114: 00.000.0.000
    -loopback10: 00.000.000.00
"@

$Mensaje_BT_Brazil_Secondary = @"
Dear XX Team,
We are writing to report a service outage affecting the secondary link path between Location and Location.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected secondary link path:	
    -Customer Site ID: X0000000
    -Secondary SIID: XXXXX0X-00000000-0000
    -Hostname: xx-xx-xx-xxx-x00-00-xxxx
    -Loopback114: 00.000.0.000
    -Loopback10: 00.000.000.00
"@

$Mensaje_BT_Wolfsburg_Primary = @"
Dear XX Team,
We are writing to report a service outage affecting the Location Primary link path.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected primary link path:	
    -Customer Site ID: X0000000
    -primary SIID XXXXX0X-00000000-0000
    -Hostname: xx-xx-xx-xxx-x000-00-xxxx
    -IP 00.000.0.00
    -loopback10 00.000.000.000
"@

$Mensaje_BT_Wolfsburg_Secondary = @"
Dear XX Team,
We are writing to report a service outage affecting the Location Secondary link path.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected secondary link path:	
    -Customer Site ID: X0000000
    -Secondary SIID XXXXX0X-00000000-0000
    -Hostname: xx-xx-xx-xxx-x00-00-xxxx
    -IP 00.000.0.00
    -loopback10 00.000.000.000
"@

$Mensaje_BT_Mexico_Primary = @"
Dear XX Team,
We are writing to report a service outage affecting the Location Primary link path.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected primary link path:	
    -Customer Site ID: X0000000
    -Primary SIID: XXXXX0X-00000000-0000
    -Hostname xx-xx-xx-xxx-xxx-00-xxxx
    -Loopback114: 00.000.0.000
    -Loopback10: 00.000.00.00
"@

$Mensaje_BT_Mexico_Secondary = @"
Dear XX Team,
We are writing to report a service outage affecting the Location Secondary link path.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected secondary link path:	
    -Customer Site ID: X0000000
    -Secondary SIID: XXXXX0X-00000000-0000
    -Hostname xx-xx-xx-xxx-xxx-00-xxxx
    -Loopback114: 00.000.0.000
    -Loopback10: 00.0.00.00
"@

$Mensaje_BT_Auburn_Hills_Primary = @"
Dear XX Team,
We are writing to report a service outage affecting the Location primary link path.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected primary link path:	
    -Customer Site ID: X0000000
    -Primary SIID: XXXXX0X-00000000-0000
    -Hostname: xx-xx-xx-xxx-xxx-00-xxxx
    -Loopback114: 00.000.0.000
    -Loopback10: 000.000.000.00
"@

$Mensaje_BT_Auburn_Hills_Secondary = @"
Dear XX Team,
We are writing to report a service outage affecting the Location Secondary link path.
Our monitoring indicates a loss of connectivity specific to this path.
[Screenshot Cacti]
Details for the affected secondary link path:	
    -Customer Site ID: X0000000 / X0000000
    -secondary SIID: XXXXX0X-00000000-0000
    -Hostname: xx-xx-xx-xxx-xx-00-xxxx
    -Loopback 10: 00.0.00.0
    -Loopback114: 00.000.0.000
"@

# Función para mostrar el detalle de un enlace y ofrecer opciones de navegación
function Show-LinkDetail {
    param(
        [string]$LinkTitle,
        [string]$MessageContent
    )
    
    do {
        Clear-Host
        Write-Host "--- Detalle para: $LinkTitle ---" # El título del detalle usará el LinkTitle anonimizado
        Write-Host "`n" 
        Write-Host $MessageContent 
        Write-Host "`n" 
        Write-Host "----------------------------------------------------"
        Write-Host "Seleccione una opción:"
        Write-Host "1. Copiar Plantilla" 
        Write-Host "2. Volver al menú anterior (Selección de Enlace Caído)" 
        Write-Host "3. Volver al menú principal" 
        $choice = Read-Host "Opción"

        switch ($choice) {
            '1' { 
                Set-Clipboard -Value $MessageContent
                Write-Host "`n¡Plantilla copiada al portapapeles!" -ForegroundColor Green
                Write-Host "Presione Enter para continuar..."
                Read-Host | Out-Null
            }
            '2' { 
                return "previous" 
            }
            '3' { 
                return "main"     
            }
            default {
                Write-Warning "Opción no válida. Presione Enter para continuar..."
                Read-Host | Out-Null
            }
        }
    } while ($true) 
}

# Función para el menú de Enlace Caído con opciones de menú anonimizadas
function Show-EnlaceCaidoMenu {
    $exitEnlaceCaidoMenu = $false
    do {
        Clear-Host
        Write-Host "--- Gestión de Enlaces BT - Enlace Caído ---"
        Write-Host "Seleccione una de las opciones del Menú:"
        # Opciones del menú anonimizadas
        Write-Host "   1. XX-Loc1-Primary"
        Write-Host "   2. XX-Loc1-Secondary"
        Write-Host "   3. XX-Loc2-Primary"
        Write-Host "   4. XX-Loc2-Secondary"
        Write-Host "   5. XX-Loc3-Primary"
        Write-Host "   6. XX-Loc3-Secondary"
        Write-Host "   7. XX-Loc4-Primary"
        Write-Host "   8. XX-Loc4-Secondary"
        Write-Host "   9. Volver al menú principal"
        $choice = Read-Host "Opción"

        $navigationAction = "" 

        switch ($choice) {
            # Títulos pasados a Show-LinkDetail también anonimizados
            '1' { $navigationAction = Show-LinkDetail "XX-Loc1-Primary" $Mensaje_BT_Brazil_Primary }
            '2' { $navigationAction = Show-LinkDetail "XX-Loc1-Secondary" $Mensaje_BT_Brazil_Secondary }
            '3' { $navigationAction = Show-LinkDetail "XX-Loc2-Primary" $Mensaje_BT_Wolfsburg_Primary }
            '4' { $navigationAction = Show-LinkDetail "XX-Loc2-Secondary" $Mensaje_BT_Wolfsburg_Secondary }
            '5' { $navigationAction = Show-LinkDetail "XX-Loc3-Primary" $Mensaje_BT_Mexico_Primary }
            '6' { $navigationAction = Show-LinkDetail "XX-Loc3-Secondary" $Mensaje_BT_Mexico_Secondary }
            '7' { $navigationAction = Show-LinkDetail "XX-Loc4-Primary" $Mensaje_BT_Auburn_Hills_Primary }
            '8' { $navigationAction = Show-LinkDetail "XX-Loc4-Secondary" $Mensaje_BT_Auburn_Hills_Secondary }
            '9' { $exitEnlaceCaidoMenu = $true } 
            default {
                Write-Warning "Opción no válida. Presione Enter para continuar..."
                Read-Host | Out-Null
            }
        }
        
        if ($navigationAction -eq "main") {
            $exitEnlaceCaidoMenu = $true
        }

    } until ($exitEnlaceCaidoMenu)
}

# Menú Principal
$exitMainMenu = $false
do {
    Clear-Host
    Write-Host "Bienvenido al Gestor de Enlaces BT"
    Write-Host "==================================="
    Write-Host "Seleccione una de las opciones del Menú:" 
    Write-Host "   1. Datos del Proveedor"
    Write-Host "   2. Enlace Caído" 
    Write-Host "   3. Salir"
    $mainChoice = Read-Host "Opción" 

    switch ($mainChoice) {
        '1' {
            Clear-Host
            Write-Host "--- Datos del Proveedor ---"
            Write-Host "Email: $Anonymized_Email_Proveedor" 
            Write-Host "`nPresione Enter para volver al menú principal..."
            Read-Host | Out-Null
        }
        '2' {
            Show-EnlaceCaidoMenu
        }
        '3' {
            $exitMainMenu = $true
            Write-Host "Saliendo del gestor. ¡Hasta luego!"
            Start-Sleep -Seconds 1 
        }
        default {
            Write-Warning "Opción no válida. Presione Enter para continuar..."
            Read-Host | Out-Null
        }
    }
} until ($exitMainMenu)
