# Technikai megvalósítás

Az alkalmazás egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:** A gyakorló kifejezések (angol és magyar fordításokkal) közvetlenül a JavaScript kódban vannak tárolva, `FAMILY` és `ROUTINE` nevű tömbökben. Ezek a tömbök objektumokat tartalmaznak, `en` és `hu` tulajdonságokkal. Az "All" témakör dinamikusan generálódik az összes többi témakör kombinálásával.
*   **Felhasználói felület (UI):**
    *   A UI elemek, beleértve a kártyákat is, dinamikusan generálódnak JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz, és komplex radiális gradienseket a háttérhez.
*   **Kártya animáció:** A kártyák megfordítását CSS `transform-style: preserve-3d` és `rotateY` tulajdonságok animálják, sima 3D hatást biztosítva.
*   **Időzítő:** Az időzítő `setInterval` segítségével van implementálva, és a `Date.now()`-t használja a pontos időméréshez.
*   **Állapotkezelés:** Az alkalmazás állapota (pl. futó időzítő, kiosztott kártyák, használt kártyák, aktív témakör) globális JavaScript változókban van tárolva. Az aktív témakör kiválasztása a böngésző `localStorage`-ében is megőrződik.
*   **Segédfüggvények:** A kód tartalmaz segédfüggvényeket, mint például a `choice` a véletlenszerű kártyaválasztáshoz, `fmt` az idő formázásához, és `escapeHTML` a biztonságos HTML kimenethez.
*   **Interakció:** A kártyákra kattintva vagy billentyűzettel (Enter/Space) megfordíthatók. A "Used" gombbal jelölhetők a gyakorolt kártyák, ami vizuálisan is megjelenik egy áthúzott szalag formájában.
