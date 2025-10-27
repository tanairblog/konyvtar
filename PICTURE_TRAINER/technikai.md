# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   A képleírás strukturált lépései (`STEPS`) és az egyes témakörök (`DATA.topics`) adatai (képek elérési útvonalai, irányító kérdések) közvetlenül a JavaScript kódban vannak tárolva.
    *   Ez a megközelítés egyszerűsíti a telepítést, mivel nincs szükség külső adatbázisra vagy API-ra.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével, a felhasználói interakciók és az alkalmazás állapota alapján.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz.
*   **Állapotkezelés és Perzisztencia:**
    *   Az alkalmazás aktuális állapota (kiválasztott téma, feladat, aktuális tipp lépés, felfedezett tippek, időzítő állása) egy globális `state` JavaScript objektumban van tárolva.
    *   A `state` objektum a böngésző `localStorage` API-jába mentődik (`save()` és `load()` függvények), így a felhasználó haladása megmarad a böngésző bezárása után is.
*   **Időzítő:** Az időzítő `setInterval` segítségével van implementálva, és a `fmtTime` segédfüggvény formázza a megjelenítést.
*   **Modellválasz generálás:** A `makeModel()` függvény a már felfedezett tippek első promptjait összefűzve generál egy példa leírást, amely segíti a felhasználót a saját válaszának felépítésében.
*   **Öntesztek:** A kód tartalmaz egy `runSelfTests()` függvényt, amely alapvető konzol-teszteket futtat az alkalmazás indulásakor, ellenőrizve a főbb funkciók helyes működését.
