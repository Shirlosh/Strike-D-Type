import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';

import 'HandleRequests.dart';

FirebaseFunctions functions = FirebaseFunctions.instance;

class HandleRequestsOnline extends HandleRequests {

  Future<String> createGame(symbolsAmount) async {
    functions.useFunctionsEmulator('localhost', 5001);
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'createGame');
    final results = await callable.call(<String, dynamic>{
      'symbolsAmount': symbolsAmount,
    });
    return results.data;
  }

  Future<dynamic> getCards(String gameID) async {
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'getCards');
    final results = await callable.call(<String, dynamic>{
      'ID': gameID,
    });

    List<dynamic> listlistString = (jsonDecode(results.data) as List<dynamic>);
    List<List<int>> cards = List.generate(0, (it) => []);
    cards.add(List<int>.from(listlistString[0].map((x) => x)));
    cards.add(List<int>.from(listlistString[1].map((x) => x)));
    return cards;
  }


  Future<bool> isCorrectSymbol(int symbol, String gameID) async {
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'isCorrectSymbol');
    final results = await callable.call(<String, dynamic>{
      'ID': gameID,
      'Symbol': symbol
    });
    return results.data;
  }


}


// Future<void> prepareGameBeforeStart(String gameID) async {
//   FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
//   HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('prepareGameBeforeStart');
//   final results = await callable.call(<String, dynamic> {
//     'ID': gameID,
//   });
//   bool res = results.data;
//   return res;
// }
