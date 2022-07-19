import 'dart:convert';

class TwoCardsDTO {
  //now it works.. but we need it to be List<List<int>>...
  List<dynamic> cards;
  int sameSymbol;

  TwoCardsDTO(this.cards, this.sameSymbol);

  TwoCardsDTO.fromJson(Map<String, dynamic> json)
      : cards = json['cards'],
        sameSymbol = json['sameSymbol'];

  Map<String, dynamic> toJson() {
    return {
      'cards': cards,
      'sameSymbol': sameSymbol,
    };
  }

  @override
  String toString() {
    var output = StringBuffer();


    output.write("cards = $cards\n"
        "sameSymbol = $sameSymbol\n");

    return output.toString();
  }
}