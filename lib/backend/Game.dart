import 'dart:math';

class Game {
  //The number of symbols on a card has to be a prime number + 1
  int primeNumber;
  int numberOfSymbolsOnCard =
  4; //(3+1)//we will give the user an list of numbers to choose from.
  num numberOfCards = 0;

  List<List<int>> cardsOfCards;

  bool shuffleSymbolsOnCard = false;
  var symbols = <String>[];

  Game(this.symbols, this.numberOfSymbolsOnCard, this.shuffleSymbolsOnCard) {
    //Word out the prime number
    primeNumber = numberOfSymbolsOnCard - 1;

    //Total number of cards that can be generated following the Dobble rules.
    numberOfCards = pow(primeNumber, 2) + primeNumber + 1;
    cardsOfCards = List.generate(0, (it) => []);
    initGame();
  }

  void initGame() {
    //Add first set of primeNumber+1 cards (e.g. 8 cards)
    for (int i = 0; i < numberOfSymbolsOnCard; i++) {
      //Add new card with first symbol
      List<int> newList = [1];
      cardsOfCards.add(newList);
      //Add primeNumber+1 symbols on the card (e.g. 8 symbols)
      for (int j = 0; j < primeNumber; j++) {
        cardsOfCards[i].add((j + 1) + (i * primeNumber) + 1);
      }
    }

    //Add primeNumber sets of primeNumber cards
    for (int i = 0; i < primeNumber; i++) {
      for (int j = 0; j < primeNumber; j++) {
        //Append a new card with 1 symbol
        List<int> newList = [i + 2];
        cardsOfCards.add(newList);
        //Add numberOfSymbolsOnCard symbols on the card (e.g. 8 symbols)
        for (int k = 0; k < primeNumber; k++) {
          var val =
              (primeNumber + 1 + primeNumber * k + (i * k + j) % primeNumber) +
                  1;
          cardsOfCards[cardsOfCards.length - 1].add(val);
        }
      }
    }

    if (shuffleSymbolsOnCard) {
      for (var setOfCards in cardsOfCards) {
        setOfCards.shuffle();
      }
    }
  }

  @override
  String toString() {
    var output = StringBuffer();
    var cardsOutput = StringBuffer();

    output.write("primeNumber = $primeNumber\n"
        "numberOfSymbolsOnCard = $numberOfSymbolsOnCard\n"
        "numberOfUniqueCards = $numberOfCards\n"
        "shuffleSymbolsOnCard=$shuffleSymbolsOnCard\n");

    //Output all cards
    int i = 0;
    for (var card in cardsOfCards) {
      i += 1;
      cardsOutput.write("$i -[");
      for (var number in card) {
        cardsOutput.write("${symbols[number - 1]} ,");
      }
      cardsOutput.write(']\n');
    }

    output.write("\n\nThe set of Cards:\n$cardsOutput");

    String dataToPrint = output.toString();
    return dataToPrint;
  }
}
