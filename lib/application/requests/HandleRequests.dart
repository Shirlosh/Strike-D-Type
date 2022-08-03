abstract class HandleRequests
{
  Future<String> createGame(symbolsAmount);
  Future<dynamic> getCards(String gameID);
  Future<bool> isCorrectSymbol(int symbol, String gameID);
}