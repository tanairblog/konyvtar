# Sodródás és Szelekció Szimulátor

Ez az alkalmazás a populációgenetika két alapvető folyamatát, a genetikai sodródást (drift) és a természetes szelekciót modellezi. A szimuláció egy populáció allélgyakoriságának változását követi nyomon 100 generáción keresztül.

## A program célja

A szimulátor célja, hogy bemutassa, hogyan befolyásolja a véletlen (sodródás) és a környezeti rátermettség (szelekció) egy adott génváltozat (allél) elterjedését vagy eltűnését egy populációban.

## Hogyan működik?

1.  **Paraméterek beállítása:**
    * **Egyedszám:** Add meg a populáció méretét. Kisebb populációkban a genetikai sodródás hatása erősebb.
    * **Fitnesz értékek:** Adj meg egy 0 és 1 közötti értéket mindhárom genotípus (AA, Aa, aa) számára. Az 1-es érték 100%-os túlélési és szaporodási esélyt jelent, míg a kisebb értékek csökkentik ezt az esélyt.
2.  **Szimuláció indítása:** Kattints a "szimuláció indítása" gombra a folyamat elindításához.
3.  **Vizuális követés:**
    * **Animáció:** A felső ablakban egyedekként jelenik meg a populáció. A színük a genotípusukat jelöli (piros: AA, lila: Aa, kék: aa). Figyeld, ahogy a színek aránya változik generációról generációra!
    * **Grafikon:** Az alsó grafikon az "A" (piros) és "a" (kék) allélok gyakoriságát ábrázolja az idő (generációk) függvényében. Figyeld meg, hogy az allélok fixálódhatnak (gyakoriságuk 100% lesz) vagy kihalhatnak (gyakoriságuk 0% lesz).
4.  **Szimuláció megállítása:** A folyamatot bármikor megállíthatod a "Szimuláció megállítása" gombbal.

## Kinek ajánlott?

* **Biológiatanároknak és diákoknak:** A populációgenetika, a Hardy-Weinberg-egyensúly, a genetikai sodródás és a szelekció elveinek szemléltetésére.
* **Mindenkinek,** akit érdekel, hogyan működik az evolúció a populációk szintjén.
