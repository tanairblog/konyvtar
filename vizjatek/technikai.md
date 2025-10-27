# Vízjáték technikai leírás

Az alkalmazás egyetlen HTML fájlból áll, amely tartalmazza a szükséges HTML, CSS és JavaScript kódot.

## Működés

1.  **Helyszínek**: A játék helyszíneit és a közöttük lévő átmeneteket egy JavaScript objektum (`locations`) tárolja. Minden helyszínhez tartozik egy kép, egy leírás és egy lista a lehetséges következő helyszínekről.
2.  **Átmenetek**: Az átmenetek valószínűségekkel vannak ellátva. A "Tovább" gombra kattintva a JavaScript kód a valószínűségek alapján véletlenszerűen választ egyet a lehetséges következő helyszínek közül.
3.  **Felhasználói felület**: A JavaScript kód a DOM manipulációval frissíti a helyszín képét, címét és leírását minden lépésnél.