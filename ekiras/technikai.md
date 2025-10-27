# Ékírás Fordító - Technikai Dokumentáció

Ez a dokumentum az "Ékírás Fordító" webalkalmazás technikai felépítését és a mögötte álló működési logikát részletezi.

## Felhasznált technológiák

Az alkalmazás kizárólag alapvető, kliensoldali webtechnológiákra épül, ami biztosítja a gyors működést és a széles körű kompatibilitást.

* **HTML:** A weboldal strukturális vázát adja, beleértve a két szövegbeviteli, illetve megjelenítési területet.
* **CSS:** A vizuális stílusért, az elrendezésért és a reszponzív viselkedésért felelős.
* **JavaScript (Vanilla JS):** Az alkalmazás teljes logikáját ez a szkriptnyelv látja el, szerveroldali feldolgozás nélkül.

## Fájlstruktúra

A projekt egyetlen HTML fájlból (`index2.html`) áll, amely magában foglalja a stílusdefiníciókat és a futtatható JavaScript kódot is. Ez az egyszerűsített struktúra könnyen kezelhetővé és hordozhatóvá teszi az alkalmazást.

## Működési logika

A JavaScript kód egy egyszerű, de hatékony karakterhelyettesítő algoritmuson alapul.

1.  **DOM Elemek Referenciálása:** A szkript először eltárolja a beviteli (`<textarea>`) és a kimeneti (`<div>`) HTML elemekre való hivatkozásokat.

2.  **Karaktertérkép (`charMap`):** A kód lelke egy JavaScript objektum (associative array), amely kulcs-érték párokat tartalmaz.
    * **Kulcsok:** A kisbetűs latin karakterek ("a", "b", "c", ...).
    * **Értékek:** A megfelelő ékírásos jelek Unicode karakterkódjai vagy HTML entitásai.

3.  **Eseménykezelő (`addEventListener`):**
    * A beviteli szövegmezőhöz egy `input` eseményfigyelő van rendelve. Ez biztosítja, hogy a fordító funkció minden egyes billentyűleütésre (karakter beírása, törlése) azonnal lefusson.

4.  **Fordító Függvény (`translate`):**
    * Ez a függvény hajtja végre a tényleges átalakítást.
    * A beviteli mező aktuális tartalmát kisbetűssé alakítja, hogy a fordítás ne legyen érzékeny a kis- és nagybetűkre.
    * Egy ciklussal végighalad a bemeneti szöveg minden egyes karakterén.
    * Minden karaktert megpróbál megkeresni a `charMap` objektumban.
    * Ha a karakter szerepel a térképben (tehát egy lefordítható betű), akkor a hozzá tartozó ékírásos jelet fűzi hozzá egy kimeneti változóhoz.
    * Ha a karakter nem található meg (pl. írásjel vagy speciális karakter), akkor egyszerűen figyelmen kívül hagyja vagy helyettesíti egy szóközzel.
    * A ciklus lefutása után a kész, lefordított jelsorozatot beállítja a kimeneti elem HTML tartalmának (`innerHTML`), ezzel megjelenítve azt a felhasználó számára.
