# API és Worker Beállítási Útmutató

Ez az útmutató bemutatja, hogyan állítsd be a szükséges Google API kulcsot és a Cloudflare Workert az AI Esszé Értékelő alkalmazáshoz.

Az alkalmazás két fő részből áll:
1.  **Frontend (`essze.html`)**: Ez fut a felhasználó böngészőjében. Felelős a PDF beolvasásáért és az eredmények megjelenítéséért.
2.  **Backend (Cloudflare Worker)**: Ez egy szerver nélküli funkció, ami fogadja a frontendtől az esszé szövegét és a kérdéseket, majd biztonságosan meghívja a Google AI szolgáltatását az elemzéshez.

## 1. Lépés: Google Cloud AI API Kulcs Létrehozása

Az esszék elemzéséhez a Google Gemini modelljét használjuk, amely a Google Cloud platformon keresztül érhető el. Szükséged lesz egy API kulcsra, amelyet a Google Cloud Console-ban hozhatsz létre.

1.  **Google Cloud Projekt Létrehozása vagy Kiválasztása**:
    *   Látogass el a [https://console.cloud.google.com/](https://console.cloud.google.com/) oldalra és jelentkezz be a Google fiókoddal.
    *   Hozd létre egy új projektet, vagy válaszd ki a meglévő projektet, amit használni szeretnél.

2.  **Gemini API Engedélyezése**:
    *   A Google Cloud Console-ban, a bal oldali navigációs menüben keresd meg az "APIs & Services" (API-k és szolgáltatások) -> "Library" (Könyvtár) menüpontot.
    *   Keresd meg a "Generative Language API" vagy "Vertex AI API" (a Gemini modell elérhetőségétől függően) és engedélyezd azt a projektedhez.

3.  **API Kulcs Létrehozása**:
    *   A Google Cloud Console-ban, a bal oldali navigációs menüben keresd meg az "APIs & Services" (API-k és szolgáltatások) -> "Credentials" (Hitelesítő adatok) menüpontot.
    *   Kattints a "CREATE CREDENTIALS" (HITELÉSÍTŐ ADATOK LÉTREHOZÁSA) gombra, majd válaszd az "API key" (API kulcs) opciót.
    *   A generált API kulcsot másold ki egy biztonságos helyre. Erre a kulcsra a következő lépésben lesz szükséged.
    *   **Fontos**: Éles környezetben javasolt az API kulcsot korlátozni (pl. csak a Cloudflare Worker IP-címéről engedélyezni a hozzáférést), hogy növeld a biztonságot.

## 2. Lépés: Cloudflare Worker Létrehozása és Beállítása

A Cloudflare Worker fogja futtatni a backend logikát, és ez fogja biztonságosan tárolni az API kulcsodat.

1.  **Regisztrálj egy Cloudflare fiókot**: Ha még nincs, hozz létre egy ingyenes fiókot a [https://www.cloudflare.com/](https://www.cloudflare.com/) oldalon.
2.  **Navigálj a Workers oldalra**: A Cloudflare irányítópultján a bal oldali menüben válaszd a "Workers & Pages" menüpontot.
3.  **Új Worker létrehozása**:
    *   Kattints a "Create application" (Alkalmazás létrehozása) gombra.
    *   Válaszd a "Create Worker" (Worker létrehozása) opciót.
    *   Adj egy egyedi nevet a Workernek (pl. `essze-ertekelo-worker`). Ez a név része lesz a Worker URL-jének.
    *   Kattints a "Deploy" (Telepítés) gombra.

4.  **Worker kódjának szerkesztése**:
    *   A Worker létrehozása után kattints az "Edit code" (Kód szerkesztése) gombra.
    *   A szerkesztőben töröld ki a meglévő kódot, és másold be a `worker.js` fájl teljes tartalmát.
    *   Kattints a "Save and Deploy" (Mentés és telepítés) gombra a módosítások mentéséhez.

5.  **API Kulcs hozzáadása a Workerhez (Titkosítás)**:
    *   Menj vissza a Worker beállításaihoz (a Worker nevére kattintva az irányítópulton).
    *   Válaszd a "Settings" (Beállítások) fület, majd az "Variables" (Változók) almenüt.
    *   Az "Environment Variables" (Környezeti változók) szekcióban kattints az "Add variable" (Változó hozzáadása) gombra.
    *   **Variable name** (Változó neve): `GEMINI_API_KEY`
    *   **Value** (Érték): Illessd be az 1. lépésben kimásolt Google AI API kulcsodat.
    *   Kattints az "Encrypt" (Titkosítás) gombra, hogy a kulcs biztonságosan tárolódjon.
    *   Mentsd a változtatásokat a "Save and Deploy" gombbal.

## 3. Lépés: A Frontend Összekapcsolása a Workerrel

Most már csak annyi a dolgod, hogy megadd a `essze.html` fájlnak a frissen létrehozott Worker URL-jét.

1.  **Worker URL-jének másolása**: A Worker oldalán (a "Workers & Pages" menüpont alatt) megtalálod a Worker URL-jét. Másold ki ezt az URL-t.
2.  **`essze.html` módosítása**:
    *   Nyisd meg az `essze.html` fájlt egy szövegszerkesztőben.
    *   Keresd meg a következő sort:
        ```javascript
        const WORKER_URL = IDE KELL A SAJÁT WORKER CÍMÉT BEÍRNI;
        ```
    *   Cseréld le a `IDE KELL A SAJÁT WORKER CÍMÉT BEÍRNI` részt a kimásolt Worker URL-re, idézőjelek között. Például:
        ```javascript
        const WORKER_URL = "https://essze-ertekelo-worker.felhasznalonev.workers.dev";
        ```
3.  **Mentés**: Mentsd el az `essze.html` fájlt.

Ezzel a beállítás kész! Az `essze.html` fájlt megnyitva a böngésződben az alkalmazás már a te saját backend infrastruktúrádat fogja használni.