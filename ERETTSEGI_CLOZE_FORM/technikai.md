# Technikai megvalósítás

Ez a projekt egyetlen, önálló `index.html` fájlban valósul meg, amely két fő angol nyelvtani gyakorlatot (Open Cloze és Word Formation) kínál. A teljes funkcionalitás **vanilla JavaScript** és **Tailwind CSS** segítségével van megvalósítva.

## Főbb technikai jellemzők:

*   **Felhasználói felület (UI):**
    *   A UI a **Tailwind CSS** keretrendszerrel készült, amelyet CDN-ről tölt be az alkalmazás. Ez biztosítja a modern és reszponzív megjelenést.
    *   A két fő gyakorlat (Open Cloze és Word Formation) közötti váltást fülek (`tab`) kezelik, amelyek dinamikusan váltogatják a szekciók láthatóságát.
*   **Adatkezelés:**
    *   A gyakorlatokhoz szükséges adatok (mondatok, megoldások, alap szavak) külső **JSON fájlokból** (`open_cloze_database.json`, `word_formation_all.json`) töltődnek be aszinkron módon (`fetch`, `Promise.all`).
    *   Lehetőség van egyedi adatbázisok betöltésére URL paraméterekkel (`?db=...`, `?wfdb=...`).
*   **`makeDeck` Gyári Függvény:** A kód egy `makeDeck` nevű gyári függvényt használ, amely absztrahálja a két gyakorlat (Cloze és Word Formation) közös logikáját és állapotkezelését. Ez a megközelítés elősegíti a kód újrafelhasználhatóságát és modularitását.
*   **Válaszellenőrzés:**
    *   **Normalizálás:** Több segédfüggvény (`normalizeBase`, `stripArticles`, `normalizeLenient`, `normalizeStrict`) biztosítja a felhasználói bevitel és a megoldások rugalmas összehasonlítását, figyelembe véve az ékezeteket, kötőjeleket és névelőket.
    *   **Több megoldás kezelése:** A `splitAnswers` függvény képes kezelni azokat az eseteket, ahol egy feladathoz több helyes megoldás is tartozik (pl. "when/if/whenever").
    *   **Szigorú/Engedékeny mód:** A felhasználó választhat a szigorú (pontos egyezés) és az engedékeny (névelők, ékezetek figyelmen kívül hagyása) ellenőrzési mód között.
*   **Állapotkezelés:** A gyakorlatok állapota (aktuális elem, próbálkozások száma, pontszám) a `makeDeck` által létrehozott `st` objektumokban van tárolva.
*   **Randomizálás:** A feladatok sorrendje véletlenszerűen keverhető a `shuffle` segédfüggvény segítségével.
*   **Billentyűzetes vezérlés:** Az `Enter` billentyűvel ellenőrizhető a válasz, ami gyorsabb interakciót tesz lehetővé.
