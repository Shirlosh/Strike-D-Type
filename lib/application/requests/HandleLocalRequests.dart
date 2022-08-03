import 'package:strike_d_type/backend/engine/game.dart';

import 'HandleRequests.dart';



class HandleRequestsLocal extends HandleRequests {
  Game game;

  @override
  Future<String> createGame(symbolsAmount) {
    game = Game(symbolsAmount, true);
    return Future<String>.value('');
  }

  @override
  Future<dynamic> getCards(String gameID) {
    List<List<int>> cards = game.getTwoCards();
    print(cards);
    return Future<dynamic>.value(cards);
  }

  @override
  Future<bool> isCorrectSymbol(int symbol, String gameID) {
    return Future<bool>.value(game.getSameSymbol() == symbol);
  }
}