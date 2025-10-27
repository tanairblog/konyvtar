# Személyre szabható bemutatkozó – Interaktív alkalmazás

Ez egy interaktív webes alkalmazás, amely segít a felhasználóknak (valószínűleg diákoknak) egy személyre szabott bemutatkozó szöveg összeállításában. A felhasználók lépésről lépésre haladva tölthetnek ki mezőket és választhatnak opciók közül, majd a végén kimásolhatják vagy letölthetik az elkészült szöveget.

## Főbb funkciók

*   **Lépésről lépésre történő építkezés:** A bemutatkozó szöveg különböző részekre (lépésekre) van bontva (pl. "Köszönés + Név", "Származás", "Lakhely"). A felhasználó ezeken a lépéseken halad végig.
*   **Dinamikus beviteli mezők:** Minden lépésnél a tartalomhoz illeszkedő beviteli mezők (szöveg, szám, legördülő lista) jelennek meg.
*   **Valós idejű előnézet:** A jobb oldali panelen azonnal látható, hogyan alakul a bemutatkozó szöveg a felhasználó bevitelei alapján.
*   **Navigáció:** "Előző" és "Következő" gombokkal, valamint a "Lépések" listában található chipekre kattintva lehet navigálni a lépések között.
*   **Mentés és betöltés:** A felhasználó bevitelei automatikusan mentésre kerülnek a böngészőben (`localStorage`), és manuálisan is menthetők/betölthetők.
*   **Szöveg másolása és letöltése:** Az elkészült bemutatkozó szöveg egy gombnyomással kimásolható a vágólapra, vagy letölthető `.txt` fájlként.
*   **Reset:** Visszaállítja az összes beviteli mezőt az alapértelmezett állapotba.

## Használat

1.  Nyisd meg az `index.html` fájlt egy modern böngészőben.
2.  Kezdd el kitölteni a mezőket és válaszd ki az opciókat a bal oldali "Builder" panelen.
3.  Figyeld a jobb oldali "Előnézet" panelen, hogyan alakul a szöveged.
4.  Használd az "Előző" és "Következő" gombokat, vagy kattints a "Lépések" listában a kívánt lépésre.
5.  Ha elkészültél, másold ki a szöveget a "Másol" gombbal, vagy töltsd le a "Letöltés (.txt)" gombbal.
