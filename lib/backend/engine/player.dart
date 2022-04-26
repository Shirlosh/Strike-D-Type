class Player {
  String name;
  int score = 0;

  Player(this.name) {
    score = 0;
  }

  @override
  String toString() {
    String output = "Player $name has $score points";
    return output;
  }
}
