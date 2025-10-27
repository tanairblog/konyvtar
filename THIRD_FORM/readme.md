# Irregular Verbs Trainer – Rendhagyó Igék Gyakorló

Ez egy átfogó, interaktív webes alkalmazás, amelyet angol nyelvet tanulók számára terveztek a rendhagyó igék gyakorlására. Az alkalmazás négy különböző játékmódot, egy adminisztrációs panelt a haladás követésére, és egy "kilépőkártyát" (exit card) kínál.

## Főbb funkciók és játékmódok

Az alkalmazás négy fő játékmódot kínál, amelyek között a felső fülekkel válthatsz:

1.  **Flashcards (Kártyák):**
    *   Feladat: Megjeleníti az ige alapalakját és magyar fordítását. Megfordítva látható a múlt idejű (Past Simple) és a befejezett melléknévi igenévi (Past Participle) alak.
    *   Jellemzők: Kártya megfordítása, "Ismert" (Known) jelölés, "Következő" (Next) és "Kihagyás" (Skip) opciók.

2.  **Learn (Tanulás):**
    *   Feladat: Egy ige alapalakja és magyar fordítása jelenik meg, az egyik hiányzó alak (Past Simple vagy Past Participle) helyén "???. Be kell írnod a hiányzó alakot.
    *   Jellemzők: 30 másodperces időzítő, pontozás (+1 helyes válaszért).

3.  **Practice (Gyakorlás):**
    *   Feladat: Egy angol mondat jelenik meg, amelyben egy ige alapalakban van megadva, és be kell írnod a helyes befejezett melléknévi igenévi (V3) alakot.
    *   Jellemzők: 30 másodperces időzítő, pontozás (+10 helyes válaszért).

4.  **Translate (Fordítás):**
    *   Feladat: Egy magyar mondat jelenik meg, amelyet angolra kell lefordítanod.
    *   Jellemzők: Nincs időkorlát, pontozás (+10 helyes válaszért), modellválasz megjelenítése.

## Adminisztrációs funkciók

*   **Felhasználói bejelentkezés:** A felhasználók névvel és opcionálisan osztállyal jelentkezhetnek be, ami alapján a haladásuk követhető.
*   **Admin Panel:** Egy jelszóval védett panel (alapértelmezett jelszó: `tanar`), amely lehetővé teszi a tanár számára, hogy:
    *   Megtekintse az aktív felhasználókat és utolsó aktivitásukat.
    *   Részletes naplót lásson minden felhasználói interakcióról (melyik fül, milyen művelet, milyen ige, bevitel, helyes/helytelen, pontszám).
    *   Exportálja az összes naplózott adatot CSV vagy JSON formátumban.
    *   Törölje az összes naplót.
*   **Kilépőkártya (Exit Card):** Egy összefoglaló a felhasználó teljesítményéről (név, osztály, összes pontszám, próbálkozások, helyes/helytelen válaszok, használt fülek, eltöltött idő), amely a vágólapra másolható.

## Használat

1.  Nyisd meg az `index.html` fájlt egy modern böngészőben.
2.  A betöltéskor add meg a nevedet és osztályodat.
3.  Válassz egy gyakorlati módot a fülek segítségével.
4.  Használd a "Reset" gombokat az egyes módok vagy az összes statisztika nullázásához.
5.  Az "Admin" gombbal (jobbra lent) elérhető a tanári panel (jelszó: `tanar`).
6.  Az "Export (Me)" gombbal exportálhatod a saját haladásodat.
7.  Az "Exit Card" gombbal megtekintheted és kimásolhatod a munkamenet összefoglalóját.
