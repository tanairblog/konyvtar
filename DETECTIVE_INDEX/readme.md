# Detective Classroom - Frontend

Ez a projekt egy egyoldalas webalkalmazás (Single-Page Application), amely a "Detective Classroom Chat" játék felhasználói felületét biztosítja. Az alkalmazás lehetővé teszi a diákok számára, hogy egy interaktív felületen keresztül "kihallgassanak" virtuális karaktereket, nyomokat gyűjtsenek, és megoldjanak egy bűnügyi rejtélyt.

Ez az alkalmazás a `DETECTIVE_BACKEND` projekthez csatlakozik, amely a játék logikáját és az adatokat szolgáltatja.

## Funkciók

*   **Interaktív párbeszéd:** A felhasználók kiválaszthatnak egy karaktert a listából, és kérdéseket tehetnek fel neki egy chat-felületen.
*   **Dinamikus nyomkövetés:** A beszélgetések során felfedezett nyomok automatikusan megjelennek a "Notebook" (Jegyzetfüzet) panelen.
*   **Két működési mód:**
    1.  **API Mód:** Az alkalmazás egy külső backend szerverhez csatlakozik, hogy onnan töltse be az aktuális esetet és feldolgozza a kérdéseket. A backend URL-je a HTML fájl végén van megadva.
    2.  **Demo Mód:** Offline mód, amely egy, a kódban tárolt egyszerűsített esetet használ. Ez akkor hasznos, ha a backend nem elérhető.
*   **Mentés és betöltés:** A játék állása (beszélgetési előzmények, felfedezett nyomok) a böngésző `localStorage`-ébe mentődik, így a haladás később folytatható. Lehetőség van a haladás JSON fájlba történő exportálására is.
*   **Megoldás beküldése:** A játék végén a diákok egy felugró ablakban beküldhetik a teóriájukat (elkövető, indíték, módszer, időpont).

## Használat

1.  Nyisd meg az `index.html` fájlt egy böngészőben.
2.  A kezdőképernyőn adj meg egy csapatnevet.
3.  Válaszd ki a működési módot:
    *   **API:** Ha csatlakozni szeretnél egy futó backend szerverhez.
    *   **Demo:** Ha internetkapcsolat nélkül, egy beépített esettel szeretnél játszani.
4.  Kattints a "Start" gombra.
5.  A bal oldali sávban válassz egy karaktert, majd a középső chat-panelen tegyél fel neki kérdéseket.
