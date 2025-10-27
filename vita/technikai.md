# Vita technikai leírás

Az alkalmazás két HTML fájlból (`index.html` a résztvevőknek, `admin.html` a vita vezetőjének) és a bennük lévő JavaScript kódból áll.

## Függőségek

-   **Firebase Realtime Database**: Az alkalmazás a Firebase Realtime Database-t használja a valós idejű kommunikációhoz a résztvevők és az admin között. A szükséges Firebase scripteket a CDN-ről tölti be.

## Működés

1.  **Adatbázis struktúra**: A Firebase adatbázisban minden vita egyedi azonosítóval rendelkezik. Az egyes viták alatt tárolódnak a vita adatai, mint például a téma, az álláspontok, a résztvevők, a körök és az eredmény.
2.  **Admin felület**: Az `admin.html` oldalon a vita vezetője létrehozhat egy új vitát. A JavaScript kód egy új bejegyzést hoz létre a Firebase adatbázisban, és generálja a csatlakozási kódokat.
3.  **Résztvevői felület**: Az `index.html` oldalon a résztvevők a kapott kódokkal csatlakozhatnak a vitához. A JavaScript kód a Firebase adatbázisból olvassa ki a vita adatait, és valós időben frissíti a felhasználói felületet.
4.  **Valós idejű frissítés**: A Firebase `on('value', ...)` eseménykezelője segítségével a JavaScript kód figyeli a változásokat az adatbázisban, és azonnal frissíti a felhasználói felületet, amikor új érv, szavazat vagy állapotváltozás történik.
5.  **Állapotkezelés**: A vita állapotát (pl. ki következik, szavazás van-e) a Firebase adatbázisban tárolja a program.