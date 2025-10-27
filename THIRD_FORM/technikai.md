# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására.

## Főbb technikai jellemzők:

*   **Adatkezelés:**
    *   A rendhagyó igék listája (`VERBS`), a gyakorló mondatok (`PRACTISE_DATA`) és a fordítási feladatok (`TRANSLATION_DATA`) közvetlenül a JavaScript kódban vannak tárolva.
    *   Ez a megközelítés egyszerűsíti a telepítést, mivel nincs szükség külső adatbázisra vagy API-ra.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ egy "Calm Slate" sötét témához, amely kíméli a szemet és osztálytermi környezetben is jól használható.
    *   A füles navigáció (`tabs`) JavaScripttel kezeli a különböző játékmódok közötti váltást.
*   **Játéklogika modularitása:** Minden játékmód (Flashcards, Learn, Practice, Translate) egy külön JavaScript objektumként van implementálva, amely saját állapotot és metódusokat tartalmaz. Ez elősegíti a kód modularitását és karbantarthatóságát.
*   **Flashcard animáció:** A kártyák megfordítását CSS `transform-style: preserve-3d` és `transform: rotateY` tulajdonságok animálják, sima 3D hatást biztosítva.
*   **Válaszellenőrzés és normalizálás:** A `normalize()` és `normalizeEN()` segédfüggvények kezelik a felhasználói bevitelt (kisbetűsre alakítás, írásjelek eltávolítása, szóközök normalizálása, rövidítések feloldása) a rugalmas összehasonlítás érdekében.
*   **Statisztikák és naplózás (`localStorage`):**
    *   Minden felhasználói interakciót (melyik fül, milyen művelet, bevitel, helyes/helytelen, pontszám) részletesen naplóz az alkalmazás a böngésző `localStorage`-ébe (`ivt_logs_v1` kulcs alatt).
    *   A `MutationObserver` API-t használja a pontszámok és visszajelzések változásának figyelésére, biztosítva a pontos naplózást.
    *   A felhasználói név és osztály szintén `localStorage`-ben tárolódik.
*   **Admin Panel:** Egy jelszóval védett (hardkódolt jelszó: `tanar`) adminisztrációs felület, amely lehetővé teszi a tanár számára a felhasználói aktivitás és statisztikák megtekintését és exportálását CSV vagy JSON formátumban.
*   **Kilépőkártya (Exit Card):** Egy összefoglaló a felhasználó munkamenetéről, amely a vágólapra másolható. A pontszámok a `localStorage`-ből és a DOM-ból is kiolvasásra kerülnek, hogy a legpontosabb összegzést adják.
