# Technikai megvalósítás

Az alkalmazás egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes interaktivitás biztosítására.

## Főbb technikai jellemzők:

*   **Felhasználói felület (UI):**
    *   A UI elemek (tárgyak a palettán, a vászonra helyezett elemek) dinamikusan generálódnak és manipulálódnak JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a színek és méretek kezelésére, valamint egyedi háttérképeket a vizuális megjelenéshez.
*   **SVG ikonok:** A tárgyak SVG formátumban vannak definiálva közvetlenül a HTML-ben. A JavaScript dinamikusan színezi ezeket az SVG elemeket a paletta létrehozásakor, így minden tárgyból két különböző színváltozat jön létre.
*   **Drag and Drop API:** A tárgyak palettáról vászonra húzásához a natív HTML Drag and Drop API-t (`dragstart`, `dragover`, `drop`) használja az alkalmazás.
*   **Pointer Events API:** A vászonra helyezett tárgyak mozgatásához a Pointer Events API-t (`pointerdown`, `pointermove`, `pointerup`) alkalmazza, ami egységes kezelést biztosít az egér- és érintéses interakciókhoz.
*   **Billentyűzetes vezérlés:** A kiválasztott tárgyak mozgatásához (nyílbillentyűk), átméretezéséhez (`+`/`-`) és törléséhez (`Delete`/`Backspace`) billentyűparancsok is rendelkezésre állnak.
*   **Keresési funkcionalitás:** A bal oldali palettán lévő keresőmező JavaScript segítségével szűri a megjelenített tárgyakat név alapján.
*   **Reszponzív design:** A CSS tartalmaz média lekérdezéseket, amelyek a képernyőmérethez igazítják az elrendezést, például kisebb képernyőkön a paletta a vászon fölé kerül.
