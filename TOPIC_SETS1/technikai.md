# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatmodell (`STEPS`):** A bemutatkozó szöveg felépítését egy `STEPS` nevű JavaScript tömb definiálja. Minden elem egy lépést ír le, amely tartalmazza a lépés azonosítóját (`id`), címét (`title`) és a részeit (`parts`). A `parts` tömb határozza meg, hogy az adott lépés szöveges részekből (`type: "text"`), beviteli mezőkből (`type: "input"`, `type: "number"`) vagy legördülő listákból (`type: "select"`) áll.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan generálódnak a `renderStep()` függvény segítségével, a `STEPS` adatmodell alapján.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz.
*   **Állapotkezelés és Perzisztencia:**
    *   Az alkalmazás állapota (aktuális lépés indexe: `stepIndex`, felhasználói bevitelek: `values`) egy globális `state` JavaScript objektumban van tárolva.
    *   A felhasználói bevitelek és az aktuális lépés automatikusan mentésre kerülnek a böngésző `localStorage` API-jába (`LS_KEY` kulcs alatt), így a haladás megmarad a böngésző bezárása után is.
*   **Valós idejű előnézet:** A `composeStep()` függvény felelős az egyes lépések szövegének összeállításáért a felhasználói bevitelek és a statikus szövegek alapján. A `renderPreview()` függvény pedig az összes lépésből generálja a teljes bemutatkozó szöveget, amely azonnal frissül a felhasználói interakciók hatására.
*   **Eseménykezelés:** Az `input` események delegáltan vannak kezelve a `step-content` konténeren, ami hatékonyabbá teszi a dinamikusan generált űrlapmezők kezelését.
*   **Vágólap integráció:** A `navigator.clipboard.writeText` API-t használja a generált szöveg vágólapra másolásához.
*   **Fájlletöltés:** A `Blob` és `URL.createObjectURL` API-k segítségével a generált szöveg letölthető `.txt` fájlként.
*   **Segédfüggvények:** A kód tartalmaz olyan segédfüggvényeket, mint az `el` (HTML elemek létrehozására) és `esc` (HTML entitások kódolására).
