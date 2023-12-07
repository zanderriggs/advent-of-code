void main() {
  var returnSum = 0;
  var list = parseInput(input);

  list.forEach((item) {
    // check hands for invalid
    var validHands = checkLimits(item.hands);
    // if hands are valid, add id to returnSum, else don't
    if (validHands) {
      returnSum += item.id;
    }
  });

  // check list for valid hands
  print("Sum of valid game Ids: $returnSum");
}

List<GameData> parseInput(String input) {
  var listOfGameData = <GameData>[];

  var splitInput = input.split("\n");

  splitInput.forEach((string) {
    listOfGameData.add(new GameData(getIdFromGame(string), getSamples(string)));
  });

  return listOfGameData;
}

bool checkLimits(List<String> data) {
  int redLimit = 12;
  int greenLimit = 13;
  int blueLimit = 14;
  bool allHandsValid = true;
  int redCount = 0, greenCount = 0, blueCount = 0;

  data.forEach((set) {
    var hands = set.split(',');

    hands.forEach((hand) {
      if (hand.endsWith("red")) {
        redCount = int.parse(hand.trim().split(' ').first);
      }
      if (hand.endsWith("green")) {
        greenCount = int.parse(hand.trim().split(' ').first);
      }
      if (hand.endsWith("blue")) {
        blueCount = int.parse(hand.trim().split(' ').first);
      }
    });

    if (redCount > redLimit ||
        greenCount > greenLimit ||
        blueCount > blueLimit) {
      allHandsValid = false;
    }
  });

  return allHandsValid;
}

class GameData {
  int id;
  List<String> hands;

  GameData(
    this.id,
    this.hands,
  );
}

int getIdFromGame(String input) {
  return int.parse(input.split(":").first.split(" ")[1]);
}

List<String> getSamples(String input) {
  return input.split(":")[1].split(";").toList();
}

var input = '''Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green''';
