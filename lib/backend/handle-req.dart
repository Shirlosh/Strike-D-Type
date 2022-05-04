import 'dart:convert';

import 'package:strike_d_type/backend/engine/game.dart';

Game game;

String getGameID() {
  int symbolsAmount = 6;
  game = new Game([], symbolsAmount, true);

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
