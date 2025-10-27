# B1 Word Formation – Szóképzés Gyakorló (Tinédzser Kiadás)

Ez egy gamifikált, interaktív webes alkalmazás, amelyet B1 szintű angol nyelvet tanulók számára terveztek a szóképzés gyakorlására. Mondatokat mutat be hiányzó szóval és egy alap szóval, a felhasználónak pedig a helyes származékot kell képeznie.

## Főbb funkciók és játékmódok

### Játékmódok

1.  **Practice (Gyakorlás):**
    *   Standard gyakorló mód, időkorlát és életek nélkül.
    *   Feladat: Egy mondat jelenik meg egy hiányzó szóval, és egy alap szóval zárójelben. Be kell írnod az alap szóból képzett helyes szót.
    *   Jellemzők: Pontozás, sorozat (streak) követése, pontosság.

2.  **Challenge (Kihívás):**
    *   Időzített mód (90 másodperc / munkamenet), 3 élettel.
    *   Feladat: Ugyanaz, mint a Practice módban, de az idő és az életek korlátozzák a játékot.
    *   Jellemzők: Életek vizuális megjelenítése (szívek), időzítő.

### További funkciók

*   **Pontozás és statisztikák:** Követi a pontszámot, a helyes válaszok sorozatát (streak), a legjobb sorozatot, a pontosságot és az elsajátított szavak számát.
*   **Mastery rendszer:** Egy szó akkor számít "elsajátítottnak", ha egymás után bizonyos számú alkalommal helyesen válaszoltál rá (beállítható). Az elsajátított szavak kikerülnek az aktív gyakorló készletből.
*   **Sebesség bónusz:** Extra pontok járnak a gyors és helyes válaszokért.
*   **Tipp (Hint):** A "Hint" gomb megmutatja a hiányzó szó első és utolsó betűjét.
*   **Hibák áttekintése (Review mistakes):** Egy modális ablakban megtekinthető az összes korábbi próbálkozás, és újrapróbálhatók a hibásan megválaszolt tételek.
*   **Haladás mentése:** Az összes játékállapot (pontszám, sorozat, elsajátítási szintek, egyéni szóhaladás, történet) automatikusan mentésre kerül a böngészőben (`localStorage`).
*   **Adatok exportálása:** Exportálhatod a munkamenet adatait JSON formátumban.
*   **Munkamenet resetelése:** Törli az összes mentett haladást.
*   **Jelvények:** Különböző jelvények szerezhetők meg (pl. "First correct", "Streak 5", "All mastered").
*   **Billentyűparancsok:** `Enter` a válasz ellenőrzéséhez, `H` a tipp megjelenítéséhez.

## Használat

1.  Nyisd meg az `index.html` fájlt egy modern böngészőben.
2.  Válassz egy játékmódot a bal oldali sávból.
3.  Írd be a hiányzó szót, majd kattints a "Check" gombra, vagy nyomd meg az `Enter` billentyűt.
4.  Használd a "Hint" gombot, ha segítségre van szükséged.
5.  A "Review mistakes" gombbal áttekintheted a korábbi próbálkozásaidat.
