# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   A teljes szókincs (`ALL_ITEMS`) egy nagy JavaScript tömbben van tárolva, amely minden szóhoz tartalmazza az azonosítót, a szót, a névelőt, az IPA kiejtést, példamondatot, kategóriát, emojit és opcionálisan SVG kép adatokat.
    *   A "Pack the Bag" modul forgatókönyvei (`PACK_PRESETS`) szintén a kódban vannak definiálva.
    *   A `MODULES` tömb definiálja az összes elérhető játékmód metaadatait.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan generálódnak JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ egy világos, diákbarát témához (felülírva egy alapértelmezett sötét témát).
    *   A `render()` függvény routerként működik, dinamikusan betöltve a kiválasztott játékmód UI-ját és logikáját a fő tartalomterületre.
*   **Állapotkezelés és Perzisztencia:**
    *   Az alkalmazás állapota (`state` objektum: `classMode`, `xp`, `streak`, `timer`, `progress` minden szóhoz, `bucket` a gyakorlandó/ismert szavakhoz) globális JavaScript objektumban van tárolva.
    *   A felhasználó haladása a böngésző `localStorage` API-jába (`KEY`) mentődik, így a munkamenetek között is megmarad.
*   **Gamifikáció:** XP (tapasztalati pontok) és Streak (helyes válaszok sorozata) követés, amely motiválja a felhasználókat.
*   **Kisegítő lehetőségek:** "Dyslexia helper" (betűköz, szóköz növelése) és "High contrast" mód a jobb olvashatóság érdekében.
*   **Beszédfunkciók:**
    *   **Speech Synthesis:** A `speak()` függvény a Web Speech API `SpeechSynthesisUtterance` interfészét használja a szavak és mondatok felolvasására.
    *   **Speech Recognition:** A `tryMic()` függvény a Web Speech API `SpeechRecognition` (vagy `webkitSpeechRecognition`) interfészét használja a felhasználói hangbevitel szöveggé alakítására.
*   **Adat exportálás:** A felhasználó haladása CSV formátumban exportálható.
*   **Segédfüggvények:** A kód tartalmaz olyan segédfüggvényeket, mint a `showToast` (értesítések megjelenítésére), `addXP`, `streakBump`, `shuffle`, `getSet`, `ensureProgress`, `mark`.
