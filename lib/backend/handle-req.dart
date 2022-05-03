import 'package:strike_d_type/backend/engine/game.dart';

Game game;

void createGame(req, res) {
  int symbolsAmount = 4;

  game = new Game([], symbolsAmount, true);
  //res.game.getid();
}

List<List<int>> getTwoCards(req, res) {
  //int id = req.getid();
  //Game game = getGame(id);

  //List<List<int>> card = game.startGame();
  //return card;
}

checkIfValid() {
  //return
}
