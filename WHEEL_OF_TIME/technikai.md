# Technikai áttekintés: 24 órás pizza-diagram

Ez a dokumentum az `index.html` fájlban található alkalmazás belső működését és a felhasznált technikai megoldásokat részletezi.

## Architektúra és működés

Az alkalmazás egyetlen HTML fájlból áll, amely tartalmazza a szerkezetet (HTML), a stílust (CSS) és a logikát (JavaScript) is. Nem használ külső könyvtárakat vagy keretrendszereket (pl. React, Vue, D3.js).

### 1. JavaScript alapok

* **Névtér-védelem:** A teljes szkript egy azonnal végrehajtódó függvénymegoldásba (IIFE - Immediately Invoked Function Expression) van csomagolva `(() => { ... })();`, hogy elkerülje a globális névtér szennyezését.
* **Állapotkezelés (State Management):** Az alkalmazás központi állapota (state) egy JavaScript `Map` objektumban (`state`) van tárolva. Ez a térkép a tevékenységek kulcsait (pl. `'sleep'`) és a hozzájuk rendelt időt (percekben) tárolja.
* **Adatdefiníció:** Két fő konstanst használ:
    * `ACTIVITIES`: Egy objektumtömb, amely meghatározza a tevékenységek kulcsait és a megjelenítendő címkéket.
    * `COLORS`: Egy 13 színből álló tömb (Okabe–Ito és Tol variánsok), amelyet a színtévesztők is jobban megkülönböztetnek.

### 2. Dinamikus UI generálás

Az oldal betöltésekor a szkript lefut, és dinamikusan hozza létre a felhasználói felület elemeit:

1.  Végigiterál az `ACTIVITIES` tömbön.
2.  Minden tevékenységhez létrehoz egy beviteli sort (`.row`) a bal oldali panelen (`#rows`).
3.  Minden tevékenységhez létrehoz egy legenda-elemet (`.leg-item`) a jobb oldali panelen (`#legend`).
4.  `input` eseményfigyelőket csatol minden óra és perc beviteli mezőhöz.

### 3. Reaktivitás és renderelés

* **Eseménykezelés (`onChange`):** Amikor a felhasználó módosít egy beviteli mezőt, az `onChange` funkció lefut.
* **Adat-szanitizálás:** A beírt értékeket számmá alakítja, és biztosítja, hogy az óra 0-24, a perc pedig 0-59 között maradjon.
* **Állapotfrissítés:** Kiszámolja a teljes percet az adott tevékenységhez, és frissíti a `state` térképet.
* **Renderelés (`render()`):** Az állapot frissítése után azonnal meghívja a központi `render()` funkciót.

### 4. SVG diagram rajzolása

A diagram nem egy előre elkészített könyvtár, hanem **manuálisan generált SVG** elemekből áll.

* **Számítás:** A `render()` funkció kiszámolja az összes felhasznált percet (`used`), a hátralévő időt (`remaining`) és a százalékos kitöltést (`pct`).
* **DOM frissítés:** Frissíti a statisztikai elemek (`#remainingEl`, `#usedEl` stb.) és a diagram közepén lévő százalék (`#centerPercent`) szöveges tartalmát.
* **Szeletek rajzolása:**
    1.  Kitörli az előzőleg rajzolt szeleteket (`slicesEl.innerHTML = ''`).
    2.  Végigiterál az `ACTIVITIES` tömbön (és a `state` térképen).
    3.  Minden *pozitív* idejű tevékenységhez kiszámolja annak arányát a **teljes 24 órából (1440 perc)**.
    4.  Trigonometria segítségével (`polar()` és `arcPath()` segédfüggvények) kiszámítja a körcikk (fánkszelet) SVG `<path>` `d` attribútumát.
    5.  Létrehoz egy új SVG `<path>` elemet a megfelelő színnel, árnyékkal és egy beágyazott `<title>` elemmel (ez biztosítja a tooltipet).
* **Maradék szelet:** Ha a felhasznált idő kevesebb, mint 1440 perc, a szkript egy utolsó, sötétszürke "Unallocated" (Be nem osztott) szeletet is rajzol, hogy a kör teljes legyen.

## Felhasznált technikai megoldások

* **HTML:** Szemantikus HTML elemek, `aria-*` attribútumok és SVG a diagramhoz.
* **CSS:**
    * **CSS változók (Variables):** A `:root`-ban definiált változók (pl. `--bg`, `--text`) biztosítják az egységes sötét témát.
    * **CSS Grid:** Az alkalmazás fő elrendezése (`.app`) és a beviteli sorok (`.row`) is `display: grid`-et használnak.
    * **Reszponzivitás:** `@media (max-width: 880px)` média lekérdezés biztosítja, hogy az elrendezés kisebb képernyőkön egyoszloposra váltson.
    * **Fluid tipográfia:** A `clamp()` függvényt használja a címsor (`h1`) méretének reszponzív beállítására.
* **JavaScript (ES6+):**
    * Modern szintaxis (`const`, `let`, nyílfüggvények).
    * `Map` objektum az állapotkezeléshez.
    * Vanilla JS DOM manipuláció (nincs jQuery vagy más absztrakció).
* **SVG (Scalable Vector Graphics):**
    * A diagram dinamikus generálása SVG `path` elemekkel.
    * SVG `<filter>` (pl. `feDropShadow`) a szeletek finom árnyékolásához.
* **Böngésző API-k:**
    * **`localStorage`:** A `Mentés` és `Betöltés` funkciók a `localStorage.setItem()` és `localStorage.getItem()` metódusokat használják. Az adatokat JSON formátumban tárolja (`JSON.stringify` / `JSON.parse`).
