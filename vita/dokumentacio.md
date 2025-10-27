Felépítés
Fájlok:

admin.html: Tartalmazza a vita létrehozásához szükséges HTML űrlapot és a teljes játékfelületet. A JavaScript kódja felelős a vita létrehozásáért, a kódok generálásáért és az adminisztrátori funkciók (pl. kör lezárása) megjelenítéséért.

index.html: Egy egyszerűsített oldal, ami csak a kód beírására szolgáló űrlapot és a játékfelületet tartalmazza. A JavaScript kódja a kódfelismerésért és a csatlakozásért felel.

Technológiák:

HTML5, CSS3: A felület strukturális és vizuális felépítéséért felelnek.

Vanilla JavaScript (ES6+): Az alkalmazás teljes kliensoldali logikáját kezeli, beleértve a felhasználói interakciókat, állapotváltozásokat és a Firebase kommunikációt.

Firebase Realtime Database: A háttéradatbázis, ami lehetővé teszi a vita állapotának valós idejű szinkronizálását az összes csatlakozott kliens között.

Adatbázis Struktúra (Firebase)
Az adatbázis két fő részből áll: debates (a viták adatai) és codeMappings (a kódok és a hozzájuk tartozó viták összerendelése).

```JSON

{
  "debates": {
    "DABC123": { // Egyedi, belső vita azonosító
      "adminUid": "user_xyz",          // A létrehozó (admin) egyedi azonosítója
      "gameState": "VOTING",           // A játék aktuális állapota (WAITING_FOR_PLAYERS, A_TURN, B_TURN, VOTING, FINISHED)
      "nextStartingPlayer": "B",       // Ki kezdi a KÖVETKEZŐ kört ('A' vagy 'B')
      "participants": {
        "A": true,
        "B": true
      },
      "positionA": "A kutya",
      "positionB": "A macska",
      "topic": "Melyik a jobb háziállat?",
      "scoreA": 1,
      "scoreB": 0,
      "turn": null,                    // Éppen ki van soron ('A', 'B' vagy null)
      "rounds": [
        {
          "startingPlayer": "A",
          "startingArgument": "A kutyák hűségesebbek.",
          "respondingArgument": "A macskák önállóbbak.",
          "votesA": 15,
          "votesB": 8,
          "winner": "A"
        }
      ]
    }
  },
  "codeMappings": {
    "AXYZ01": { "debateId": "DABC123", "role": "A" },    // 'A' vitázó kódja
    "BKLM45": { "debateId": "DABC123", "role": "B" },    // 'B' vitázó kódja
    "SABC78": { "debateId": "DABC123", "role": "Néző" } // Nézői kód
  }
}
```


Fő Logikai Folyamatok
Vita Létrehozása: Az admin.html oldalon a createDebate funkció generál egy belső vita ID-t és három csatlakozási kódot. Létrehoz egy új bejegyzést a /debates alatt a vita alapadataival, és feltölti a /codeMappings táblát a kód-vita összerendelésekkel.

Csatlakozás: Az index.html oldalon a joinDebate funkció a beírt kódot megkeresi a /codeMappings alatt. Ha sikeres, kiolvassa a vita ID-t és a hozzárendelt szerepkört, majd ellenőrzi, hogy az 'A'/'B' hely szabad-e. Végül elmenti az adatokat a böngésző sessionStorage-ébe és elindítja a játék figyelését.

Játékmenet: A listenForUpdates funkció mindkét oldalon folyamatosan figyeli az adatbázis változásait. Bármilyen változás (új érv, szavazat, kör vége) esetén lefut, és meghívja az updateUI függvényt, ami újrarajzolja a képernyőt a friss adatok alapján. Ez biztosítja a valós idejű élményt.

Kör lezárása és győzelem: Az endRound funkciót csak az admin tudja aktiválni. Ez a funkció:

Összeszámolja a szavazatokat és megállapítja a kör győztesét.

Frissíti a scoreA és scoreB értékeket.

Ellenőrzi a győzelmi feltételt: |scoreA - scoreB| >= 3.

Ha a feltétel teljesül, a gameState-et FINISHED-re állítja.

Ha nem, beállítja a következő kör kezdőjátékosát a nextStartingPlayer alapján, és átváltja a gameState-et.
