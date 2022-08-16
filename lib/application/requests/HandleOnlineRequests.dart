import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'HandleRequests.dart';

FirebaseFunctions functions = FirebaseFunctions.instance;

class HandleRequestsOnline extends HandleRequests {
  HandleRequestsOnline()
  {
    //functions.useFunctionsEmulator('localhost', 5001);
  }

  Future<String> createGame(symbolsAmount) async {

    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'createGame');
    final results = await callable.call(<String, dynamic>{
      'symbolsAmount': symbolsAmount,
      'username' : Username
    });
    return results.data;
  }

  Future<dynamic> getCards() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'getCards');
    final results = await callable.call(<String, dynamic>{
      'ID': GameID,
    });

    List<dynamic> listlistString = (jsonDecode(results.data) as List<dynamic>);
    List<List<int>> cards = List.generate(0, (it) => []);
    cards.add(List<int>.from(listlistString[0].map((x) => x)));
    cards.add(List<int>.from(listlistString[1].map((x) => x)));
    return cards;
  }


  Future<bool> isCorrectSymbol(int symbol) async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('isCorrectSymbol');
    final results = await callable.call(<String, dynamic>{
      'ID': GameID,
      'Symbol': symbol,
      'type': PlayerType
    });
    return results.data;
  }

  Future<void> replayGame() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('replayGame');
    final results = await callable.call(<String, dynamic>{
      'ID': GameID,
    });
    return results.data;
  }
  Future<void> leaveGame() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('leaveGame');
    final results = await callable.call(<String, dynamic>{
      'ID': GameID,
      'type': PlayerType,
      'username': Username
    });
    return results.data;
  }
  Future<bool> joinGame() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('joinGame');
    final results = await callable.call(<String, dynamic>{
      'ID': GameID,
      'username': Username
    });
    return results.data;
  }

  Future<bool> startGame() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('startGame');
    final results = await callable.call(<String, dynamic>{
      'ID': GameID,
    });
    return results.data;
  }

}
