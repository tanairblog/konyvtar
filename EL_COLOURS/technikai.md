# Technikai megvalósítás

Az alkalmazás egyetlen, önálló `index.html` fájlban van megvalósítva, külső függőségek nélkül. A teljes logika **vanilla JavaScript** nyelven íródott.

## Főbb technikai jellemzők:

*   **Architektúra:** A teljes JavaScript kód egy IIFE-be (Immediately Invoked Function Expression) van csomagolva, ami megakadályozza a globális névtér szennyezését.
*   **Felhasználói felület (UI):**
    *   A teljes UI dinamikusan, JavaScript DOM-manipulációval jön létre.
    *   A stílusokat egy, a HTML-be ágyazott CSS blokk definiálja, amely custom property-ket használ a konzisztens témázás érdekében.
*   **Hanghatások:** Az alkalmazás a **Web Audio API**-t használja egyszerű hangeffektek (kattintás, helyes/helytelen válasz) generálására. Ez a funkció kikapcsolható.
*   **Drag and Drop:** Az "Order the Colours" játékmód a natív HTML Drag and Drop API-ra épül, lehetővé téve a színkártyák intuitív átrendezését.
*   **Adattárolás:** A színek (név, hex kód) és a színezhető formák (SVG-adatok) egyszerű JavaScript tömbökben (`COLOURS`, `SHAPES`) vannak tárolva a kódban.
*   **Tanári Eszközök:** A "Teacher Tools" panel egy rejtett `aside` elem, amelynek láthatóságát JavaScript vezérli. Az itt található statisztikák a játékok eseményeire feliratkozva, valós időben frissülnek.
*   **Nincs perzisztencia:** Az alkalmazás nem használ `localStorage`-et vagy más tárolási mechanizmust az állapot mentésére az oldalon kívül. A tanári eszközök a munkamenet során nyújtanak követési lehetőséget.
