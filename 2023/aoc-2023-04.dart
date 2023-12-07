void main() {
  // Parse input
  var cards = parseInput(input);
  var total = 0;

  // Part 1
  for (var card in cards) {
    var points = getPoints(card);
    total += points;
  }

  print("Total: $total");

  // Part 2
  // Get points with copies
  var cardCount = getCardCount(cards);

  print("Number of cards: $cardCount");
}

int getPoints(Card card) {
  var points = 0;

  for (var number in card.yourNumbers) {
    if (card.winningNumbers.contains(number)) {
      if (points == 0) {
        points++;
      } else {
        points *= 2;
      }
    }
  }

  return points;
}

int getCardCount(List<Card> cards) {
  // There's a way to do this with recursion, but I'm not gonna

  for (int i = 0; i < cards.length; i++) {
    var newCopies = 0;

    // Loop to get copies from first card
    for (int j = 0; j < cards[i].yourNumbers.length; j++) {
      if (cards[i].winningNumbers.contains(cards[i].yourNumbers[j])) {
        newCopies++;
      }
    }

    // Loop to apply copies value to cards
    for (int j = 1; j <= newCopies; j++) {
      cards[i + j].copies += (1 * cards[i].copies);
    }
  }

  // Return value
  return cards.fold(0, (sum, card) => sum + card.copies);
}

List<Card> parseInput(String input) {
  var cardList = <Card>[];

  var splitData = input.split("\n");

  for (var card in splitData) {
    // Get card number
    var cardNumber = int.parse(card.split(":").first.split(" ").last);

    // Get winning numbers
    var winningNumbers = card
        .split(":")
        .last
        .split("|")
        .first
        .split(" ")
        .map((s) => int.tryParse(s))
        .where((value) => value != null)
        .toList();

    // Get card numbers
    var yourNumbers = card
        .split("|")
        .last
        .split(" ")
        .map((s) => int.tryParse(s))
        .where((value) => value != null)
        .toList();

    cardList.add(new Card(cardNumber, winningNumbers, yourNumbers, 1));
  }

  return cardList;
}

class Card {
  int cardNumber;
  List<int?> winningNumbers;
  List<int?> yourNumbers;
  int copies;

  Card(this.cardNumber, this.winningNumbers, this.yourNumbers, this.copies);
}

var input = '''Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11''';
