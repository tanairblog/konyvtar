# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes szimulációs logika és a felhasználói felület kezelésére.

## Főbb technikai jellemzők:

*   **Játékállapot (Game State):** A teljes játékállapotot egy `gameState` nevű JavaScript objektum tárolja. Ez tartalmazza a pénz, adósság, társasági élet és jólét mutatókat, az aktuális dátumot, az adósságtörténetet, a halasztott eseményeket és az ismétlődő költségeket.
*   **Eseményadatbázis:** Az összes lehetséges játékbeli esemény (kötelező kiadások, különleges döntések, opcionális események, lehetőségek, sokkok) egy `allEvents` nevű JavaScript objektumban van definiálva. Ez az adatbázis tartalmazza az események leírását, költségeit, a válaszlehetőségeket és azok hatásait a játékállapotra.
*   **Havi eseménysor (Monthly Event Queue):** Minden hónap elején a `buildMonthlyQueue()` függvény dinamikusan összeállítja az adott hónap eseménysorát. Ez magában foglalja a kötelező kiadásokat, a halasztott eseményeket, véletlenszerűen kiválasztott opcionális eseményeket és lehetőségeket, valamint egy esetleges "sokk" eseményt (pl. autójavítás, csőtörés), amelynek bekövetkezési valószínűsége és típusa a játékállapottól (pl. `cheapFoodStreak`) függ.
*   **UI frissítés:** A `updateUI()` függvény felelős a felhasználói felület (pénz/adósság sávok, társasági élet/jólét mérők, dátum) frissítéséért a `gameState` alapján.
*   **Pénz és Adósság vizualizáció:** A pénz és az adósság szintjét szegmentált, függőleges sávok jelenítik meg, amelyek dinamikusan frissülnek a játékállapot változásakor.
*   **Társasági élet és Jólét mérők:** Ezeket kör alakú mérők (gauge) mutatják, amelyek a CSS `conic-gradient` tulajdonságát használják a százalékos érték vizuális megjelenítésére.
*   **Modális ablakok:** Az eseménynapló és az adósságtörténet modális ablakokban jelenik meg, lehetővé téve a részletes áttekintést és az adósságok kifizetését.
*   **Stílus:** A megjelenést egy beágyazott CSS blokk határozza meg, amely custom property-ket használ a témázáshoz, és dekoratív háttérformákat a vizuális élmény fokozására.
*   **Segédfüggvények:** A kód tartalmaz olyan segédfüggvényeket, mint a `formatCurrency` a pénzösszegek formázására és a `clamp` az értékek egy adott tartományon belüli tartására.
