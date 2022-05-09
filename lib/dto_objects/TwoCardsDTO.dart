class TwoCardsDTO {
  List<List<int>> _cards;
  int _sameSymbol;

  TwoCardsDTO(this._cards, this._sameSymbol);

  List<int> getFirstCard() {
    return _cards[0];
  }

  List<int> getSecondCard() {
    return _cards[1];
  }

  List<List<int>> getCards() {
    return this._cards;
  }

  int getSameSymbolID() {
    return _sameSymbol;
  }
}
