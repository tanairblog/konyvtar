# Sodródás és Szelekció - Technikai Dokumentáció

Ez a dokumentum az alkalmazás technikai felépítését és a szimuláció mögött álló algoritmusokat ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét és a vezérlőelemeket tartalmazza.
* **CSS:** Az elemek vizuális stílusát határozza meg.
* **JavaScript (Vanilla JS):** A teljes szimulációs logikát ez a szkript valósítja meg.
* **Plotly.js:** Egy külső adatvizualizációs könyvtár, amely az allélgyakoriságokat ábrázoló interaktív grafikont készíti.

## Fájlstruktúra

Az alkalmazás egyetlen HTML fájlból áll, amely tartalmazza a CSS stílusokat, a JavaScript kódot, és a Plotly.js könyvtárra való hivatkozást.

## Működési logika

A szimuláció egy diszkrét generációs modellt használ, ahol a populáció állapotát egy `population` nevű, genotípusokat tartalmazó string tömb reprezentálja.

1.  **Inicializálás (`runSimulation`):**
    * Beolvassa a felhasználói paramétereket (populációméret, fitnesz értékek).
    * Létrehozza a kiinduló populációt véletlenszerű genotípusokkal az `initializePopulation` függvénnyel.
    * Egy 100 iterációs cikluson keresztül szimulálja a generációkat.

2.  **Generációs ciklus:** A fő ciklus minden lépése egy generációt szimulál, és a következő lépésekből áll:
    * **Adatrögzítés:** Kiszámolja és elmenti az aktuális allélgyakoriságokat a `countAlleles` segítségével. A teljes populáció állapotát is elmenti egy `populationHistory` tömbbe az animációhoz.
    * **Fixáció ellenőrzése:** Ha egy allél gyakorisága 0 vagy 1, a szimuláció leáll, mert további változás nem lehetséges.
    * **Szelekció (`applySelection`):** Végigmegy az aktuális populáción. Minden egyed számára generál egy véletlen számot, és ha az kisebb, mint az egyed genotípusához tartozó fitnesz érték, akkor az egyed "túléli" a szelekciót, és bekerül egy ideiglenes `selectedPopulation` tömbbe.
    * **Szaporodás (`reproduce`):** Létrehoz egy új generációt (`newGeneration`). A megadott populációméret eléréséig ismétlődően kiválaszt két véletlenszerű szülőt a `selectedPopulation`-ből, és a `generateOffspring` függvénnyel létrehoz egy utódot. Az utód egy-egy allélt kap mindkét szülőtől, véletlenszerűen.
    * Az új generáció felülírja a régit, és a ciklus folytatódik.

3.  **Megjelenítés:** A 100 generáció lefuttatása után:
    * **Grafikon (`plotResults`):** A Plotly.js könyvtárnak átadja az elmentett allélgyakoriság-történetet, amely kirajzolja a grafikont.
    * **Animáció (`animatePopulation`):** Egy `setInterval` segítségével végigléptet a `populationHistory` tömbön, és minden lépésben a `displayGeneration` függvénnyel kirajzolja az adott generáció egyedeit SVG ikonokként.
