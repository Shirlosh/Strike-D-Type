import '../requests/HandleRequests.dart';

abstract class Mode
{
  String mode();
  //HandleRequests getRequest();
  dynamic getStatusBoardContent();
  void setCardChanger(dynamic changeCards);
  Future<String> createGame(symbolsAmount);
  Future<dynamic> getCards();
  Future<bool> isCorrectSymbol(int symbol);
}