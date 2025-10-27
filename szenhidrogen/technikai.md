# Szénhidrogén Keresztelő - Technikai Dokumentáció

Ez a dokumentum a szénhidrogén-elnevező játék technikai felépítését, különös tekintettel a molekulageneráló és -elnevező algoritmusra.

## Felhasznált technológiák

* **HTML:** Az oldal szerkezetét biztosítja.
* **CSS:** A modern, reszponzív felület stílusát határozza meg.
* **JavaScript (Vanilla JS):** A teljes programlogikát ez a szkript tartalmazza, a molekula adatstruktúrájának létrehozásától a vászonra rajzolásig és a névellenőrzésig.

## Fájlstruktúra

Az alkalmazás egyetlen, önálló HTML fájl, amely tartalmazza a stílusokat és a teljes JavaScript logikát.

## Működési logika

A program lelke a véletlenszerű, de szabályos molekulák generálása és a hozzájuk tartozó helyes IUPAC-név meghatározása.

1.  **Molekula generálása (`drawMolecule`):**
    * **Főlánc/gyűrű:** A nehézségi szint alapján meghatározza a főlánc hosszát (`L`) és azt, hogy a molekula gyűrűs-e (`isCyclic`).
    * **Kettős kötések:** Véletlenszerűen elhelyez egy vagy több kettős kötést (`dbPos`) a láncban.
    * **Elágazások:** A nehézségnek megfelelő számú elágazást (`branches`) generál. Minden elágazás egy objektum, ami tartalmazza a pozícióját (`pos`) és a hosszát (`len`). A generálás során ügyel arra, hogy az elágazás ne hosszabbítsa meg a főláncot (pl. egy bután lánc végére nem tesz etil-csoportot, mert az hexán lenne).
    * **Adatstruktúra:** A generált molekula tulajdonságait (lánchossz, kettős kötések, elágazások) változókban és tömbökben tárolja.

2.  **IUPAC-név meghatározása:** Ez a legkomplexebb rész. A programnak a generálás után "visszafelé" kell gondolkodnia, hogy a helyes nevet adja meg.
    * **Számozási irány:** Az IUPAC-szabályok szerint a láncot arról az oldalról kell számozni, amelyikről a helyzetjelző számok sorozata a legkisebb. A program összehasonlítja a "forward" és "reverse" számozásból adódó helyzetszám-sorozatokat (először a kettős kötésekét, majd az elágazásokét) egy lexikografikus összehasonlító függvénnyel (`lexCompare`), és kiválasztja a helyes irányt.
    * **Név összeállítása:** A helyes számozás alapján felépíti a nevet. Az elágazásokat (szubsztituenseket) ábécérendbe sorolja, csoportosítja (pl. `di-metil`), majd a főlánc neve és a kettős kötések helyzete (`-én`, `-dién`) következik. A kész nevet a `currentName` változóban tárolja.

3.  **Rajzolás:**
    * A molekula adatstruktúrája alapján kiszámítja az atomok (csúcsok) koordinátáit a `<canvas>` elemen. Nyílt láncoknál cikk-cakk alakzatot, gyűrűknél szabályos sokszöget rajzol.
    * A `canvas` 2D API-jával (`lineTo`, `arc`, `stroke`) rajzolja meg a kötéseket és az atomokat. A kettős kötéseket két párhuzamos vonallal jelöli.

4.  **Ellenőrzés:**
    * A felhasználó által beírt nevet és a generált `currentName`-et egy `normalize` függvény segítségével egységes formátumra hozza (kisbetűs, szóköz és ékezetek nélküli), majd összehasonlítja őket.
    * A statisztikát egy `stats` objektumban tárolja.
