import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:strike_d_type/application/requests/HandleOnlineRequests.dart';
import '../../game_page/components/statusBoard/types/PvPType.dart';
import '../Globals.dart';
import 'Mode.dart';

class PvPMode extends Mode
{
  HandleRequestsOnline req;
  PvPType boardType;
  dynamic changeCards;

  PvPMode()
  {
    req = new HandleRequestsOnline();
    boardType = new PvPType();
    //listen to start
  }

  @override
  String mode() { return 'PvP'; }


  @override
  dynamic getStatusBoardContent() {
    return boardType;
  }

  @override
  void setCardChanger(dynamic changeCards)
  {
    this.changeCards = changeCards;
    FirebaseDatabase.instance.ref('games').onChildChanged.listen((event) {
      Map<String, dynamic> values = jsonDecode(event.snapshot.value);
      if(values['id'] == GameID) {
        List<dynamic> listlistString = values['ChosenCards'];
        List<List<int>> cards = List.generate(0, (it) => []);
        cards.add(List<int>.from(listlistString[0].map((x) => x)));
        cards.add(List<int>.from(listlistString[1].map((x) => x)));
        this.changeCards(cards);
      }
    });
  }

  @override
  Future<String> createGame(symbolsAmount) {
    Future<String> id;
    if(PlayerType == 'owner')
      id = req.createGame(symbolsAmount);
    else {
      id = Future<String>.value(GameID);
      //id validation checks already if full
      req.joinGame();
    }

    return id;
  }

  @override
  Future<dynamic> getCards() {
    return req.getCards();
  }

  @override
  Future<bool> isCorrectSymbol(int symbol) {
    return req.isCorrectSymbol(symbol);
  }

  Future<bool> startGame() async {
    Future<bool> res = Future<bool>.value(false);
    if(PlayerType == 'owner')
      res = req.startGame();
    return res;
  }

  @override
  Future<void> leaveGame() async {
    req.leaveGame();
  }

  @override
  Future<void> replayGame() async {
    req.replayGame();
  }
}