# Páratartalom Labor - Technikai Dokumentáció

Ez a dokumentum az alkalmazás három részének technikai felépítését és működési logikáját ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezeti felépítését adja.
* **Tailwind CSS:** A reszponzív és modern felhasználói felület stílusáért felel.
* **JavaScript (Vanilla JS):** Az alkalmazás teljes logikáját, beleértve a szimulációt, a számításokat és a feladatok generálását, ez a szkript végzi.

## Fájlstruktúra

Az alkalmazás egyetlen HTML fájl, amely tartalmazza a stílusokat, a logikát, és egy hivatkozást a Tailwind CSS könyvtárra.

## Működési logika

**1. Rész: Szimuláció**
* **Megjelenítés:** A szimuláció egy HTML `<canvas>` elemen fut.
* **Részecskék:** A levegő- és vízrészecskék `Particle` osztálypéldányok, amelyek pozíciót, sebességet és típust tárolnak. Az összetapadt vízrészecskék `Cluster` objektumokká állnak össze.
* **Irányított szimuláció:** A szimuláció nem teljesen fizikai alapú, hanem "irányított". A `getTargetWaterCount` függvény meghatározza az ideális (egyensúlyi) vízpára-részecskék számát az adott hőmérsékletre. A részecskék összetapadási valószínűsége (`stickiness`) dinamikusan változik attól függően, hogy a jelenlegi részecskeszám a cél felett vagy alatt van-e. Ez biztosítja, hogy a szimuláció viszonylag gyorsan és látványosan beálljon egy stabil állapotba, ami jól szemlélteti a jelenséget.
* **Animáció:** A `requestAnimationFrame` biztosítja a folyamatos animációt. A szimuláció leáll, ha a rendszer egy ideig stabilnak érzékeli a párásodott részecskék számát.

**2. Rész: Kalkulátor**
* **Adattábla (`maxHumidityData`):** Egy JavaScript objektum tárolja a hőmérséklet-értékeket és a hozzájuk tartozó maximális abszolút páratartalmat (g/m³).
* **Interpoláció (`getMaxHumidity`):** Ha a felhasználó a táblázatban nem szereplő hőmérsékletet választ, a program lineáris interpolációval becsüli meg a maximális páratartalom értékét a két legközelebbi ismert adatpont alapján.
* **Számítás:** A relatív páratartalmat az `(abszolút / maximális) * 100` képlettel számolja. Az eredményt egy `div` szélességének százalékos állításával vizualizálja.

**3. Rész: Feladatok**
* **Generálás (`generateTask`):** Egy véletlen szám alapján eldönti, hogy a három képletismereti feladattípus közül melyiket adja fel. Véletlenszerűen kiválaszt egy hőmérsékletet és páratartalom-értéket a `maxHumidityData` táblázatból, majd ezek alapján felteszi a kérdést és kiszámolja a helyes választ (`correctAnswer`).
* **Ellenőrzés (`checkAnswer`):** A felhasználó által beírt számot összehasonlítja az elmentett helyes válasszal, egy kis tűréshatárt (0.15) engedve a kerekítési pontatlanságok miatt.
