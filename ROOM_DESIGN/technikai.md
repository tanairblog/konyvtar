# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes interaktivitás biztosítására.

## Főbb technikai jellemzők:

*   **Grafika (SVG):** A teljes szoba alaprajza (falak, padló, ablak, ajtó) és az összes bútor SVG (Scalable Vector Graphics) formátumban van definiálva közvetlenül a HTML-ben. Ez biztosítja a grafikák élességét és méretezhetőségét.
*   **SVG manipuláció:** A JavaScript közvetlenül manipulálja az SVG elemeket (pl. `transform` attribútumok módosításával) a bútorok mozgatásához és átméretezéséhez.
*   **Pointer Events API:** A bútorok vásznon belüli mozgatásához a Pointer Events API-t (`pointerdown`, `pointermove`, `pointerup`) használja az alkalmazás, ami egységes kezelést biztosít az egér- és érintéses interakciókhoz.
*   **Billentyűzetes vezérlés:** A kiválasztott bútorok mozgatásához (nyílbillentyűk), átméretezéséhez (`+`/`-`) és törléséhez (`Delete`/`Backspace`) billentyűparancsok is rendelkezésre állnak.
*   **Rácshoz igazítás (Snap to Grid):** A `snap()` segédfüggvény kerekíti az elemek pozícióját a legközelebbi rácspontra, ha a funkció be van kapcsolva.
*   **Perzisztencia (`localStorage`):** Az aktuális elrendezés elmenthető és betölthető a böngésző `localStorage` API-jából, így a felhasználó munkája megmarad a böngésző bezárása után is.
*   **Segédfüggvények:** A kód tartalmaz olyan segédfüggvényeket, mint az `svgPoint` (képernyő koordináták konvertálása SVG koordinátákká), `clamp` (értékek korlátozása egy tartományon belül), és `sizeOf` (SVG elem méretének lekérdezése).
*   **Toast értesítések:** Kisméretű, ideiglenes üzenetek jelennek meg a felhasználó számára (pl. "Layout saved.").
