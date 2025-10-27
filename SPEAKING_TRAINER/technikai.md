# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   A beszédgyakorló kérdések (`QUESTIONS`) és a hozzájuk tartozó mintaválaszok (`SAMPLES`) közvetlenül a JavaScript kódban vannak tárolva, tömbök formájában.
    *   Az alapértelmezett szószedet (`DEFAULT_GLOSSARY`) angol-magyar kifejezéspárokat tartalmazó tömb.
    *   **Egyéni szószedet:** A felhasználók saját kifejezéseket importálhatnak, amelyek a böngésző `localStorage` API-jában (`LS_KEY`) tárolódnak, így a beállítások megmaradnak a munkamenetek között.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz, és komplex háttérképeket a vizuális élmény fokozására.
*   **Kártya animáció:** A kifejezéskártyák megfordítását CSS `transform-style: preserve-3d` és `transform: rotateY` tulajdonságok animálják, sima 3D hatást biztosítva.
*   **Időzítő:** A 90 másodperces visszaszámláló `setInterval` segítségével van implementálva, és a `performance.now()`-t használja a pontos időméréshez.
*   **Véletlenszerű választás:** A `Math.random()` és `Math.floor()` függvények biztosítják a véletlenszerű kérdések és szószedet kártyák kiválasztását.
*   **Állapotkezelés:** Az alkalmazás állapota (aktuális kérdés indexe, kiválasztott kifejezések, időzítő állapota) globális JavaScript változókban van tárolva.
*   **Szövegfeldolgozás:** A `parsePairs()` függvény kezeli a felhasználó által beillesztett egyéni szószedet szövegének feldolgozását, soronkénti angol-magyar párokra bontva.
