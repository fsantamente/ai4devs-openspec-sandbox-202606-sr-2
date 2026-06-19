## Why

El formulario principal (`TFrmMain`) solo dispone de un botón en inglés ("Say Hello") que muestra un saludo en inglés. Se quiere añadir soporte para un saludo en español como ejercicio de evolución incremental sobre código legacy Delphi 5, siguiendo el flujo SDD.

## What Changes

- Añadir un nuevo `TButton` con el caption "Dice Hola" al formulario `TFrmMain` (`main.dfm`).
- Implementar el evento `Button2Click` en `main.pas` que ejecuta `ShowMessage('Hola, esto es Delphi 5')`.
- Ajustar el layout del formulario para que ambos botones sean visibles y no se solapen.

## Capabilities

### New Capabilities

- `spanish-greeting`: Botón en el formulario principal que muestra un saludo en español al ser pulsado.

### Modified Capabilities

_(ninguna — no se modifica el comportamiento del botón existente "Say Hello")_

## Impact

- **Formulario afectado**: `TFrmMain` (`Delphi5/main.dfm`)
- **Unidad Pascal afectada**: `main.pas`
- **Evento implicado**: `Button2Click`
- **Archivos Delphi modificados**: `main.pas`, `main.dfm`
- Sin cambios en `HelloDelphi5.dpr`, `VirtualUI_SDK.pas` ni `VirtualUI_AutoRun.pas`
