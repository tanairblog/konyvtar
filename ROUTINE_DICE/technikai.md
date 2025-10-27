# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz, és egy komplex `linear-gradient` háttérképet a vizuális megjelenéshez.
*   **3D Kocka Animáció:** A kocka dobásának animációja CSS `transform-style: preserve-3d` és `transform: rotateX/Y/Z` tulajdonságok segítségével valósul meg. A JavaScript véletlenszerűen generálja a forgatási szögeket, szimulálva a kockadobást.
*   **Adatkezelés:**
    *   A történetindító események (`prompts`) és a történeti iránymutatók (`CATEGORIES`) közvetlenül a JavaScript kódban vannak tárolva, egyszerű tömbök és objektumok formájában.
    *   A `usedPrompts` tömb nyomon követi, mely történetindítókat használták már fel, biztosítva, hogy ne ismétlődjenek, amíg a felhasználó nem reseteli a játékot.
*   **Véletlenszerű választás:** A `shuffle()` segédfüggvény (Fisher-Yates algoritmus) és a `pickOne()` függvények biztosítják a véletlenszerű történetindítók és iránymutatók kiválasztását.
*   **Eseménykezelés:** A gombokra kattintva és a kockára kattintva/billentyűzettel (Enter/Space) a megfelelő JavaScript függvények futnak le.
