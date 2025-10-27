# AI Esszé Értékelő technikai leírás

Az alkalmazás egy kliens-szerver architektúrájú megoldás. A kliens oldal egyetlen HTML fájlból áll, amely a felhasználói felületet és a kliens oldali logikát tartalmazza. A szerver oldali feldolgozást egy Cloudflare Worker végzi.

## Kliens oldal

-   **Technológiák**: HTML, CSS, JavaScript
-   **Függőségek**: `pdf.js` a PDF fájlok kliens oldali szövegének kinyeréséhez. A könyvtár CDN-ről töltődik be.
-   **Működés**:
    1.  A felhasználó kiválaszt egy PDF fájlt és beírja a kérdéseket.
    2.  A JavaScript kód a `pdf.js` könyvtár segítségével kinyeri a szöveget a PDF-ből.
    3.  A kinyert szöveget és a kérdéseket egy JSON objektumban elküldi a Cloudflare Worker-nek a `fetch` API segítségével.
    4.  A Worker válaszát megjeleníti a felhasználói felületen.

## Szerver oldal (Cloudflare Worker)

-   **Technológia**: Cloudflare Worker
-   **Működés**:
    1.  A Worker fogadja a kliens által küldött JSON adatokat (esszé szövege és kérdések).
    2.  Egy mesterséges intelligencia modell (pl. egy nagy nyelvi modell) segítségével feldolgozza a szöveget és megválaszolja a kérdéseket.
    3.  A válaszokat JSON formátumban visszaküldi a kliensnek.

**Megjegyzés**: A `WORKER_URL` konstans a JavaScript kódban a Cloudflare Worker címét tartalmazza. Ezt a címet be kell állítani a megfelelő Worker URL-re.