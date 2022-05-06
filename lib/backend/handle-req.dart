import 'dart:convert';

import 'package:strike_d_type/backend/engine/game.dart';

List<Game> runningGames;

String getGameID() {
  int symbolsAmount = 6;
  int id=1;
  runningGames[id] = new Game([], symbolsAmount, true);
  runningGames.elementAt(id).initGame();
  return jsonEncode(1);
}

List<List<int>> getCards(String gameID, int cardsAmount) {
  int id = jsonDecode(gameID);

  Game game = runningGames.elementAt(id);
  //List<List<int>> card = game.startGame();

  List<List<int>> cards =  game.getTwoCards();
  return cards;
}

checkIfValid() {
  //return
}
