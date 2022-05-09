class TwoCardsDTO {
  List<List<int>> cards;
  int sameSymbol;

  TwoCardsDTO(this.cards, this.sameSymbol);

  /*List<int> getFirstCard() {
    return _cards[0];
  }

  List<int> getSecondCard() {
    return _cards[1];
  }

  List<List<int>> getCards() {
    return this._cards;
  }
*/
  int getSameSymbolID() {
    return sameSymbol;
  }
}
