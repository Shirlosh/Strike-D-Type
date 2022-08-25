import 'package:strike_d_type/application/requests/HandleLocalRequests.dart';
import '../../game_page/components/statusBoard/types/TimerType.dart';
import 'package:strike_d_type/application/modes/Mode.dart';

class TimerMode extends Mode {
  HandleRequestsLocal req;
  TimerType boardType;
  dynamic changeCards;

  TimerMode() {
    req = HandleRequestsLocal();
    boardType = TimerType();
  }

  @override
  String mode() {
    return 'Timer';
  }

  @override
  dynamic getStatusBoardContent() {
    return boardType;
  }

  @override
  void setCardChanger(dynamic changeCards) {
    this.changeCards = changeCards;
  }

  @override
  Future<String> createGame(symbolsAmount) {
    return req.createGame(symbolsAmount);
  }

  @override
  Future<dynamic> getCards() {
    return req.getCards();
  }

  @override
  Future<bool> isCorrectSymbol(int symbol) {
    Future<bool> ans = req.isCorrectSymbol(symbol);
    req.getCards().then((value) => this.changeCards(value));

    return ans;
  }

  @override
  Future<bool> startGame() {
    return Future<bool>.value(true);
  }

  @override
  Future<void> leaveGame() {}

  @override
  Future<void> replayGame() {}

  @override
  void listenOnParticipates(usersList) {
  }

}
