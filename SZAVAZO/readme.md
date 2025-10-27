# AI – Igaz/Hamis Szavazólap

Ez egy interaktív, böngészőben futó alkalmazás, amelyet csoportos (pl. osztálytermi) igaz/hamis szavazások lebonyolítására terveztek, különösen az AI-val kapcsolatos állításokról. Az alkalmazás két nézetet kínál: egy tanári (Host) és egy szavazói (Voter) felületet, valós idejű szinkronizációval a Firebase Firestore segítségével.

## Főbb funkciók

### Tanári nézet (Host View)

*   **Szoba létrehozása és kezelése:** Hozz létre egy egyedi szobakóddal ellátott szavazótermet. Opcionálisan beállíthatsz egy admin PIN-t a szoba védelmére.
*   **Megosztható link:** Generálj egy linket, amelyet megoszthatsz a résztvevőkkel a könnyű csatlakozáshoz.
*   **Állítások navigálása:** Lépkedj előre és hátra a beépített AI-val kapcsolatos igaz/hamis állítások között.
*   **Valós idejű eredmények:** Az aktuális állításra leadott szavazatok (igaz/hamis arány) valós időben frissülnek.
*   **Résztvevők követése:** Láthatod, hányan csatlakoztak a szobához, és egy admin táblázatban nyomon követheted a résztvevők aktivitását és szavazatait.
*   **Szavazatok törlése:** Törölheted az aktuális állításra leadott szavazatokat.
*   **Adatok exportálása:** Exportálhatod az összes szavazási adatot CSV formátumban.

### Szavazói nézet (Voter View)

*   **Csatlakozás szobához:** Írd be a szobakódot és a nevedet a szavazáshoz való csatlakozáshoz.
*   **Állítás megjelenítése:** Látod a tanár által éppen aktívvá tett igaz/hamis állítást.
*   **Szavazás:** Kattints az "IGAZ" vagy "HAMIS" gombra a szavazatod leadásához.
*   **Szavazási korlátozás:** Egy állításra csak egyszer szavazhatsz egy eszközről és névvel.

## Használat

1.  **Firebase beállítás:** Az online, több eszközös szavazáshoz szükséged lesz egy Firebase projektre (Firestore adatbázissal és Anonymous Authentication engedélyezésével). A `firebaseConfig` objektumot ki kell tölteni a saját adataiddal az `index.html` fájlban.
2.  **Alkalmazás megnyitása:** Nyisd meg az `index.html` fájlt egy modern böngészőben.
3.  **Tanárként:** Kattints a "Tanári nézet" gombra. Hozz létre egy szobát, és oszd meg a linket a diákokkal. Navigálj az állítások között, és figyeld az eredményeket.
4.  **Diákként:** Kattints a "Szavazói nézet" gombra. Írd be a szobakódot és a nevedet, majd csatlakozz. Szavazz az aktuális állításra.
