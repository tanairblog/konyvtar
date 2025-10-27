# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Architektúra:** A teljes JavaScript kód egy IIFE-be (Immediately Invoked Function Expression) van csomagolva, ami megakadályozza a globális névtér szennyezését.
*   **Adatkezelés:** A gyakorlatokhoz szükséges adatok (definíciók, szavak, vonatkozó névmásos mondatok, helyes válaszok) közvetlenül a JavaScript kódban vannak tárolva, `DEFS_DB` és `REL_DB` nevű tömbökben.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz, és egyedi háttérképet a vizuális megjelenéshez.
    *   A füles navigáció (`tabs`) és az al-módok közötti váltás JavaScripttel történik.
*   **Játéklogika modularitása:** Az egyes játékmódok (Definitions, Relative Fill-in, Relative Multiple Choice) saját állapotkezeléssel (`items`, `i` az aktuális index) és funkciókkal (`load`, `submit`, `pass`, `next`) rendelkeznek, ami tisztább kódot eredményez.
*   **Válaszellenőrzés:**
    *   A `norm()` segédfüggvény normalizálja a felhasználói bevitelt és a tárolt megoldásokat (kisbetűsre alakítás, szóközök és írásjelek eltávolítása) az összehasonlítás előtt.
    *   A "Definitions" módban a `defsNormMatch` függvény figyelembe veszi az aliasokat és az egyes/többes számú alakokat is.
*   **Véletlenszerűsítés:** A `shuffle()` segédfüggvény a Fisher-Yates algoritmust implementálja a feladatok sorrendjének véletlenszerű megkeverésére.
*   **Eseménykezelés:** A gombokra kattintva és az `Enter` billentyű lenyomására a megfelelő JavaScript függvények futnak le.
