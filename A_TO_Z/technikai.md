# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlból áll, amely nem igényel külső függőségeket a Google Fonts betűtípusokon kívül. A megvalósítás alapját a HTML, a CSS és a vanilla JavaScript képezi.

## Főbb technikai jellemzők:

*   **Dinamikus UI:** A játék felhasználói felülete (a betűkör, a statisztikák, a kérdések) teljes mértékben JavaScript segítségével jön létre és frissül.
*   **Állapotkezelés:** A játék állapotát (aktív betű, pontszám, hátralévő idő, megoldott és passzolt kérdések) egy központi `state` JavaScript objektum kezeli.
*   **Betűkör elrendezése:** A betűk kör alakú elrendezését trigonometriai függvények (`Math.cos`, `Math.sin`) segítségével számolja ki a szkript, így az elrendezés reszponzív marad a böngészőablak átméretezésekor.
*   **Időzítő:** A visszaszámláló a `requestAnimationFrame` API-ra épül, ami hatékony és teljesítménybarát animációt tesz lehetővé a böngészőben.
*   **Kérdések és válaszok:** A játékhoz tartozó definíciók és a helyes válaszok egy `CLUES` nevű JavaScript objektumban vannak tárolva. Minden betűhöz több kérdésvariáció is tartozhat, amelyek közül a program véletlenszerűen választ.
*   **Stílus:** A megjelenést egy beágyazott CSS (`<style>` tag) határozza meg. Modern CSS-technikákat használ, mint például a custom properties (CSS-változók) a színek és méretek központi kezelésére, valamint CSS-animációkat a felhasználói visszajelzésekhez (pl. pontszerzés animációja).
*   **Eseménykezelés:** A játékos interakcióit (kattintás, gépelés) a JavaScript eseménykezelői (`addEventListener`) dolgozzák fel.
