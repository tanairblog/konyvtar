# Királyszöktetés (Tablut) - Technikai Dokumentáció

Ez a dokumentum a Tablut játék technikai megvalósítását és a benne rejlő logikát ismerteti.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét adja, beleértve a játéktáblát, az információs panelt és a szabályokat tartalmazó modális ablakot.
* **CSS:** A játék teljes vizuális megjelenéséért felel, a táblától és bábuktól kezdve a kijelölésekig és a modális ablakig.
* **JavaScript (Vanilla JS):** A játék teljes logikáját kezeli, a lépések érvényesítésétől a győzelmi feltételek ellenőrzéséig.

## Fájlstruktúra

Az alkalmazás egyetlen HTML fájl, amely tartalmazza a CSS stílusokat és a teljes JavaScript kódot is.

## Működési logika

A program központi eleme a `boardState` kétdimenziós tömb, amely a tábla állapotát reprezentálja.

1.  **Játékállapot (`boardState`):** Egy 9x9-es tömb tárolja a bábuk helyzetét. A cellák stringeket tartalmaznak ('muscovite', 'swede', 'king') vagy üresek. Globális változók követik a soron lévő játékost (`currentPlayer`), a kiválasztott bábut (`selectedPiece`), és hogy a játék véget ért-e (`isGameOver`).

2.  **Megjelenítés (`renderBoard`):** Ez a függvény a `boardState` alapján dinamikusan generálja le a játéktábla HTML elemeit (div-eket). A bábukhoz és a speciális mezőkhöz (vár) a megfelelő CSS osztályokat rendeli.

3.  **Felhasználói interakció (`onSquareClick`):** Minden mezőre kattintás ezt a függvényt hívja meg.
    * Ha nincs bábu kiválasztva (`selectedPiece` null), és a mezőn a soron következő játékos bábja áll, akkor azt kiválasztja.
    * Ha van kiválasztott bábu, a függvény ellenőrzi, hogy a kattintás egy érvényes lépésmezőre történt-e (`isValidMove`).
    * Érvényes lépés esetén végrehajtja a lépést (`movePiece`), ellenőrzi az ütéseket (`checkForCaptures`), a győzelmi feltételeket (`checkForWin`), majd átadja a lépés jogát (`switchPlayer`).

4.  **Lépés- és ütéslogika:**
    * `isValidMove`: Ellenőrzi, hogy a lépés a sakkbástya szabályai szerint (vízszintesen/függőlegesen, üres mezőkön át) történik-e. Azt is figyeli, hogy nem-király bábu nem léphet a trónra, és a király sem léphet vissza rá, ha már elhagyta.
    * `checkForCaptures`: A lépés után ellenőrzi a lépés célmezőjének szomszédait. Ha egy szomszédos bábu ellenséges, megnézi a túlsó oldalát. Ha ott egy szövetséges bábu vagy a vár van (`isCapturingSquare`), akkor leveszi az ellenséges bábut a tábláról.
    * `isKingCaptured`: Ez egy összetett, több esetet vizsgáló függvény. Külön logikával ellenőrzi a király elfogását a trónon (4 oldalról), a trón mellett (3 oldalról), és a tábla többi részén (2 oldalról).

5.  **Győzelem és figyelmeztetések:**
    * `checkForWin`: Minden lépés után ellenőrzi, hogy a király elérte-e a tábla szélét (svéd győzelem), vagy hogy a királyt elfogták-e (moszkovita győzelem).
    * `checkForWarnings`: Világos lépése után ellenőrzi, hány szabad útja van a királynak a tábla szélére, és kiírja a megfelelő "Rájgge!" vagy "Dujgu!" figyelmeztetést.
