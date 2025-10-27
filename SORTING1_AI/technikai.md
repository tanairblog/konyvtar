# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Felhasználói felület (UI):**
    *   A UI a **Tailwind CSS** keretrendszerrel készült, amelyet CDN-ről tölt be az alkalmazás. Ez biztosítja a modern és reszponzív megjelenést.
    *   A kártyák és a dobózónák stílusai egyedi CSS-sel vannak kiegészítve, beleértve a "drag-over" állapot vizuális visszajelzését is.
*   **Adatkezelés:** Az AI szabályzatokra vonatkozó állítások (`allStatements`) és a hozzájuk tartozó helyes kategóriák közvetlenül a JavaScript kódban vannak tárolva, egy tömbben.
*   **Véletlenszerűsítés:** A `shuffle()` függvény (Fisher-Yates algoritmus) a játék elején véletlenszerűen megkeveri az állítások sorrendjét, biztosítva a változatosságot.
*   **Drag and Drop API:** A kártyák kategóriákba történő húzásához és eldobásához a natív HTML Drag and Drop API-t (`dragstart`, `dragover`, `dragleave`, `drop`) használja az alkalmazás.
    *   A `dragstart` esemény során a kártya adatai (szöveg, helyes kategória) JSON formátumban kerülnek a `dataTransfer` objektumba.
    *   A `drop` esemény során a célzóna azonosítója alapján történik az ellenőrzés, hogy a kártya a helyes kategóriába került-e.
*   **Játékállapot:** A játék aktuális állapota (megjelenített kártya, hátralévő kártyák, helyes szortírozások száma) globális JavaScript változókban van tárolva.
*   **Dinamikus UI frissítés:** A `renderCurrentCard()` és `updateScoreboard()` függvények felelősek a felhasználói felület folyamatos frissítéséért a játék előrehaladtával.
*   **Azonnali visszajelzés:** A kártya bedobása után azonnal megjelenik a helyességre vonatkozó visszajelzés a kategória dobozában.
