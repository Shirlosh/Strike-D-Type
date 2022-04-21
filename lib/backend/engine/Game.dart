import 'dart:math';
import 'Player.dart';
import 'Card.dart';

class Game {
  //The number of symbols on a card has to be a prime number + 1
  late int primeNumber;
  int numberOfSymbolsOnCard =
  4; //(3+1)//we will give the user an list of numbers to choose from.
  num numberOfCards = 0;
  late List<List<int>> cardsOfCards;
  bool shuffleSymbolsOnCard = false;
  var symbols = <String>[];

  late Player _player1;
  Player? _player2;

  Game(this.symbols, this.numberOfSymbolsOnCard, this.shuffleSymbolsOnCard,
      String name1, String name2) {
    //Word out the prime number
    primeNumber = numberOfSymbolsOnCard - 1;

    //Total number of cards that can be generated following the Dobble rules.
    numberOfCards = pow(primeNumber, 2) + primeNumber + 1;
    cardsOfCards = List.generate(0, (it) => []);

    _player1 = new Player(name1);
    if (name2.isNotEmpty) {
      _player2 = new Player(name2);
    }
    initGame();
  }

  void StartGame() {
    List<int> card1;
    List<int> card2;
    final random = new Random();
    int n1 = 1, n2 = 1;
    // generate a random index based on the list length
    while (n1 == n2) {
      n1 = random.nextInt(cardsOfCards.length);
      n2 = random.nextInt(cardsOfCards.length);
    }

    var card1Str = StringBuffer("Card1: ");
    var card2Str = StringBuffer("Card2: ");

    List<List<int>> chosenCards = List.generate(0, (it) => []);
    chosenCards.add(cardsOfCards[n1]);
    chosenCards.add(cardsOfCards[n2]);

    final sameSymbolIdx = chosenCards.fold<Set>(
        chosenCards.first.toSet(), (a, b) => a.intersection(b.toSet()));

    if(sameSymbolIdx.length>1)
    {
      throw Exception("There is bug in this game!!");
    }
    printCard(card1Str, chosenCards[0]);
    printCard(card2Str, chosenCards[1]);

    print(card1Str);
    print(card2Str);

    print("sameSymbol is \"${symbols[sameSymbolIdx.single-1]}\".");
  }

  printCard(StringBuffer sb, List<int> card) {
    for (var number in card) {
      sb.write("${symbols[number - 1]}, ");
    }
  }

  String? getPlayer1Name() {
    return _player1.name;
  }

  String? getPlayer2Name() {
    return _player2?.name;
  }

  int? getPlayer1Score() {
    return _player1.score;
  }

  int? getPlayer2Score() {
    return _player2?.score;
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
        "shuffleSymbolsOnCard=$shuffleSymbolsOnCard\n"
        "Players: \n $_player1 \n $_player2.");

    //Output all cards
    int i = 0;
    for (var card in cardsOfCards) {
      i += 1;
      cardsOutput.write("$i -[");
      for (var number in card) {
        cardsOutput.write("${symbols[number - 1]}, ");
      }
      cardsOutput.write(']\n');
    }

    output.write("\n\nThe set of Cards:\n$cardsOutput");

    String dataToPrint = output.toString();
    return dataToPrint;
  }
}
