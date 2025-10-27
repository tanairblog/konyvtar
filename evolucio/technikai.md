# Evolúciós Szimulátor - Technikai Dokumentáció

Ez a dokumentum az "Evolúciós Szimulátor" webalkalmazás technikai felépítését és működési logikáját ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét adja, beleértve a vezérlőelemeket és a szimulációs területet (`field`).
* **CSS:** A vizuális megjelenésért felel.
* **JavaScript (Vanilla JS):** Az alkalmazás teljes szimulációs logikáját és a DOM manipulációt kezeli.

## Fájlstruktúra

Az alkalmazás egyetlen, önálló HTML fájlban található, amely tartalmazza a CSS stílusokat és a JavaScript kódot is.

## Működési logika

A szimuláció egy `Animal` osztályra épül, és a generációs ciklusokat `setInterval` segítségével kezeli.

1.  **Adatstruktúra:** Az összes "állat" egy `animals` nevű tömbben tárolódik. Minden állat egy `Animal` osztálypéldány, amely a következő tulajdonságokkal rendelkezik:
    * `id`, `parentId`: Egyedi azonosítók a vérvonal követéséhez.
    * `element`: A hozzá tartozó HTML `div` elem.
    * `color`: Az állat RGB színe, objektum formában.
    * `x`, `y`, `dx`, `dy`: Pozíció és sebesség a képernyőn.

2.  **Szimulációs ciklus:** A `toggleSimulation` függvény indítja és állítja le a két fő ciklust:
    * **Mozgás (`simulationInterval`):** 40 ezredmásodpercenként frissíti minden állat pozícióját a `move` metódus meghívásával.
    * **Generációváltás (`generationInterval`):** Másodpercenként lefut, és végrehajtja a szelekciót és a szaporodást.

3.  **Szelekció logikája:**
    * Minden generációváltáskor a program kiszámítja az egyes állatok "rátermettségét" (`fitness`). A rátermettséget a `colorDistance` függvény adja meg, amely az állat és a háttér színe közötti euklideszi távolságot számolja ki az RGB színtérben.
    * Az `animals` tömböt a rátermettség alapján rendezi (a kisebb távolság, azaz a jobb rejtőzködés a jobb).
    * A populáció rosszabbul teljesítő felét (`removed`) eltávolítja a tömbből és a DOM-ból.

4.  **Szaporodás logikája:**
    * A túlélő populáció minden tagja (`survivors`) létrehoz egy új `Animal` példányt (utódot).
    * Az utód a szülőjétől örökli a színét, de egy kis, véletlenszerű mutációval. A mutáció során az RGB értékek egy `mutationStrength` értékkel módosulnak.

5.  **Vérvonal követése:** A felhasználó egy állatra kattintva kijelölhet egy "őst". Az `updateHighlights` függvény egy `animalMap` segítségével rekurzívan végigköveti a szülő-gyerek kapcsolatokat, és CSS osztállyal jelöli meg a kiválasztott ős összes leszármazottját.
