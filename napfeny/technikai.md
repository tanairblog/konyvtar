# Napsugárzás Szimulátor - Technikai Dokumentáció

Ez a dokumentum a napsugárzás szimulátor technikai felépítését és működési logikáját ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét, a vezérlőket és a szimulációs elemeket tartalmazza.
* **CSS:** A vizuális megjelenésért, a napsugár és a felület stílusáért, valamint a színátmenetekért felelős.
* **JavaScript (Vanilla JS):** A teljes szimulációs logika, a számítások és a vizuális elemek dinamikus frissítése a szkriptben valósul meg.

## Fájlstruktúra

Az alkalmazás egyetlen, önálló HTML fájlból áll, amelyben a CSS és a JavaScript kód is megtalálható.

## Működési logika

Az alkalmazás logikája a két bemeneti csúszka (`input` esemény) által vezérelt `updateSimulation` függvényre épül.

1.  **Bemeneti adatok:** A függvény minden futáskor beolvassa a `angleSlider` és a `durationSlider` aktuális értékeit.

2.  **Számítások:**
    * **Intenzitás:** Az energia intenzitását a beesési szög szinuszával számolja ki (`Math.sin(angle * Math.PI / 180)`). Ez a trigonometrikus összefüggés helyesen modellezi, hogy a merőlegesen (90°) beeső sugárzás adja a maximális (100%) intenzitást, míg a laposabb szögeknél az energia nagyobb területen oszlik el, így az intenzitás csökken.
    * **Teljes energia:** A felhalmozott hőenergiát az intenzitás és az időtartam egyszerű szorzataként számolja (`intensityFactor * duration * 100`).

3.  **Vizuális frissítés:**
    * **Napsugár:** A napsugár `div`-jének dőlésszögét CSS `transform: rotate()` tulajdonsággal állítja be. A forgatás szöge `90 - angle`. Az átlátszóságát (`opacity`) is az intenzitástól teszi függővé.
    * **"Forró folt" a felületen:** Ez a legtrükkösebb vizuális elem. A felület `div`-jének egy `::after` pszeudo-elemét manipulálja.
        * **Szélesség:** A folt szélessége fordítottan arányos az intenzitással (`baseWidth / intensityFactor`), ami helyesen szimulálja az energia eloszlását.
        * **Szín és ragyogás:** A folt színét és a körülötte lévő ragyogást (`box-shadow`) dinamikusan számolja ki a teljes energia alapján. A HSL (Hue, Saturation, Lightness) színmodellt használja, ahol a `hue` (színárnyalat) a vörös (0) és a sárga (60) között változik az energia növekedésével. Ezt a dinamikusan generált CSS szabályt egy külön `<style>` elembe írja bele, amit a JavaScript kezel.

4.  **Eseménykezelés:** `input` eseményfigyelők vannak a csúszkákon, amelyek minden változáskor meghívják az `updateSimulation` függvényt. Egy `load` eseményfigyelő biztosítja, hogy az oldal betöltésekor is lefusson a kezdőállapot beállítása.
