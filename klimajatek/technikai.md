# Klímajáték technikai leírás

Az alkalmazás egyetlen HTML fájlból áll, amely a játék logikáját, stílusát és szerkezetét tartalmazza.

## Adatforrások

-   **`animals.csv`**: Ez a fájl tartalmazza a játékhoz szükséges adatokat. Minden sor egy állatot reprezentál, és a következő oszlopokat tartalmazza:
    -   `Filenév`: Az állat képének fájlneve.
    -   `Klíma`: Az éghajlat, ahol az állat él.
    -   `Kontinens`: A kontinens, ahol az állat él.
-   **Képek (`.jpg`)**: Az állatokat ábrázoló képfájlok.

## Működés

1.  **Adatbetöltés**: A játék indításakor a JavaScript kód a `fetch` API segítségével betölti és feldolgozza az `animals.csv` fájlt.
2.  **Dropdown menük generálása**: A betöltött adatok alapján a program dinamikusan generálja az éghajlat és kontinens választó legördülő menüket.
3.  **Játéklogika**: A játék véletlenszerűen kiválaszt egy állatot, és megjeleníti a képét. A játékos választásait összehasonlítja a helyes adatokkal, és frissíti a pontszámot és a felhasználói felületet.
4.  **Időmérő**: A játék minden körben egy 30 másodperces visszaszámlálót indít.