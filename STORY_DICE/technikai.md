# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   A történeti elemek (Hős, Helyszín, Konfliktus, Bonyodalom, Megoldás) kategóriákba rendezve, közvetlenül a JavaScript kódban vannak tárolva (`DATASETS` objektum).
    *   Az egyes elemekhez tartozó ikonok (emojik) az `ICONS` objektumban vannak definiálva.
    *   A "Helpful Language" (segítő nyelvezet) példamondatai a `HELP_TEXT` objektumban találhatók.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz, és egy radiális gradienst a háttérhez.
*   **3D Kocka Animáció:** A kockák dobásának animációja CSS `transform-style: preserve-3d` és `transform: rotateX/Y` tulajdonságok segítségével valósul meg. A JavaScript véletlenszerűen generálja a forgatási szögeket, szimulálva a kockadobást.
*   **Véletlenszerű választás:** A `randomOf()` és `randomChoiceFor()` függvények biztosítják a véletlenszerű történeti elemek kiválasztását.
*   **Dinamikus UI generálás:** A JavaScript dinamikusan építi fel a kocka elemeket, frissíti a felületüket a kiválasztott ikonokkal, és megjeleníti az eredményeket.
*   **Állapotkezelés:** A `currentChoices` objektum tárolja az aktuálisan kiválasztott elemeket minden kategóriához.
*   **Vágólap integráció:** A `navigator.clipboard.writeText` API-t használja a generált történeti elemek és az egysoros történet vágólapra másolásához.
*   **Segédfüggvények:** A kód tartalmaz olyan segédfüggvényeket, mint az `el` (HTML elemek létrehozására).
