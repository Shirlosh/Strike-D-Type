abstract class HandleRequests
{
  Future<String> createGame(symbolsAmount);
  Future<dynamic> getCards();
  Future<bool> isCorrectSymbol(int symbol);
}