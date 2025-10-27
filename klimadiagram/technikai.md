# Klíma Diagram Készítő - Technikai Dokumentáció

Ez a dokumentum az alkalmazás technikai felépítését, a felhasznált külső szolgáltatásokat és az adatfeldolgozás menetét ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal alapvető szerkezetét adja.
* **Tailwind CSS:** A reszponzív és modern felhasználói felület gyors kialakításáért felel.
* **JavaScript (Vanilla JS):** Az alkalmazás logikájának központi eleme, amely összeköti a különböző API-kat.
* **Google Maps API:** A térképes felület megjelenítéséért, a kattintási események kezeléséért és a koordináták alapján történő helységnév-keresésért (Geocoding) felel.
* **Open-Meteo Historical Weather API:** Ez a szolgáltatás biztosítja a historikus (1991-2020) napi időjárási adatokat (hőmérséklet, csapadék) a megadott földrajzi koordinátákra.
* **Chart.js:** Egy népszerű diagramkészítő könyvtár, amely a klímadiagram vizuális megjelenítését végzi.

## Fájlstruktúra

Az alkalmazás egyetlen HTML fájlban található, amely a `head` szekcióban hivatkozik a külső CSS és JavaScript könyvtárakra.

## Működési logika

Az alkalmazás működése eseményvezérelt, a felhasználó térképre való kattintása indítja el a fő folyamatot.

1.  **Inicializálás (`initMap`):** A Google Maps API betöltődése után ez a függvény inicializálja a térképet, beállítja a kezdő pozíciót és a zoom szintet. Létrehoz egy `click` eseményfigyelőt a térképen.

2.  **Kattintás kezelése:** Amikor a felhasználó a térképre kattint:
    * A program elrejti a térképnézetet és megjeleníti a diagram nézetet egy "adatok lekérése..." üzenettel.
    * Meghívja a `getClimateDataAndDrawChart` aszinkron függvényt a kattintás földrajzi koordinátáival.

3.  **Adatfeldolgozás (`getClimateDataAndDrawChart`):**
    * **Helységnév lekérése:** A Google Maps Geocoder szolgáltatással megkeresi a koordinátákhoz legközelebbi település nevét.
    * **API hívás:** HTTP `fetch` kérést küld az Open-Meteo API-nak, lekérve 30 évnyi napi átlaghőmérsékletet és csapadékösszeget.
    * **Adataggregálás:** A válaszként kapott több mint 10 000 napnyi adatot egy ciklussal feldolgozza. Hónapokra bontja, és kiszámolja a 12 havi átlagot a hőmérsékletre és a csapadékra.
    * **Diagram rajzolása:** A `drawClimateChart` függvény meghívásával átadja a feldolgozott adatokat a Chart.js-nek, amely kirajzolja a diagramot.

4.  **Diagram frissítése (`updateChartAxes`):** A beviteli mezőkön lévő `change` eseményfigyelők aktiválják ezt a függvényt. A függvény frissíti a `climateChart` objektum tengelybeállításait (`min`, `max`), majd az `update()` metódussal újrarajzolja a diagramot az új paraméterekkel.
