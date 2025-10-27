# Firebase beállítása a Vita Kötélhúzás alkalmazáshoz

Ez az útmutató lépésről lépésre bemutatja, hogyan hozhatsz létre és konfigurálhatsz egy Firebase projektet, hogy a Vita Kötélhúzás alkalmazás a saját, független adatbázisodat használja.

## 1. Lépés: Firebase projekt létrehozása

Először is, szükséged lesz egy saját Firebase projektre.

1.  **Nyisd meg a Firebase Console-t**: Menj a [https://console.firebase.google.com/](https://console.firebase.google.com/) oldalra és jelentkezz be a Google fiókoddal.
2.  **Új projekt hozzáadása**: Kattints a "Projekt hozzáadása" gombra.
3.  **Projekt elnevezése**: Adj egy nevet a projektnek (pl. "Sajat-Vita-App"), majd fogadd el a feltételeket és kattints a "Tovább" gombra.
4.  **Google Analytics**: Döntsd el, hogy szeretnél-e Google Analytics-et a projekthez (nem kötelező ehhez az alkalmazáshoz), majd kattints a "Projekt létrehozása" gombra.

## 2. Lépés: Webalkalmazás hozzáadása és a konfigurációs kulcsok másolása

Miután létrejött a projekt, hozzá kell adnod egy webalkalmazást, hogy megkapd a szükséges kulcsokat.

1.  **Webalkalmazás indítása**: A projekted főoldalán kattints a web ikont (általában `</>`).
2.  **Alkalmazás regisztrálása**: Adj egy becenevet az alkalmazásodnak (pl. "Vita App"), majd kattints az "Alkalmazás regisztrálása" gombra.
3.  **Firebase SDK hozzáadása és kulcsok másolása**: A következő lépésben a Firebase felajánlja a szükséges szkripteket. Nekünk csak egy részre van szükségünk: a `firebaseConfig` objektumra. **Ezt az objektumot másold ki a vágólapra.** Így fog kinézni:

    ```javascript
    // EZT A RÉSZT KELL KIMÁSOLNI
    const firebaseConfig = {
      apiKey: "AIzaSy... (a te egyedi kulcsod)",
      authDomain: "sajat-vita-app.firebaseapp.com",
      databaseURL: "https://sajat-vita-app-default-rtdb.europe-west1.firebasedatabase.app",
      projectId: "sajat-vita-app",
      storageBucket: "sajat-vita-app.appspot.com",
      messagingSenderId: "1234567890",
      appId: "1:1234567890:web:abcdef123456"
    };
    ```

## 3. Lépés: A kód módosítása

Most, hogy megvan a saját `firebaseConfig` objektumod, be kell illesztened az alkalmazás HTML fájljaiba.

1.  **Fájlok megnyitása**: Nyisd meg a következő két fájlt egy szövegszerkesztőben:
    *   `admin.html`
    *   `index.html`

2.  **Kód cseréje**: Mindkét fájlban keresd meg a következő sort:

    ```javascript
    const firebaseConfig = { apiKey: "IDE_ADD_A_KULCSOD" };
    ```

    Cseréld le ezt a teljes sort a 2.3-as pontban kimásolt, saját `firebaseConfig` objektumoddal.

## 4. Lépés: Realtime Database beállítása

Az alkalmazás a Firebase Realtime Database-t használja az adatok tárolására.

1.  **Adatbázis létrehozása**: A Firebase Console-ban, a bal oldali menüben válaszd az "Összeállítás" -> "Realtime Database" menüpontot.
2.  **Adatbázis létrehozása gomb**: Kattints az "Adatbázis létrehozása" gombra.
3.  **Helyszín kiválasztása**: Válassz egy helyszínt az adatbázisodnak (az alapértelmezett általában megfelelő).
4.  **Biztonsági szabályok**: Válaszd a **"Indítás teszt üzemmódban"** lehetőséget. Ez lehetővé teszi, hogy az alkalmazás szabadon írja és olvassa az adatbázist.
    *   **Fontos**: Ez a beállítás csak fejlesztéshez és teszteléshez ajánlott. Éles használat esetén szigorúbb biztonsági szabályokat kell beállítanod.
5.  Kattints az **"Engedélyezés"** gombra.

Ezzel kész is vagy! Az alkalmazás most már a te saját Firebase projektedet fogja használni. Nyisd meg az `admin.html` fájlt egy böngészőben, hozz létre egy új vitát, és a generált kódokkal a résztvevők be tudnak lépni az `index.html` oldalon keresztül.
