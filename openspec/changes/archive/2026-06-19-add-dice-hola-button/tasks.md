## 1. Formulario (main.dfm)

- [x] 1.1 Añadir el componente `Button2: TButton` en `Delphi5/main.dfm` con caption "Dice Hola"
- [x] 1.2 Ajustar la propiedad `Top` de `Button2` para que no se solape con `Button1`
- [x] 1.3 Vincular el evento `OnClick` de `Button2` al handler `Button2Click`

## 2. Unidad Pascal (main.pas)

- [x] 2.1 Declarar `Button2: TButton` en la sección `type` de `TFrmMain` en `Delphi5/main.pas`
- [x] 2.2 Declarar el procedimiento `Button2Click(Sender: TObject)` en la sección `type` de `TFrmMain`
- [x] 2.3 Implementar el cuerpo de `Button2Click` en la sección `implementation` con `ShowMessage('Hola, esto es Delphi 5')`

## 3. Verificación

- [x] 3.1 Confirmar que el botón "Say Hello" sigue mostrando "Hello, this is Delphi 5" (sin regresión)

  ![Evidencia 3.1](../../../../Delphi5/evidences/Spainish-greeting%20evidence%203.1.png)

- [x] 3.2 Confirmar que el botón "Dice Hola" muestra "Hola, esto es Delphi 5" al ser pulsado

  ![Evidencia 3.2](../../../../Delphi5/evidences/Spainish-greeting%20evidence%203.2.png)
