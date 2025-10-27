# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlból áll, amely **vanilla JavaScriptet** használ a teljes kliensoldali logika megvalósítására, külső keretrendszerek (mint React vagy Vue) nélkül.

## Főbb technikai jellemzők:

*   **Felhasználói felület (UI):**
    *   A teljes UI dinamikusan, JavaScript segítségével épül fel. A program egy `h()` nevű "hyperscript-stílusú" segédfüggvényt használ a HTML elemek programozott létrehozására, ami egy könnyűsúlyú alternatívája a komplexebb UI könyvtáraknak.
    *   A stílusokat egy, a HTML-be ágyazott CSS blokk definiálja, amely modern CSS-funkciókat, például custom property-ket (változókat) alkalmaz a könnyű témázhatóság érdekében.
*   **Állapotkezelés:**
    *   Az alkalmazás állapotát (kiválasztott mód, csapatnév, beszélgetési előzmények, felfedezett nyomok) egy globális `state` JavaScript objektum kezeli.
    *   A haladás perzisztenciáját a böngésző `localStorage` API-ja biztosítja, a `save()` és `load()` függvényeken keresztül.
*   **Kommunikáció a backenddel:**
    *   **API Módban** az alkalmazás a `fetch` API segítségével kommunikál a backenddel.
    *   A `loadApiCase()` függvény a `/case` végpontról tölti be az eset adatait (karakterek, nyomok listája).
    *   Az `apiAnswer()` függvény a felhasználó kérdését a `/ask` végpontra küldi POST kéréssel, és feldolgozza a kapott választ.
    *   A backend URL-je a `window.API_BASE` globális változóban van konfigurálva, ami könnyen módosítható.
*   **Demo Mód:**
    *   Ha az API nem elérhető, vagy a felhasználó a "Demo" módot választja, az alkalmazás egy beépített `DEMO_CASE` objektumot használ adatforrásként.
    *   Ebben a módban a `demoAnswer()` függvény egy egyszerű, kliensoldali logikával szimulálja a backend válaszait, kulcsszavas egyezések alapján.
*   **Struktúra:** A kód jól tagolt, külön függvények felelnek a különböző UI-komponensek rendereléséért (`renderCharacters`, `renderHistory`, `renderClues`), az események kezeléséért és az API-kommunikációért.
