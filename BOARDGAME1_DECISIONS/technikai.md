# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlra épül, de külső CSS és ikon-könyvtárakat használ a megjelenéshez.

## Főbb technikai jellemzők:

*   **Keretrendszer:** A felhasználói felület stílusát a **Tailwind CSS** biztosítja, amely egy CDN-en keresztül van betöltve. Ez a projekt legfontosabb külső függősége.
*   **Ikonok és Betűtípusok:** A projekt a [Font Awesome](https://fontawesome.com/) könyvtárat használja az ikonokhoz (pl. a játékos bábujához) és a [Google Fonts](https://fonts.google.com/)-ot az egyedi betűtípusokhoz.
*   **Játéklogika:** A teljes játékmenet, beleértve a forgatókönyvek kezelését, a pontozást és a felhasználói interakciókat, **vanilla JavaScript** segítségével van megvalósítva, amely a HTML fájlban, egy `<script>` tagen belül található.
*   **Adatszerkezet:** A játék forgatókönyvei, a választási lehetőségek és azok következményei egy `gameData` nevű, objektumokat tartalmazó JavaScript tömbben vannak definiálva.
*   **Dinamikus UI:** A játéktábla, a forgatókönyvek és az eredmények dinamikusan generálódnak a JavaScript segítségével a DOM manipulálásával.
*   **Animáció:** A játékos bábujának mozgása a játéktáblán egy CSS `transition` segítségével van animálva, amelyet a JavaScript `transform` tulajdonságának változtatásával vezérel.
*   **Struktúra:** A JavaScript kód jól strukturált, külön függvények felelnek a játék inicializálásáért (`initializeElements`), a felhasználói felület frissítéséért (`updateUI`), a döntések kezeléséért (`handleChoice`) és a játék állapotának vezérléséért (`startGame`, `endGame`).
