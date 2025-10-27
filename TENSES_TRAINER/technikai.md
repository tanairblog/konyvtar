# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   Az igeidők definíciói (`TENSES`), a rendhagyó igék listája (`IRREG`), a "puskázó" tartalma (`CHEAT`) és az összes gyakorló mondat (`INV`) közvetlenül a JavaScript kódban vannak tárolva.
    *   Ez a megközelítés egyszerűsíti a telepítést, mivel nincs szükség külső adatbázisra vagy API-ra.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ egy "Calm Slate" sötét témához, amely kíméli a szemet.
    *   A navigáció a `location.hash` tulajdonságon alapul, ami lehetővé teszi az egyoldalas alkalmazás (SPA) jellegű működést a különböző játékmódok között.
*   **Moduláris játéklogika:** Minden játékmód (pl. `IgyGame`, `ClozeGame`, `ChooseGame`, `TrGame`) egy külön JavaScript objektumként van implementálva, amely saját állapotot és metódusokat tartalmaz. Ez elősegíti a kód modularitását és karbantarthatóságát.
*   **Nyelvtani logika:** A JavaScript kód tartalmazza az angol igeidők képzésének komplex logikáját, beleértve:
    *   `thirdPersonS()`: Egyes szám harmadik személyű igék képzése (-s, -es, -ies).
    *   `ingForm()`: Folyamatos alakok képzése (-ing).
    *   `pastSimple()`, `pastParticiple()`: Múlt idejű és befejezett melléknévi igenévi alakok képzése, figyelembe véve a rendhagyó igéket.
    *   `buildSentence()`: Dinamikusan generál mondatokat a kiválasztott igeidő, alany és ige alapján.
*   **Válaszellenőrzés:** A `normalize()` és `expandContractions()` segédfüggvények kezelik a felhasználói bevitelt, lehetővé téve a rugalmas összehasonlítást a helyes megoldásokkal.
*   **Statisztikák:** A `Stats` objektum kezeli a felhasználói statisztikákat (megtekintések, próbálkozások, helyes válaszok), amelyeket a böngésző `localStorage`-ében tárol.
*   **Cheat Sheet (Modális ablak):** A "puskázó" egy modális ablakban jelenik meg, amely CSS-sel van elrejtve/megjelenítve.
