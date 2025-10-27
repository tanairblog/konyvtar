# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:** A gyakorlatokhoz szükséges adatok (nemzetiségek, színek, számok, tárgyak) közvetlenül a JavaScript kódban vannak tárolva egy `DB` nevű objektumban. Ez a megközelítés egyszerűsíti a telepítést, mivel nincs szükség külső adatbázisra vagy API-ra.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz és a kerék szeleteinek színezéséhez.
*   **Pörgethető kerék animáció:**
    *   A kerék szeleteinek vizuális megjelenítését CSS `conic-gradient` tulajdonság biztosítja.
    *   A pörgetés animációja CSS `transform: rotate` és `transition` segítségével valósul meg. A JavaScript véletlenszerűen számítja ki a célforgatási szöget, figyelembe véve a "pörgetési erőt" (amelyet a gomb lenyomva tartásának ideje szimulál).
*   **Dinamikus feladatgenerálás:** A `nextQuestion()` függvény dinamikusan generálja a feladatot a kerék által kiválasztott kategória alapján.
*   **Időzítő:** Minden feladathoz egy 30 másodperces visszaszámláló tartozik, amelyet `setInterval` implementál. A `timerFill` elem vizuálisan is megjeleníti a hátralévő időt.
*   **Válaszellenőrzés és normalizálás:** A `norm()` segédfüggvény normalizálja a felhasználói bevitelt és a tárolt megoldásokat (kisbetűsre alakítás, szóközök és kötőjelek kezelése) az összehasonlítás előtt.
*   **Eseménykezelés:** A gombokra kattintva, az `Enter` billentyű lenyomására, valamint az egér/érintés eseményekre (a pörgetési erő méréséhez) a megfelelő JavaScript függvények futnak le.
