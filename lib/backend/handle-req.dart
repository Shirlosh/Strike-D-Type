import 'package:strike_d_type/backend/engine/game.dart';

Game game;

void Create_Game(req,res)
{
  String name1 = "player1";
  String name2 = "player2";
  int symbols_amount = 6;

  game = new Game([], symbols_amount, true, name1, name2);
  //res.game.getid();
}

List<List<int>> Get_2_card(req,res)
{
  //int id = req.getid();
  //Game game = getGame(id);

  //List<List<int>> card = game.startGame();
  //return card;
}


check_if_valid()
{
  //return
}

