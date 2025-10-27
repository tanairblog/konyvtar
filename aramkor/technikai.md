# Véletlenszerű Áramkör Generátor - Technikai Dokumentáció

Ez a dokumentum az áramkör generátor technikai felépítését és az áramkör-generálási algoritmust ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal minimális szerkezetét adja.
* **CSS:** Az alapvető stílusokat tartalmazza.
* **JavaScript (Vanilla JS):** A teljes generálási logikát és a vizuális megjelenítést ez a szkript végzi. A megjelenítéshez dinamikusan generál SVG (Scalable Vector Graphics) kódot.

## Fájlstruktúra

Az alkalmazás egyetlen, önálló HTML fájl, amely tartalmazza a CSS és JavaScript kódot.

## Működési logika

A program működése a `renderCircuit` és a `generateCircuit` függvényeken alapul.

1.  **Adatstruktúra:**
    * **Alkatrészek (`components`):** Egy tömb, amely objektumokat tartalmaz. Minden objektum egy alkatrész típusát, szimbólumát és a rajzoláshoz szükséges szélességét (`width`) definiálja.
    * **Véletlenszám-generátor:** Egy egyszerű, seed-alapú álvéletlen-szám generátort használ (`random` függvény), ami lehetővé tenné a reprodukálható áramkörök generálását, bár a `seed` minden új generáláskor véletlenszerűen újra beállításra kerül.

2.  **Áramkör generálása (`generateCircuit`):**
    * Véletlenszerűen meghatározza a párhuzamos ágak számát (2-3).
    * Véletlenszerűen meghatározza az összes alkatrész számát (6-11).
    * Létrehoz egy `branches` nevű, kétdimenziós tömböt.
    * Az összes alkatrészt véletlenszerűen elosztja a párhuzamos ágak között.
    * Biztosítja, hogy egyetlen ág se maradjon üresen.
    * Az eredmény egy tömb, amelynek minden eleme egy-egy ág, ami pedig az adott ágban lévő alkatrészek objektumainak tömbje.

3.  **Megjelenítés (`renderCircuit`):**
    * Meghívja a `generateCircuit` függvényt az áramkör adatstruktúrájának létrehozásához.
    * Kiszámítja a rajz méreteit az ágak száma és a leghosszabb ág szélessége alapján.
    * Elkezdi felépíteni az SVG kódot egy string változóban. Először a keretet, a rácsot és a közös vezetékeket (buszokat) rajzolja meg.
    * Végigiterál a `branches` adatszerkezeten. Minden ághoz és minden alkatrészhez meghívja a `compSVG` segédfüggvényt.
    * A `compSVG` függvény egy `switch` szerkezettel az alkatrész típusa alapján visszaadja a megfelelő SVG kódrészletet (pl. egy ellenállás cikk-cakk vonalát).
    * A kész SVG stringet beilleszti a `svgContainer` div `innerHTML`-ébe, ezzel megjelenítve a rajzot.

4.  **Interakció:** A "Generate New Circuit" gomb újra beállítja a `seed` értékét és újra meghívja a `renderCircuit` függvényt.
