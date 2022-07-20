import 'package:strike_d_type/backend/engine/game.dart';

Game game;

String createGame(symbolsAmount) {
  game = new Game(symbolsAmount, true);
  return game.getGameID();
}

void prepareGameBeforeStart(String gameID)
{
  game.initGame();
}

List<List<int>> getCards(String gameID, int cardsAmount) {
  List<List<int>> cards =  game.getTwoCards();
  print(cards);
  return cards;
}

bool isCorrectSymbol(int symbol)
{
  return game.getSameSymbol() == symbol;
}
