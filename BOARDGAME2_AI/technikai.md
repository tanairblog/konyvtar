# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlra épül, amely külső CDN-ekről tölt be stíluslapokat és ikonokat. A felépítése nagyon hasonló az "The Decision-Making Game" projekthez.

## Főbb technikai jellemzők:

*   **Függőségek:**
    *   **Tailwind CSS:** A reszponzív és modern felhasználói felület stílusát biztosítja.
    *   **Google Fonts:** Egyedi betűtípusokat szolgáltat.
    *   **Font Awesome:** Ikonokat jelenít meg a felületen.
*   **Játéklogika:** A kvíz működését vanilla JavaScript kód vezérli, amely a HTML dokumentumba van ágyazva.
*   **Adatkezelés:** A kvíz kérdései, a válaszlehetőségek és a hozzájuk tartozó pontértékek egy `gameDataRaw` nevű JavaScript tömbben vannak tárolva.
*   **Randomizálás:** A játék minden indításakor a válaszlehetőségek sorrendje véletlenszerűen megkeveredik a Fisher-Yates algoritmust implementáló `shuffleArray` függvény segítségével. Ez biztosítja, hogy a kvíz minden alkalommal egy kicsit más legyen.
*   **Dinamikus UI:** A teljes felület, beleértve a pontozótáblát, az állításokat és a válaszlehetőségeket, JavaScript segítségével, a DOM manipulálásával jön létre és frissül a játék során.
*   **Animáció:** A játékos bábujának mozgása a pontozótáblán CSS `transition` segítségével van animálva.
*   **Állapotkezelés:** A játék aktuális állapotát (pl. `currentStep`, `currentScore`) globális JavaScript változók tárolják.
