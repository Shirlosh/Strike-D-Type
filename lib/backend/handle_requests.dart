import 'dart:convert';
import 'package:strike_d_type/backend/engine/game.dart';
import '../dto_objects/twoCardsDTO.dart';

Map<int, Game> runningGames = new Map();

///get amount of symbol requested on card, and returns a new GamdID.
String getNewGame(int symbolsAmount) {
  Game pGame = new Game(symbolsAmount, true);
  runningGames[pGame.getGameID()] = pGame;
  return jsonEncode(pGame.getGameID());
}

///Gets game id, and returns two cards and the same symbol they have.
String getTurnData(String gameID) {
  Game game = runningGames[jsonDecode(gameID)];
  TwoCardsDTO turnData = game.getTwoCards();
  String item = jsonEncode(turnData);


  return item;
}
