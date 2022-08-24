import 'package:strike_d_type/application/Globals.dart';
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
  Future<dynamic> getCards() {
    List<List<int>> cards = game.getTwoCards();
    return Future<dynamic>.value(cards);
  }

  /*
  @override
  Future<dynamic> getParticipates() {
    return Future<dynamic>.value(Username);
  }*/

  @override
  Future<bool> isCorrectSymbol(int symbol) {
    return Future<bool>.value(game.getSameSymbol() == symbol);
  }
}
