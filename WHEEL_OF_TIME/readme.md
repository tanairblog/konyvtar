# Interaktív 24 órás pizza-diagram

Ez egy egyszerű, egyoldalas webalkalmazás, amely segít vizualizálni, hogyan töltöd el a napod 24 óráját. Egy "pizza" (vagy fánk) diagramon jeleníti meg a különböző tevékenységekre fordított idő arányait.

## Mit csinál?

* **Időbevitel:** Lehetőséget biztosít 13 előre meghatározott tevékenység (pl. alvás, sport, tanulás) időtartamának megadására óra és perc bontásban.
* **Azonnali vizualizáció:** Ahogy beírod az időt, a jobb oldali kördiagram azonnal frissül, és egy színes szelettel jeleníti meg az adott tevékenység arányát a teljes 24 órából.
* **Statisztika:** Folyamatosan nyomon követi és kijelzi:
    * **Hátralévő idő:** Mennyi idő maradt a 24 órából.
    * **Felhasznált:** Mennyi időt osztottál már be összesen.
    * **Kitöltés:** A 24 óra hány százalékát töltötted már ki.
* **Túllépés jelzése:** Ha a megadott tevékenységek összes ideje meghaladja a 24 órát, a statisztikák piros színnel jeleznek.
* **Perzisztencia:** Lehetőséget ad az adatok böngészőben történő mentésére és későbbi visszatöltésére.

## Hogyan kell használni?

1.  **Idő megadása:** A bal oldali listában keresd meg a kívánt tevékenységet. A mellette lévő `h` (óra) és `m` (perc) mezőkbe írd be az arra fordított időt. A mezők csak számokat fogadnak el.
2.  **Diagram figyelése:** A jobb oldali diagram és a középen lévő százalékos kijelző automatikusan frissül minden beírt adattal.
3.  **Legenda:** A diagram alatt egy legenda segít azonosítani, hogy melyik szín melyik tevékenységhez tartozik.
4.  **Funkciógombok:**
    * **Reset:** Törli az összes beviteli mezőt és lenullázza a diagramot.
    * **Mentés:** Elmenti az aktuális időbeosztást a böngésződ helyi tárolójába.
    * **Betöltés:** Visszatölti a legutóbb mentett időbeosztást.
    * **Run tests:** (Fejlesztői funkció) Lefuttat néhány beépített tesztet a számítások ellenőrzésére.
