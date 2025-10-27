# Detective Classroom - Backend API

Ez a projekt egy Python-alapú backend API, amely egy interaktív, tantermi detektívjátékot szolgál ki. A frontend (egy különálló projekt) ehhez az API-hoz csatlakozik, hogy a diákok "kihallgathassák" a virtuális karaktereket és megoldjanak egy bűnügyet.

## A játék menete

A játék egy előre definiált esetet (`case`) tölt be egy JSON fájlból. A diákok csapatokban dolgoznak, és a játék frontendjén keresztül kérdéseket tehetnek fel a különböző karaktereknek.

1.  A frontend lekéri az eset alapadatait (szereplők, elérhető nyomok listája) a `/case` végpontról.
2.  A diákok kiválasztanak egy karaktert, és beírnak egy kérdést.
3.  A frontend elküldi a kérdést a `/ask` végpontnak.
4.  A backend a karakter "tudásbázisában" (ami a JSON fájlban van definiálva) keres releváns információk után a kérdés kulcsszavai alapján.
5.  A backend visszaad egy választ, amelyet a karakter "mond", valamint egy listát az esetlegesen felfedezett új nyomokról.
6.  A diákok a kapott információk és nyomok alapján próbálják meg kideríteni a rejtély megoldását (ki, mit, mikor, miért csinált).

## Telepítés és futtatás

1.  **Telepítsd a függőségeket:**
    ```bash
    pip install -r requirements.txt
    ```

2.  **Indítsd el a szervert:**
    ```bash
    uvicorn server:app --reload
    ```
    A `--reload` kapcsoló biztosítja, hogy a szerver automatikusan újrainduljon, ha a kódban változás történik.

3.  A szerver a `http://127.0.0.1:8000` címen lesz elérhető.

## Esetfájlok

A szerver a `cases` mappában található JSON fájlokból dolgozik. Jelenleg a `school_lab_heist.json` van betöltve. Más esetek futtatásához a `server.py` fájlban a `CASE_PATH` változót kell módosítani.
