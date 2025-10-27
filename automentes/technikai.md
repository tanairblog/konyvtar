# Hogyan érkeztél? - Technikai Dokumentáció

Ez a dokumentum az interaktív szavazóalkalmazás technikai felépítését ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét adja, beleértve a kattintható ikonokat és a diagram vásznát.
* **CSS:** Az elemek, különösen az ikonok vizuális stílusáért felel.
* **JavaScript (Vanilla JS):** A szavazatok számlálását, a diagram frissítését és a CSV exportálást végzi.
* **Chart.js:** Egy külső diagramkészítő könyvtár, amely az oszlopdiagram létrehozásáért és frissítéséért felelős.

## Fájlstruktúra

Az alkalmazás egyetlen HTML fájlban valósul meg, amely a `head` szekcióban hivatkozik a Chart.js könyvtárra.

## Működési logika

Az alkalmazás logikája egyszerű és eseményvezérelt.

1.  **Adattárolás:** A szavazatokat egy `tally` nevű JavaScript objektum tárolja, ahol a kulcsok az utazási módok, az értékek pedig az eddig leadott szavazatok száma.

2.  **Diagram inicializálása:** Az oldal betöltésekor a Chart.js segítségével létrejön egy oszlopdiagram a `tally` objektum kezdeti (nulla) értékei alapján. A diagram beállításaiban a legenda ki van kapcsolva az egyszerűbb megjelenés érdekében.

3.  **Szavazás kezelése (`updateChart`):**
    * Minden ikonra egy `onclick` esemény van beállítva, amely meghívja az `updateChart` függvényt a megfelelő utazási mód nevével.
    * A függvény megnöveli eggyel a `tally` objektum megfelelő értékét.
    * Frissíti a `resultChart` diagram adatforrását a `tally` objektum új értékeivel.
    * Meghívja a `resultChart.update()` metódust, amely animációval újrarajzolja a diagramot.

4.  **CSV exportálás (`downloadCSV`):**
    * Egy `keydown` eseményfigyelő van a teljes dokumentumon, amely az `Alt + Ctrl + T` billentyűkombinációt figyeli.
    * A kombináció lenyomásakor a `downloadCSV` függvény lefut.
    * A függvény a diagram aktuális címkéiből és adataiból egy CSV formátumú szöveget (`csvContent`) állít össze.
    * Létrehoz egy `Blob` objektumot a CSV szövegből.
    * Egy ideiglenes, láthatatlan `<a>` (link) elem segítségével programozottan elindítja a generált fájl letöltését.
    * A letöltés után az ideiglenes elemet eltávolítja a DOM-ból.
