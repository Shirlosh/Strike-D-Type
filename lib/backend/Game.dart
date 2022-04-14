import 'Card.dart';
import 'dart:math';
class Game{

  int numberOfSymbol=0;
  //The number of symbols on a card has to be a prime number + 1
  int numberOfSymbolsOnCard=4;//(3+1)//we will give the user an list of numbers to choose from.
  int numberOfUniqueCards=0;
  var cards = <Card>[];

  Game(this.cards,this.numberOfSymbolsOnCard)
  {
      //Word out the prime number
      int n = numberOfSymbolsOnCard-1;

      //Total number of cards that can be generated following the Dobble rules.
      numberOfSymbol = pow(n,2) + n + 1;
      numberOfUniqueCards = numberOfSymbol;
  }



}