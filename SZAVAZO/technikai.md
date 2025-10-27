# Technikai megvalósítás

A projekt egyetlen, önálló `index.html` fájlban valósul meg, amely **vanilla JavaScriptet** használ a teljes funkcionalitás biztosítására, és a **Firebase Firestore**-t a valós idejű adatkezeléshez.

## Főbb technikai jellemzők:

*   **Valós idejű adatbázis (Firebase Firestore):**
    *   A szobák állapota (aktuális állítás indexe, nyitott/zárt státusz, PIN hash), a résztvevők adatai és a leadott szavazatok a Firestore-ban tárolódnak.
    *   A Firestore valós idejű listenerei (`onSnapshot`) biztosítják, hogy a tanári és szavazói nézet azonnal frissüljön az adatbázis változásakor.
*   **Hitelesítés (Firebase Authentication):** Az alkalmazás anonim hitelesítést használ (`auth.signInAnonymously()`) a felhasználók azonosítására, így nincs szükség regisztrációra vagy bejelentkezésre.
*   **Biztonság:**
    *   **Admin PIN:** A tanári nézetben beállítható egy opcionális admin PIN, amely SHA-256 hash formájában tárolódik a Firestore-ban. Ez védi a szoba beállításait a jogosulatlan módosításoktól.
    *   **Szavazási korlátozás:** A `localStorage` és a Firestore dokumentum azonosítók kombinációjával biztosított, hogy egy eszközről, egy névvel csak egyszer lehessen szavazni egy adott állításra.
*   **Adatkezelés:** Az igaz/hamis állítások (`STATEMENTS`) közvetlenül a JavaScript kódban vannak tárolva egy tömbben.
*   **Felhasználói felület (UI):**
    *   A UI elemek dinamikusan frissülnek JavaScript segítségével.
    *   A stílusokat egy beágyazott CSS blokk definiálja, amely custom property-ket használ a témázáshoz.
    *   A szavazási eredmények progress bar-ok segítségével vizuálisan is megjelennek.
*   **Deep Linking:** Az alkalmazás támogatja az URL paramétereket (`?role=voter&room=ABC12`), amelyekkel közvetlenül egy szavazói nézetbe lehet lépni egy adott szobakóddal.
*   **CSV Export:** A tanári nézetben lehetőség van az összes szavazási adat CSV formátumban történő exportálására, ami megkönnyíti az adatok további elemzését.
*   **Segédfüggvények:** A kód tartalmaz olyan segédfüggvényeket, mint a `randCode()` egyedi szobakód generálására, `uuid()` egyedi eszközazonosító generálására, és `sha256Hex()` a PIN hash-elésére.
