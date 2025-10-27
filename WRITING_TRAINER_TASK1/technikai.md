# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** és **Tailwind CSS**-t használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   Az írásbeli feladatok (`EXAM_TASKS`), a funkcionális kifejezések (`LANGUAGE_FUNCTIONS_DB`) és a diskurzusjelölők (`DISCOURSE_MARKERS_DB`) közvetlenül a JavaScript kódban vannak tárolva, tömbök és objektumok formájában.
    *   Minden feladat tartalmazza a promptot, a szószámkorlátot, a regisztert és egy ellenőrzőlistát a kötelező pontokkal.
*   **Felhasználói felület (UI):**
    *   A UI a **Tailwind CSS** keretrendszerrel készült, amelyet CDN-ről tölt be az alkalmazás. A Tailwind konfigurációja kiterjesztésre került egyedi CSS változók használatára.
    *   A felület három oszlopra van osztva (feladatválasztó, fő munkaterület, nyelvi segédletek), amelyek reszponzívan alkalmazkodnak a képernyőmérethez.
    *   A különböző szakaszok (`welcome-card`, `stage-1-card`, `stage-3-card`) dinamikusan jelennek meg/rejtőznek el JavaScript segítségével.
*   **Szakasz alapú munkafolyamat:** Az alkalmazás egy lépésről lépésre haladó munkafolyamatot implementál (feladat elemzés → nyelvi segédletek → írás), amely segíti a felhasználót a feladat strukturált megközelítésében.
*   **Ellenőrzőlista validáció:** A `validateChecklist()` függvény ellenőrzi a felhasználó által kiválasztott kötelező pontokat, és vizuális visszajelzést ad (színkódolt keretek és háttérszínek) a helyes, hibás és kihagyott elemekről.
*   **Nyelvi segédletek (Scaffolding):**
    *   A `updateScaffolding()` függvény dinamikusan generálja a funkcionális kifejezéseket és diskurzusjelölőket a kiválasztott nyelvi regiszter (informális/formális) alapján.
    *   A kifejezésekre kattintva azok közvetlenül beillesztésre kerülnek az írási területre a kurzor pozíciójába.
*   **Szószám számláló és vizuális mérő:** A `updateWordCount()` függvény valós időben számolja a szavakat, és egy vizuális sávon (`word-meter-bar`) jelzi a szószámkorláthoz való viszonyt, színkódolással (zöld, narancs, piros).
*   **Fájlletöltés:** A `downloadDraft()` függvény a `Blob` és `URL.createObjectURL` API-k segítségével lehetővé teszi a megírt szöveg `.txt` fájlként történő letöltését.
