class Card{
  static int _counter=0;
  int _id;
  final String pathToSymbolPic;//path for picture
  String name;

  Card(this.pathToSymbolPic,this.name){
    _id=++_counter;
  }

  int get id{
    return _id;
  }
}