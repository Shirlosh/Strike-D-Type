import 'dart:convert';

import 'package:strike_d_type/backend/engine/game.dart';

import '../dto_objects/TwoCardsDTO.dart';

Map<int, Game> runningGames = new Map();
Game game;

String getGameID() {
  int symbolsAmount = 6;
  game = new Game(symbolsAmount, true);

  return jsonEncode(1);
}

List<List<int>> getCards(String gameID, int cardsAmount) {
  int id = jsonDecode(gameID);
  //Game game = getGame(id);
  //List<List<int>> card = game.startGame();

  List<List<int>> cards =  [[1,2,3,4,5,6],[7,8,3,9,10,11]];
  return cards;
}

checkIfValid() {
  //return
}

//get amount of symbol requested on card, and returns a new GamdID.
String getNewGame(int symbolsAmount) {
  Game pGame = new Game(symbolsAmount, true);
  pGame.initGame();
  int id = pGame.getGameID();
  runningGames[id] = pGame;
  return jsonEncode(pGame.getGameID());
}

///Gets game id, and returns two cards and the same symbol they have.
String getTurnData(String gameID) {
  Game game = runningGames[jsonDecode(gameID)];
  TwoCardsDTO turnData = game.getTwoCards();
  return jsonEncode(turnData);
}