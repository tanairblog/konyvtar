# Living Room Designer – Interaktív Szobatervező (SVG)

Ez egy böngészőben futó, interaktív webes alkalmazás, amely egy egyszerű nappali tervezőként funkcionál. A felhasználók előre definiált SVG bútorokat húzhatnak és ejthetnek egy virtuális szoba alaprajzára, majd átrendezhetik azokat. Az alkalmazás célja lehet oktatási (pl. térbeli elrendezés, szókincs) vagy egyszerű szórakozás.

## Főbb funkciók

*   **Bútorok húzása és elhelyezése (Drag & Drop):** A felhasználók a bal oldali palettáról (vagy az alapértelmezett pozícióból) húzhatják a bútorokat a szoba alaprajzára.
*   **Mozgatás:** A bútorok egérrel (vagy érintéssel) mozgathatók a vásznon. A kiválasztott elemeket billentyűzettel (nyílbillentyűkkel) is lehet mozgatni.
*   **Átméretezés:** A kiválasztott bútorok mérete módosítható a lenti eszköztáron található `+` és `-` gombokkal, vagy a billentyűzeten a `+`/`-` gombokkal.
*   **Törlés:** A kiválasztott bútorok eltávolíthatók a "Delete" gombbal az eszköztáron, vagy a `Delete`/`Backspace` billentyűvel.
*   **Rácshoz igazítás (Snap to grid):** Egy kapcsolóval bekapcsolható a rácshoz igazítás funkció, amely segít a bútorok rendezett elhelyezésében.
*   **Keverés (Shuffle):** Véletlenszerűen elhelyezi az összes bútort a vásznon.
*   **Visszaállítás (Reset):** Visszaállítja az összes bútort az eredeti, alapértelmezett pozíciójába.
*   **Mentés/Betöltés:** Az aktuális elrendezés elmenthető és betölthető a böngésző helyi tárhelyéről (`localStorage`).
*   **Mentés törlése (Clear Save):** Törli az elmentett elrendezést.

## Használat

1.  Nyisd meg az `index.html` fájlt egy modern böngészőben.
2.  Húzd a bútorokat a szoba alaprajzára.
3.  Kattints egy bútorra a kiválasztásához.
4.  Használd az eszköztárat vagy a billentyűzetet a kiválasztott bútor mozgatásához, átméretezéséhez vagy törléséhez.
5.  A "Snap to grid" kapcsolóval bekapcsolhatod a rácshoz igazítást a rendezettebb elrendezés érdekében.
6.  Mentsd el az elrendezésedet a "Save" gombbal, és töltsd be később a "Load" gombbal.
