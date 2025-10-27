# Technikai megvalósítás

A "Conversation Builder" egyetlen, önálló `index.html` fájlban valósul meg, amely vanilla JavaScriptet használ a teljes funkcionalitás ellátására. Nem használ külső JavaScript keretrendszereket.

## Főbb technikai jellemzők:

*   **Adatforrás:** A párbeszédek és a hozzájuk tartozó metaadatok egy nagy JSON objektumban vannak tárolva, amely közvetlenül a HTML fájlba van ágyazva egy `<script type="application/json">` tagen belül. A szkript tartalmaz egy hibatűrő JSON-értelmezőt is.
*   **Karakterkódolás javítása:** A program tartalmaz egy `sanitizeDB` nevű függvényt, amely automatikusan javítja a gyakori karakterkódolási hibákat (pl. `â€™` helyett `'`), biztosítva a szövegek helyes megjelenítését.
*   **Moduláris felépítés:** A program logikailag négy fő modulra (Build, Cloze, Order, Speak) van osztva. Egy központi `switchTab` függvény kezeli a nézetek közötti váltást, és minden módhoz saját `setup...` függvény tartozik, amely előkészíti az adott feladatot.
*   **Dinamikus feladatgenerálás:**
    *   A **Build** mód dinamikusan generál helytelen válaszlehetőségeket a párbeszéd más részeiből vagy egy általános "bankból", így a feleletválasztós teszt minden alkalommal releváns, de változatos.
    *   A **Cloze** mód a szövegből reguláris kifejezések és előre definiált szavak (`Set`) alapján hagyja ki a szavakat.
    *   Az **Order** mód a párbeszéd mondatait a Fisher-Yates algoritmus egy implementációjával keveri össze.
*   **DOM-manipuláció:** A teljes felhasználói felület dinamikusan, JavaScript segítségével jön létre és frissül. A program nem tölti újra az oldalt a feladatok és módok közötti váltáskor.
*   **Stílus:** A kinézetet egy, a HTML-be ágyazott CSS rész határozza meg, amely modern CSS-funkciókat, például custom property-ket (változókat) használ a konzisztens megjelenés érdekében.
