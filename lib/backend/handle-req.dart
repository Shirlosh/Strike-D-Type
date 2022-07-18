import 'dart:convert';

import 'package:strike_d_type/backend/engine/game.dart';

import '../dto_objects/TwoCardsDTO.dart';

// Map<int, Game> runningGames = new Map();
Game game;

int createGame(symbolsAmount) {
  game = new Game(symbolsAmount, true);
  return 1; // uuid#
}

List<List<int>> getCards(String gameID, int cardsAmount) {
  List<List<int>> cards =  game.getTwoCards();
  print(cards);
  //List<List<int>> cards = [[1,2,3,4,5,6],[1,2,3,4,5,6]];
  return cards; // return mutual
}
