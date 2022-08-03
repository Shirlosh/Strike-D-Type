const { v4: uuidv4 } = require('uuid');


export class Game {
  constructor(numberOfSymbolsOnCard, shuffleSymbolsOnCard = false) {
    this.numberOfSymbolsOnCard = numberOfSymbolsOnCard
    this.id = uuidv4().substring(0,7)

    //The number of symbols on a card has to be a prime number + 1
    this.primeNumber = numberOfSymbolsOnCard - 1;

    this.sameSymbolIdx = null
    this.numberOfCards = 0
    this.shuffleSymbolsOnCard = shuffleSymbolsOnCard
    this.symbols = []

    //Total number of cards that can be generated following the Dobble rules.
    this.numberOfCards = Math.pow(this.primeNumber, 2) + this.primeNumber + 1;
    this.cardsOfCards = []

  }

  getGameID() {
    return this.id;
  }

  getSameSymbol()
  {
    return this.sameSymbolIdx;
  }

  initGame() {
    //Add first set of primeNumber+1 cards (e.g. 8 cards)
    for (let i = 0; i < this.numberOfSymbolsOnCard; i++) {
      //Add new card with first symbol
      let newList = [1];
      this.cardsOfCards.push(newList);
      //Add primeNumber+1 symbols on the card (e.g. 8 symbols)
      for (let j = 0; j < this.primeNumber; j++) {
        this.cardsOfCards[i].push((j + 1) + (i * this.primeNumber) + 1);
      }
    }

    //Add primeNumber sets of primeNumber cards
    for (let i = 0; i < this.primeNumber; i++) {
      for (let j = 0; j < this.primeNumber; j++) {
        //Append a new card with 1 symbol
        let newList = [i + 2];
        this.cardsOfCards.push(newList);
        //Add numberOfSymbolsOnCard symbols on the card (e.g. 8 symbols)
        for (let k = 0; k < this.primeNumber; k++) {
          let val = (this.primeNumber + 1 + this.primeNumber * k + (i * k + j) % this.primeNumber) + 1;
          this.cardsOfCards[this.cardsOfCards.length - 1].push(val);
        }
      }
    }

    if (this.shuffleSymbolsOnCard)
      this.cardsOfCards.forEach( (set)=>set.sort(() => Math.random() - 0.5) )
  }



  getTwoCards() {
    let n1 = 1, n2=1

    // generate a random index based on the list length
    while (n1 === n2) {
      n1 = Math.floor(Math.random() * this.cardsOfCards.length)
      n2 = Math.floor(Math.random() * this.cardsOfCards.length)
    }

    let chosenCards = []
    chosenCards.push(this.cardsOfCards[n1]);
    chosenCards.push(this.cardsOfCards[n2]);

    const intersection = chosenCards[0].filter(x => chosenCards[1].includes(x));

    if (intersection.length > 1) {
      throw new Error("There is bug in this game!!")
    }
    this.sameSymbolIdx = intersection[0];
    return chosenCards;
  }
}