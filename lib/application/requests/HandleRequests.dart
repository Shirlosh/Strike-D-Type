abstract class HandleRequests
{
  Future<String> createGame(symbolsAmount);
  Future<dynamic> getCards();
  //Future<dynamic> getParticipates();
  Future<bool> isCorrectSymbol(int symbol);
}