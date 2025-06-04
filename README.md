# Gestor de Enlaces - Script de PowerShell

Un script de PowerShell diseñado para facilitar la gestión y el reporte de incidencias en enlaces de comunicaciones, utilizando una interfaz de menú y plantillas de mensajes predefinidas.

**Nota Importante:** Los datos específicos del proveedor, identificadores, nombres de host, IPs y ubicaciones dentro de este script han sido **anonimizados** (reemplazados con "XX", "Location", "X0000000", etc.) para proteger información sensible antes de su publicación. La versión original contendría datos operativos reales.

## Descripción

Este script proporciona una herramienta sencilla basada en menús para:
* Acceder rápidamente a información de contacto del proveedor (anonimizada en esta versión).
* Seleccionar un enlace específico (identificado de forma genérica como XX-Loc1-Primary, etc.).
* Visualizar una plantilla de mensaje preconfigurada y anonimizada para reportar una caída del enlace seleccionado.
* Copiar la plantilla de mensaje directamente al portapapeles para facilitar su uso en correos electrónicos o sistemas de ticketing.

El objetivo principal es estandarizar y agilizar el proceso de notificación de caídas de enlaces.

## Características Principales

* **Interfaz de Menú Intuitiva:** Navegación sencilla a través de opciones en la consola.
* **Información del Proveedor:** Acceso rápido a datos de contacto (anonimizados).
* **Gestión de Enlaces Caídos:**
    * Listado de enlaces categorizados (ej. Locación 1 - Primario, Locación 1 - Secundario).
    * Visualización de plantillas de mensajes específicas para cada tipo de enlace.
* **Copia al Portapapeles:** Funcionalidad para copiar las plantillas de mensajes con un solo clic.
* **Anonimizado para Compartir:** Todos los datos sensibles han sido reemplazados por placeholders.

## Requisitos Previos

* Sistema Operativo Windows.
* PowerShell (versión 5.1 o superior recomendada).
* Una fuente de consola que soporte caracteres UTF-8 (ej. Consolas, Cascadia Code, Lucida Console) para una correcta visualización de todos los caracteres.

## Cómo Usar

1.  **Descargar el Script:**
    * Clona este repositorio o descarga el archivo `.ps1` (ej. `GestorEnlacesBT.ps1`).

2.  **Codificación del Archivo:**
    * **MUY IMPORTANTE:** Asegúrate de que el archivo `.ps1` esté guardado con codificación **UTF-8 con BOM**. Esto es crucial para que los caracteres especiales (acentos, etc.) se muestren correctamente en la consola de PowerShell.
        * **PowerShell ISE:** Archivo > Guardar como... > En el desplegable "Codificación", selecciona "UTF-8 con BOM".
        * **VS Code:** Haz clic en la codificación actual en la barra de estado (abajo a la derecha) > Guardar con codificación > Selecciona "UTF-8 with BOM".
        * **Notepad:** Archivo > Guardar como... > En el desplegable "Codificación", selecciona "UTF-8 con BOM".

3.  **Abrir PowerShell:**
    * Inicia una nueva sesión de PowerShell.

4.  **Página de Códigos de la Consola (Opcional pero Recomendado):**
    * Para asegurar la correcta interpretación de caracteres por la consola, puedes ejecutar este comando antes de correr el script:
        ```powershell
        chcp 65001
        ```

5.  **Navegar al Directorio del Script:**
    * Usa el comando `cd` para ir a la carpeta donde guardaste el archivo:
        ```powershell
        cd C:\ruta\a\tu\script
        ```

6.  **Ejecutar el Script:**
    * Ejecuta el script con:
        ```powershell
        .\GestorEnlacesBT.ps1
        ```

7.  **Política de Ejecución de Scripts:**
    * Si recibes un error relacionado con la política de ejecución de scripts, es posible que necesites ajustarla. Para permitir la ejecución de scripts locales, puedes abrir PowerShell como **Administrador** y ejecutar:
        ```powershell
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
        ```
        Luego, presiona `S` para confirmar. Después de esto, puedes cerrar la consola de Administrador e intentar ejecutar el script en una consola normal.

8.  **Seguir las Instrucciones del Menú:**
    * El script te guiará a través de sus opciones.

## Personalización para Uso Propio

Esta versión del script está anonimizada. Para adaptarlo a tu entorno real:

1.  **Datos del Proveedor:**
    * Modifica la variable `$Anonymized_Email_Proveedor` con la dirección de correo real.
2.  **Nombres de Enlaces en el Menú:**
    * En la función `Show-EnlaceCaidoMenu`, actualiza los `Write-Host` y los títulos pasados a `Show-LinkDetail` para que coincidan con tus enlaces y ubicaciones reales (ej. en lugar de `"XX-Loc1-Primary"` usa `"MiOficina-Principal"`).
3.  **Plantillas de Mensajes:**
    * Reemplaza el contenido de las variables de mensajes (ej. `$Mensaje_BT_Brazil_Primary`, `$Mensaje_BT_Wolfsburg_Primary`, etc.) con tus propias plantillas detalladas y la información correcta para cada enlace. Asegúrate de que los nombres de estas variables sigan correspondiendo con las opciones correctas en el `switch` de la función `Show-EnlaceCaidoMenu`.

## Contribuciones

Las sugerencias, mejoras y contribuciones son bienvenidas. Si deseas contribuir:
1.  Haz un Fork del repositorio.
2.  Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3.  Realiza tus cambios y haz commit (`git commit -am 'Añade nueva funcionalidad'`).
4.  Sube tus cambios a la rama (`git push origin feature/nueva-funcionalidad`).
5.  Abre un Pull Request.

## Licencia

Este proyecto es de libre uso y modificación. Puedes considerar añadir una licencia formal como la [MIT License](https://opensource.org/licenses/MIT) si lo deseas.

---

Puedes copiar y pegar este contenido en un nuevo archivo llamado `README.md` en la raíz de tu repositorio de GitHub. GitHub lo mostrará automáticamente en la página principal del repositorio.
