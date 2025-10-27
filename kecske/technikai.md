# Farkas, Kecske, Káposzta - Technikai Dokumentáció

Ez a dokumentum a játék technikai felépítését és működési logikáját ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét biztosítja, a partokat, a folyót és a játékelemeket tartalmazó konténereket definiálja.
* **CSS:** A vizuális megjelenésért, az elemek elrendezéséért, a csónak mozgásának animációjáért és a reszponzív viselkedésért felelős.
* **JavaScript (Vanilla JS):** A játék teljes logikáját kezeli, a felhasználói interakcióktól a játékszabályok kiértékeléséig.

## Fájlstruktúra

Az alkalmazás egyetlen HTML fájl, amely tartalmazza a CSS stílusokat és a JavaScript kódot is. Az SVG képeket (farkas, kecske, stb.) aszinkron módon tölti be a szkript.

## Működési logika

A program központi eleme a játékállapotot kezelő `gameState` objektum és az ezt módosító függvények.

1.  **Állapotkezelés (`gameState`):** A játék minden lényeges információját egy `gameState` objektum tárolja. Ez tartalmazza, hogy az egyes elemek (`wolf`, `goat`, `cabbage`, `boat`) melyik parton vannak ('left' vagy 'right'), ki van a csónakban (`passenger`), és hogy a játéknak vége van-e (`gameOver`).

2.  **Aszinkron SVG betöltés:** Az oldal betöltődésekor a `loadAssetsAndStartGame` függvény `fetch` segítségével aszinkron módon betölti a szükséges SVG fájlokat a megfelelő HTML elemekbe. Ez biztosítja, hogy a játék csak azután induljon, hogy minden grafika elérhető.

3.  **Interakciók kezelése:**
    * `moveItem`: Ez a függvény felelős az elemek part és csónak közötti mozgatásáért. Kezeli a DOM elemek áthelyezését (`appendChild`) és frissíti a `gameState` objektumot.
    * `crossRiver`: Ez a függvény szimulálja az átkelést. A `boat` CSS osztályának módosításával indítja el az animációt. Az átkelés előtt és után is meghívja a `checkLoss` függvényt a szabályok ellenőrzésére.

4.  **Szabályok kiértékelése:**
    * **Vereség (`checkLoss`):** Ez a függvény egy `rules` nevű tömbön iterál végig. A tömb objektumokat tartalmaz, ahol minden objektum egy-egy vesztes feltételt definiál egy függvénnyel. Ha valamelyik feltétel igazra értékelődik ki a jelenlegi `gameState` alapján, a játék véget ér.
    * **Győzelem (`checkWin`):** Ez a függvény ellenőrzi, hogy minden elem a jobb parton van-e. Ha igen, a játék győzelemmel ér véget.

5.  **Vizuális visszajelzés:** A `messageBox` HTML elemben jelennek meg a győzelemről, vereségről vagy a szabályszegésekről szóló üzenetek. A CSS osztályok (`win`, `lose`) dinamikus hozzáadásával a szöveg színe és háttere is változik.
