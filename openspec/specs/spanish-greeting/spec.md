# Capability: spanish-greeting

## Purpose
Botón de saludo en español en el formulario principal de HelloDelphi5.

## Requirements

### Requirement: Botón de saludo en español
El formulario principal (`TFrmMain`) SHALL mostrar un botón con el texto "Dice Hola" que, al ser pulsado, muestre el mensaje "Hola, esto es Delphi 5".

#### Scenario: Botón visible en el formulario
- **WHEN** el usuario abre la aplicación `HelloDelphi5`
- **THEN** el formulario muestra el botón "Dice Hola" sin solaparse con el botón "Say Hello"

#### Scenario: Pulsación del botón muestra saludo en español
- **WHEN** el usuario pulsa el botón "Dice Hola"
- **THEN** se muestra un cuadro de diálogo con el mensaje "Hola, esto es Delphi 5"

#### Scenario: Botón existente no se ve afectado
- **WHEN** el usuario pulsa el botón "Say Hello"
- **THEN** se muestra el mensaje "Hello, this is Delphi 5" (comportamiento sin cambios)
