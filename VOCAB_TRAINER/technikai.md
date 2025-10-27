# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   A kifejezések (`DATA_FALLBACK`, `window.DATA`) közvetlenül a JavaScript kódban vannak tárolva, objektumok tömbjeként, `en`, `hu` és `cluster` tulajdonságokkal.
    *   A `normalizeData()` függvény biztosítja az adatok egységes formátumát.
    *   **Egyéni szószedet importálása:** Lehetőség van külső JSON fájlból szószedet importálására, amely a `localStorage`-ben tárolódik (`EXTRA_DATA_JSON` kulcs alatt), és egyesül az alapértelmezett adatokkal.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz.
    *   A füles navigáció (`tabs`) JavaScripttel kezeli a különböző játékmódok közötti váltást.
*   **Állapotkezelés és Perzisztencia:**
    *   A felhasználói beállítások (nyelvi irány, klaszter) és a haladás (ismert szavak, játékmódok statisztikái) a böngésző `localStorage` API-jába (`LS` objektum és `SKEY` kulcsok) mentődik.
    *   A `getKnownSet()` és `setKnownSet()` függvények kezelik az ismert szavak halmazát.
*   **Flashcard animáció:** A kártyák megfordítását CSS `transform-style: preserve-3d` és `transform: rotateY` tulajdonságok animálják, sima 3D hatást biztosítva.
*   **Játéklogika modularitása:** Minden játékmód (Flashcards, Matching, Multiple Choice, Quick Fire) saját logikával és frissítési mechanizmussal rendelkezik, amelyek a `flashBuildDeck()`, `matchNewRound()`, `mcBuild()`, `qfSetup()` függvényekben vannak implementálva.
*   **Véletlenszerűsítés:** A `shuffle()` és `sample()` segédfüggvények biztosítják a véletlenszerű elemek kiválasztását és a listák megkeverését.
*   **JSON Import/Export:** A `dbFab` panelen keresztül lehetőség van a teljes adatbázis JSON formátumban történő exportálására, valamint új adatok importálására.
