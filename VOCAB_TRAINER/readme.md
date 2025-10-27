# Expressions Trainer – Kifejezésgyakorló (HU ⇄ EN)

Ez egy átfogó, interaktív webes alkalmazás, amelyet magyar-angol szókincs és kifejezésgyakorlásra terveztek. Több játékmódot kínál, támogatja az egyéni szószedeteket, és nyomon követi a felhasználó haladását.

## Főbb funkciók és játékmódok

Az alkalmazás négy fő játékmódot kínál, amelyek között a felső fülekkel válthatsz:

1.  **Flashcards (Kártyák):**
    *   Feladat: Megjeleníti a kifejezést (magyarul vagy angolul). Megfordítva látható a fordítása.
    *   Jellemzők: Kártya megfordítása, "Ismert" (I know) jelölés (eltávolítja az aktív pakliból), "Még gyakorlom" (Still studying) jelölés (benne tartja a pakliban), "Következő" (Next) opció.
    *   Billentyűparancsok: `F` = Flip, `K` = I know, `R` = Next.

2.  **Matching (Párosítás):**
    *   Feladat: Hat kifejezéspárt kell párosítanod (magyar és angol oldalról).
    *   Jellemzők: Követi a helyes és hibás próbálkozásokat.

3.  **Multiple Choice (Feleletválasztós):**
    *   Feladat: Egy kifejezéshez (magyarul vagy angolul) négy feleletválasztós opció közül kell kiválasztani a helyes fordítást.
    *   Jellemzők: Követi a helyes és összes próbálkozást.

4.  **Quick Fire / Bingo (Gyors tűz / Bingo):**
    *   Feladat: Időzített játék, ahol egy kifejezés jelenik meg, és a felhasználónak a 12 csempéből álló rácson kell rákattintania a helyes fordításra.
    *   Jellemzők: Pontozás, találatok száma, időzítő.

## További funkciók

*   **Nyelvi irány:** Válthatsz a magyar-angol és angol-magyar gyakorlás között.
*   **Klaszterek:** A szókincs tematikus klaszterekbe (pl. "family", "daily") van rendezve.
*   **Egyéni szószedet:** JSON formátumban importálhatsz saját szószedeteket, amelyek a meglévő adatokkal egyesülnek, és a böngészőben tárolódnak.
*   **Haladás mentése:** A felhasználó haladása (ismert szavak, statisztikák) automatikusan mentésre kerül a böngészőben (`localStorage`).
*   **Klaszter reset:** Törli az aktuális klaszterhez tartozó "ismert" szavakat.
*   **DB export:** Exportálja az aktuális szószedetet JSON formátumban.

## Használat

1.  Nyisd meg az `index.html` fájlt egy modern böngészőben.
2.  Válaszd ki a nyelvi irányt és a klasztert a fejlécben.
3.  Válassz egy játékmódot a fülek segítségével.
4.  Kezdd el a gyakorlást!
