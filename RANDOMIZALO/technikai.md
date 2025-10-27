# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Felhasználói felület (UI):**
    *   A UI elemek (szövegmező, gombok, kimeneti terület) statikus HTML-ből épülnek fel.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz.
*   **Adatkezelés:** A felhasználó által megadott lista a szövegmezőből kerül beolvasásra, és soronként egy tömbbe (`items`) kerül. Az üres sorok automatikusan kiszűrődnek.
*   **Véletlenszerűsítési algoritmusok:**
    *   **`shuffle(array)`:** A Fisher-Yates algoritmus egy implementációját használja a lista elemeinek véletlenszerű megkeverésére. Ez biztosítja, hogy minden lehetséges permutáció egyenlő valószínűséggel forduljon elő.
    *   **Véletlenszerű választás:** A `Math.random()` és `Math.floor()` segítségével választ ki egy véletlenszerű indexet a listából.
    *   **Csapatkészítés:** A megkevert listát egyenletesen osztja szét a megadott számú csapatba.
*   **Eseménykezelés:** A gombokra kattintva a megfelelő JavaScript függvények futnak le, amelyek elvégzik a véletlenszerűsítési műveleteket és frissítik a kimeneti területet.
*   **Kimenet:** Az eredmények egy `<pre>` HTML elemben jelennek meg, ami megőrzi a formázást (pl. sortöréseket).
