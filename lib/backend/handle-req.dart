import 'package:strike_d_type/backend/engine/game.dart';

// Map<int, Game> runningGames = new Map();
Game game;

int createGame(symbolsAmount) {
  game = new Game(symbolsAmount, true);
  return 1; // uuid#
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
