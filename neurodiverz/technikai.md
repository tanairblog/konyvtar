# Neurodiverz technikai leírás

Az alkalmazás egyetlen HTML fájlból áll, amely tartalmazza a szükséges HTML, CSS és JavaScript kódot.

## Függőségek

-   **Tailwind CSS**: A felhasználói felület stílusozásához használt CSS keretrendszer. A CDN-ről töltődik be.
-   **TensorFlow.js**: A gépi tanulási modell futtatásához szükséges könyvtár. A CDN-ről töltődik be.
-   **MediaPipe Face Detector**: A TensorFlow.js-hez készült arcfelismerő modell. A CDN-ről töltődik be.

## Működés

1.  **Kamera inicializálása**: Az oldal betöltődésekor a JavaScript kód inicializálja a webkamerát.
2.  **Modell betöltése**: A TensorFlow.js és a MediaPipe Face Detector modell betöltődik.
3.  **Arcfelismerés**: Az alkalmazás folyamatosan érzékeli az arcokat a kamera képén.
4.  **Pixelizálás**: Az érzékelt arcokra egy pixelizáló effektet alkalmaz a program. A képkockákat egy `<canvas>` elemre rajzolja, és a `drawImage` metódussal hozza létre a pixelizált hatást.