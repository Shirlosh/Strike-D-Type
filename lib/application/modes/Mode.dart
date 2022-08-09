import '../requests/HandleRequests.dart';

abstract class Mode
{
  String mode();
  dynamic getStatusBoardContent();
  void setCardChanger(dynamic changeCards);
  Future<String> createGame(symbolsAmount);
  Future<dynamic> getCards();
  Future<bool> isCorrectSymbol(int symbol);
  Future<bool> startGame();
  Future<void> leaveGame();
  Future<void> replayGame();
}