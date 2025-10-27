# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:** A szóképzési feladatok (`ITEMS`) közvetlenül a JavaScript kódban vannak tárolva, objektumok tömbjeként, `s` (mondat), `base` (alapszó), `ans` (helyes válasz) és opcionális `variants` (alternatív helyes válaszok) tulajdonságokkal.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ egy "tinédzserbarát" világos témához.
*   **Gamifikációs rendszer:**
    *   **Pontozás, sorozatok (streaks), elsajátítási szintek:** Az alkalmazás komplex pontozási rendszert implementál, amely jutalmazza a helyes válaszokat, követi a helyes válaszok sorozatát, és figyeli az egyes szavak elsajátítási szintjét.
    *   **Jelvények:** Különböző feltételek teljesítése esetén jelvényeket (`badges`) kap a felhasználó.
    *   **Életek (Challenge módban):** A "Challenge" módban a felhasználó életekkel gazdálkodik, a hibás válaszok csökkentik az életek számát.
*   **Állapotkezelés és Perzisztencia:**
    *   A teljes játékállapot (`S` objektum: pontszám, sorozat, elsajátítási szintek, egyéni szóhaladás, történet) a böngésző `localStorage` API-jába (`STORAGE_KEY`) mentődik, így a felhasználó haladása megmarad a munkamenetek között.
    *   A `load()` és `save()` függvények kezelik az állapot betöltését és mentését.
*   **Konfetti animáció:** Helyes válasz esetén egy `<canvas>` elemen keresztül konfetti animáció jelenik meg, amelyet a `requestAnimationFrame` API vezérel.
*   **Válaszellenőrzés és normalizálás:** A `norm()` segédfüggvény normalizálja a felhasználói bevitelt és a tárolt megoldásokat (kisbetűsre alakítás, szóközök eltávolítása) a rugalmas összehasonlítás érdekében.
*   **Hibák áttekintése (Review modal):** Egy modális ablakban megtekinthető az összes korábbi próbálkozás, és lehetőség van az egyes tételek újrapróbálására.
*   **Billentyűparancsok:** `Enter` a válasz ellenőrzéséhez, `H` a tipp megjelenítéséhez.
*   **Adatok exportálása:** A munkamenet adatai JSON formátumban exportálhatók.
