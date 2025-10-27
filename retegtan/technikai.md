# Földtani Metszetek Játéka - Technikai Dokumentáció

Ez a dokumentum a játék technikai felépítését és a feladatgenerálás logikáját ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét biztosítja.
* **CSS:** A vizuális megjelenésért felel, beleértve a fosszilis háttérképet és az elemek stílusát.
* **JavaScript (Vanilla JS):** A játék teljes logikáját kezeli, a feladat generálásától az ellenőrzésig.

## Fájlstruktúra

Az alkalmazás egyetlen, önálló HTML fájlban található, amely tartalmazza a CSS stílusokat és a JavaScript kódot is.

## Működési logika

A program központi eleme a garantáltan megoldható, de nem triviális feladványok generálása.

1.  **Fő rétegsor (`allStrata`):** A játék minden indításakor létrehoz egy 8 rétegből álló virtuális "teljes földtani oszlopot". Minden réteg kap egy véletlenszerű színt és 2-4 véletlenszerűen kiválasztott ősmaradványtípust.

2.  **Minta generálása (`createStrictPartialOverlapSamples`):** Ez a legfontosabb logikai rész. A programnak három olyan rétegsor-intervallumot (mintát) kell találnia a 8 rétegből, amelyek:
    * **Részlegesen átfedik egymást:** Egyik minta sem tartalmazhatja teljesen a másikat.
    * **Megoldhatók:** Az átfedéseknek egyértelmű sorrendet kell kiadniuk.
    * A program addig generál véletlenszerű intervallumokat, amíg a `distinctPartialOverlap` feltételrendszer nem teljesül.

3.  **Helyes sorrend (`correctOrder`):** Miután a három érvényes minta létrejött, a program kiszámolja a helyes sorrendet. Ezt az egyes minták réteg-intervallumának középpontja (`midpoint`) alapján teszi meg. A legalacsonyabb középpontú minta a legidősebb, a legmagasabb a legfiatalabb.

4.  **Megjelenítés (`renderSamples`):** A generált adatok alapján a program dinamikusan felépíti a három minta HTML-kódját, és megjeleníti a rétegeket a megfelelő színekkel és ősmaradványokkal.

5.  **Ellenőrzés:** Az "Ellenőrzés" gombra kattintva a program összehasonlítja a felhasználó által a legördülő menükben kiválasztott sorrendet a korábban kiszámított `correctOrder` tömbbel.
    * Egyezés esetén megjeleníti a teljes földtani oszlopot (`renderBigColumn`), amely az `allStrata` adatai alapján készül.
    * Eltérés esetén hibaüzenetet ad.
