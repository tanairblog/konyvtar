# **Az R elemzés használata és értelmezése**

Ez az útmutató elmagyarázza, hogyan használd a elemzes.R szkriptet, és mit keress az eredményekben.

## **Hogyan használd**

1. **Fájlok mentése:** Helyezd a elemzes.R és az 1zt.csv fájlokat **ugyanabba a mappába** a számítógépeden.  
2. **R megnyitása:** Nyisd meg az R környezetet (például az RStudio-t).  
3. **Munkakönyvtár beállítása:** Állítsd be az R munkamenet munkakönyvtárát (working directory) arra a mappára, ahová a fájlokat mentetted.  
   * RStudio-ban ezt könnyen megteheted: Session \-\> Set Working Directory \-\> To Source File Location.  
4. **Csomagok telepítése (Csak először):**  
   * A elemzes.R szkriptben keresd meg az install.packages(...) kezdetű sorokat.  
   * Vedd ki előlük a megjegyzésjelet (a \#-t), és futtasd ezt a két sort.  
   * Ezt csak *egyetlen egyszer* kell megtenned. Utána visszaírhatod a \# jelet.  
5. **Szkript futtatása:** Futtasd a teljes elemzes.R szkriptet. Az eredmények és az ábrák meg fognak jelenni a konzolon és az ábrák panelen (Plots pane).

## **Hogyan értelmezd az eredményeket**

A szkript ábrákat és szöveges kimeneteket fog adni. Íme, mit jelentenek.

### **1\. Diákok pontszámának hisztogramja**

* **Mi ez:** Egy oszlopdiagram, amely megmutatja a diákok összesített pontszámának eloszlását.  
* **Mit keress:**  
  * **"Haranggörbe" (Normál):** A pontszámok széles skálán szóródnak, középen csoportosulva. Ez a tipikus eset.  
  * **Balra ferdülő (A legtöbb pontszám magas):** A teszt valószínűleg túl könnyű volt ennek a csoportnak.  
  * **Jobbra ferdülő (A legtöbb pontszám alacsony):** A teszt valószínűleg túl nehéz volt, vagy a diákok nem sajátították el az anyagot.  
  * **Bimodális (Két "púp"):** Ez egy piros zászló\! Gyakran azt jelenti, hogy két különálló csoport van az osztályodban (pl. azok, akik "értik" és azok, akik "nem").

### **2\. Feladatok nehézségi grafikonja**

* **Mi ez:** Egy oszlopdiagram, amely megmutatja az egyes feladatokon elért átlagos pontszámot (0.0-tól 1.0-ig).  
* **Mit keress:**  
  * **1.0 közeli oszlopok:** Ezek **könnyű feladatok**. Majdnem mindenki maximális pontot kapott.  
  * **0.0 közeli oszlopok:** Ezek **nehéz feladatok**. Majdnem mindenki alacsony pontszámot kapott.  
  * **Egy jó tesztben vegyesen vannak** különböző nehézségű feladatok, a legtöbb 0.3 és 0.9 közé esik. Túl sok könnyű feladat nem különbözteti meg a diákokat, túl sok nehéz pedig elkedvetlenítő lehet.

### **3\. Megbízhatósági elemzés (Szöveges kimenet)**

Amikor kiíratod a reliability\_results-t, sok szöveget látsz majd. Erre a sorra koncentrálj:

* **raw\_alpha (Cronbach-alfa):** Ez a te **teszt-megbízhatósági** pontszámod. Megmondja, hogy a teszted következetesen egyetlen fogalmat mér-e.  
  * **\> 0.9:** Kiváló  
  * **0.7 \- 0.9:** Jó/Elfogadható  
  * **\< 0.7:** Kérdéses  
  * **\< 0.6:** Gyenge. A teszt nem megbízható.

### **4\. Feladat diszkriminációs grafikon (A legfontosabb\!)**

* **Mi ez:** Ez az ábra az **r.drop** értéket mutatja minden feladatnál. Ez az érték azt méri: "Azok a diákok, akik a *teljes teszten* jól teljesítettek, ezen a *specifikus feladaton* is jól teljesítettek?"  
* **Mit keress:** Így találhatod meg a "jó" és "rossz" kérdéseket.  
  * **Magas pozitív oszlop (r.drop \> 0.3):** **Ez egy JÓ feladat.** Sikeresen megkülönbözteti a jól és a gyengén teljesítő diákokat. Tartsd meg.  
  * **Alacsony pozitív oszlop (0.1 \< r.drop \< 0.3):** **Ez egy "OK" (közepes) feladat.** Működik, de valószínűleg lehetne javítani rajta.  
  * **Nulla közeli (-0.1 \< r.drop \< 0.1):** **Ez egy ROSSZ feladat.** A helyes vagy helytelen válasz véletlenszerű, és nincs kapcsolata a diák tudásával. Ez csak "zaj", felül kell vizsgálni vagy el kell távolítani.  
  * **Negatív oszlop (r.drop \< \-0.1):** **Ez egy NAGYON ROSSZ feladat.** Azt jelenti, hogy a jól teljesítő diákjaid *rontják el*, a gyengén teljesítők pedig *jól oldják meg*. A kérdés valószínűleg hibás, rossz a javítókulcs, vagy rendkívül félrevezető. **Azonnal vizsgáld felül ezt a feladatot.**

A diszkriminációs (r.drop) és nehézségi grafikonok alapján megalapozott döntéseket hozhatsz arról, hogy mely feladatokat tartsd meg, vizsgáld felül vagy dobd ki a jövőbeli tesztekből.
