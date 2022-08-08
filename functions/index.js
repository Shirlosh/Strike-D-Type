const {v4: uuidv4} = require('uuid');


class Game {
    constructor() {    }

    getGameID() { return this.id; }

    getSameSymbol() { return this.sameSymbolIdx; }

    getScore(){ return this.score; }

    start(){ this.started = true; }

    getChosenCards() { return this.ChosenCards}

    initGame(numberOfSymbolsOnCard, shuffleSymbolsOnCard = false)
    {
        this.numberOfSymbolsOnCard = numberOfSymbolsOnCard
        this.id = uuidv4().substring(0, 7)
        this.score = {'owner': 0, 'joins': 0};

        //The number of symbols on a card has to be a prime number + 1
        this.primeNumber = numberOfSymbolsOnCard - 1;

        this.sameSymbolIdx = null
        this.shuffleSymbolsOnCard = shuffleSymbolsOnCard

        //Total number of cards that can be generated following the rules.
        this.numberOfCards = Math.pow(this.primeNumber, 2) + this.primeNumber + 1;
        this.cardsOfCards = []
        this.started = false;
        this.createCards();
        this.generateTwoCards();
    }

    initGameWithJson(json)
    {
        this.numberOfSymbolsOnCard = json['numberOfSymbolsOnCard']
        this.primeNumber = json['primeNumber']
        this.started = json['started']
        this.id = json['id']
        this.score = json['score']
        this.ChosenCards = json['ChosenCards']
        this.sameSymbolIdx = json['sameSymbolIdx']
        this.shuffleSymbolsOnCard = json['shuffleSymbolsOnCard']
        this.numberOfCards = json['numberOfCards']
        this.cardsOfCards = json['cardsOfCards']

    }

    createCards() {
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
            this.cardsOfCards.forEach((set) => set.sort(() => Math.random() - 0.5))
    }


    generateTwoCards() {
        let n1 = 1, n2 = 1

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
        this.ChosenCards = chosenCards;
        return chosenCards;
    }

}

const functions = require("firebase-functions");
// The Firebase Admin SDK to access Firestore.
const admin = require("firebase-admin");
// path to local admin key file
const serviceAccount = require("./strike-d-type-firebase-adminsdk-n2nzn-8f7d527fda.json");


admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://strike-d-type-default-rtdb.firebaseio.com"
});

const db = admin.database();
const gamesRef = db.ref('games');


// to upload file to firebase: firebase deploy --only functions
// when start run emulators: firebase emulators:start


exports.isCorrectSymbol = functions.https.onCall(async (data, context) => {
    let gameRef = await gamesRef.child(data.ID).get()
    let game = new Game()
    let ret = false;
    game.initGameWithJson(JSON.parse(gameRef.val()))
    if(game.getSameSymbol() === data.Symbol)
    {
        game.score[data.type] = game.score[data.type] + 1
        ret = true
    }
    else
    {
        game.score[data.type] = game.score[data.type] - 1
    }
    game.generateTwoCards()
    gamesRef.child(game.getGameID()).set(JSON.stringify(game))
    return ret
});

exports.getCards = functions.https.onCall(async (data, context) => {
    let ID = data.ID
    let gameRef = await gamesRef.child(ID).get()
    let game = new Game()
    game.initGameWithJson(JSON.parse(gameRef.val()))
    let ret = JSON.stringify(game.getChosenCards())
    return ret
});


exports.createGame = functions.https.onCall(async(data, context) => {
    let symbolsAmount = data.symbolsAmount
    let game = new Game()
    game.initGame(symbolsAmount, true)
    gamesRef.child(game.getGameID()).set(JSON.stringify(game));
    return game.getGameID();
});


