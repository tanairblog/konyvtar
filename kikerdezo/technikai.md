# Kikérdező technikai leírás

Az alkalmazás egyetlen HTML fájlból áll, amely tartalmazza a szükséges HTML, CSS és JavaScript kódot.

## Függőségek

-   **xlsx.full.min.js**: Ez a könyvtár szükséges a `fogalmak.xlsx` fájl beolvasásához és feldolgozásához. A könyvtár a CDN-ről töltődik be.

## Működés

1.  **Adatbetöltés**: Az oldal betöltődésekor a JavaScript kód a `fetch` API segítségével beolvassa a `fogalmag.xlsx` fájlt.
2.  **XLSX feldolgozás**: Az `xlsx` könyvtár segítségével a JavaScript kód feldolgozza az Excel fájlt, és kinyeri a fogalmakat, definíciókat és a fejezetek címeit.
3.  **Felhasználói felület**: A fejezetek listája dinamikusan generálódik a beolvasott adatok alapján.
4.  **Gyakorlás**: A "Gyakorlás indítása" gombra kattintva a kiválasztott fejezetekből véletlenszerűen kiválasztott kártyák jelennek meg. A felhasználó értékelheti a tudását, és a program ennek megfelelően kezeli a kártyákat.
5.  **Állapotkezelés**: A program JavaScript változókban tárolja a jelenlegi állapotot, beleértve az aktív kártyákat, a jelenlegi kártya indexét és a gyakorlási módot.