class Symbol{
  static int _counter=0;
   int _id;
  String pathToSymbolPic;//path for picture
  String name;

  Symbol(this.pathToSymbolPic,this.name){
    _id=++_counter;
  }

  int get id{
    return _id;
  }
}