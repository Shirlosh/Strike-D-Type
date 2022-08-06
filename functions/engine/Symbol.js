class Symbol{
  constructor(pathToSymbolPic, name) {
    this.counter = 0;
    this.id = ++this.counter
    this.name = name
    this.pathToSymbolPic = pathToSymbolPic
  }

  get id() {
    return this.id;
  }
}