## Context

`TFrmMain` es el formulario principal de `HelloDelphi5`. Actualmente contiene un único `TButton` ("Say Hello") cuyo evento `Button1Click` ejecuta `ShowMessage('Hello, this is Delphi 5')`. El cambio es aditivo: se añade un segundo botón sin alterar el comportamiento existente.

## Goals / Non-Goals

**Goals:**
- Añadir `Button2: TButton` con caption "Dice Hola" al formulario `TFrmMain`.
- Implementar `Button2Click` en `main.pas` que ejecuta `ShowMessage('Hola, esto es Delphi 5')`.
- Reposicionar ambos botones en el formulario para que no se solapen.

**Non-Goals:**
- Internacionalización ni soporte multi-idioma genérico.
- Cambios en la lógica de `Button1` ni en la inicialización de VirtualUI.
- Extracción de mensajes a recursos externos (`.rc`, `resourcestring`).

## Decisions

**1. Edición directa de `main.dfm` en texto plano**
El `.dfm` de Delphi 5 en formato texto es editable directamente. Se añade el bloque del nuevo botón junto al existente, ajustando `Top` para evitar solapamiento. Alternativa descartada: editar visualmente con el IDE — no es necesario para un cambio tan puntual.

**2. Implementación del handler en la sección `implementation` de `main.pas`**
Se sigue el mismo patrón que `Button1Click`: declaración en la sección `type` del formulario y cuerpo en `implementation`. Sin nuevas dependencias (`uses`).

## Risks / Trade-offs

- [Riesgo bajo] El layout del formulario puede verse diferente en resoluciones distintas → se evita usando coordenadas absolutas coherentes con las ya existentes en el `.dfm`.
- [Sin riesgo de regresión] El botón "Say Hello" y su handler `Button1Click` no se tocan.
