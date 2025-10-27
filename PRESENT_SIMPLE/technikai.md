# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:** A gyakorlatokhoz szükséges mondatok két, közvetlenül a JavaScript kódban definiált tömbben (`db_to3rd` és `db_base`) vannak tárolva. Ez a megközelítés egyszerűsíti a telepítést, mivel nincs szükség külső adatbázisra.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz.
    *   A füles navigáció (`tabs`) JavaScripttel kezeli a különböző gyakorlati módok közötti váltást.
*   **Nyelvtani logika:** A JavaScript kód tartalmazza a Present Simple igeidő nyelvtani szabályainak implementációját:
    *   `thirdPersonS(verb)`: Kiegészíti az igét a helyes egyes szám harmadik személyű végződéssel (-s, -es, -ies).
    *   `toBaseVerb(word)`: Visszaalakítja az igét alapalakba (pl. `has` -> `have`, `goes` -> `go`).
    *   `splitAff(sentence)`: Felbontja a mondatot alanyra, igére és a mondat többi részére.
    *   `needsDoes(subject)` és `isHeShe(subject)`: Segít eldönteni, hogy az alanyhoz `do` vagy `does` tartozik-e, illetve, hogy egyes szám harmadik személyű-e.
*   **Dinamikus megoldásgenerálás:**
    *   A `toThirdAll()`, `negAnswers()`, és `qAnswers()` függvények dinamikusan generálják az összes lehetséges helyes megoldást egy adott mondathoz és feladattípushoz. Ez magában foglalja az alany-ige egyeztetést és a névmások cseréjét (pl. "He" helyett "She" is elfogadott).
*   **Válaszellenőrzés:** A `normalize()` függvény megtisztítja a felhasználói bevitelt (kisbetűsre alakítás, írásjelek eltávolítása, szóközök normalizálása) az összehasonlítás előtt.
*   **Vizuális visszajelzés:** A `flashInput()` függvény rövid ideig megváltoztatja az input mező háttérszínét (zöld/piros) a helyes/helytelen válaszok jelzésére.
*   **Billentyűzetes vezérlés:** Az `Enter` billentyű lenyomására ellenőrzi a választ.
