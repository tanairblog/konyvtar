# Technikai megvalósítás

A backend egy **Python** alkalmazás, amely a **FastAPI** aszinkron web keretrendszerre épül. A futtatásához `uvicorn` ASGI szerver szükséges.

## Főbb technikai jellemzők:

*   **Keretrendszer:** A [FastAPI](https://fastapi.tiangolo.com/) modern, nagy teljesítményű Python keretrendszert használ, amely automatikus Swagger/OpenAPI dokumentációt is generál.
*   **Adatkezelés:** Az egyes esetek (karakterek, tudásbázis, nyomok, megoldás) egyetlen, strukturált **JSON fájlban** vannak definiálva. Ez a megközelítés lehetővé teszi, hogy a szerver kódjának módosítása nélkül, csupán új JSON fájlok létrehozásával lehessen új eseteket hozzáadni a játékhoz.
*   **Információ-visszakeresés (Retrieval):** A karakterek válaszainak generálása egy egyszerű, kulcsszó-alapú keresési algoritmuson alapul.
    1.  A `norm()` függvény a bejövő kérdést és a tudásbázis szövegeit is normalizálja (kisbetűsre alakítja, eltávolítja az írásjeleket).
    2.  A `retrieve()` függvény a normalizált kérdés és a tudásbázis-bejegyzések szavai között keres átfedéseket (`set` műveletekkel).
    3.  A legtöbb egyezést tartalmazó bejegyzések szövegeit adja vissza válaszként.
*   **Nyomok felfedezése:** A `discover_clues()` függvény a kérdésekben speciális "címkék" (`tags`) vagy kulcsszavak (pl. egy szobaszám) jelenlétét figyeli, és ezek alapján oldja fel az új nyomokat.
*   **API Végpontok:**
    *   `/health`: Egyszerű GET kérés az alkalmazás állapotának ellenőrzésére.
    *   `/case`: GET kérés, amely visszaadja a betöltött eset főbb metaadatait a frontend számára.
    *   `/ask`: POST kérés, amely fogadja a játékos kérdését (`AskPayload` Pydantic modellen keresztül), feldolgozza azt, és visszaadja a karakter válaszát.
*   **CORS:** A `CORSMiddleware` használata lehetővé teszi, hogy a frontend bármilyen domainről (böngészőből) biztonságosan elérje az API-t.
