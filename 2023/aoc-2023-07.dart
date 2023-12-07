void main() {
  var totalWinnings = 0;
  var hands = <Hand>[];
  var inputLines = input.split('\n');

  // Evaluate hands
  for (var line in inputLines) {
    var parts = line.split(' ');
    hands.add(new Hand(
      evaluateCardHand(parts.first),
      parts.first,
      int.parse(parts.last),
    ));
  }

  // Order hands by value
  var orderedHands = rankHands(hands);

  // Multiply
  for (var i = 0; i < orderedHands.length; i++) {
    print("Multiplying ${orderedHands[i].bet} by ${i + 1}");
    totalWinnings += orderedHands[i].bet * (i + 1);
  }

  print("Total Winnings $totalWinnings");
}

List<Hand> rankHands(List<Hand> hands) {
  hands.sort((a, b) {
    var valueCompare = a.handValue.index.compareTo(b.handValue.index);
    if (valueCompare != 0) return valueCompare;

    for (int i = 0; i < a.cards.length; i++) {
      print("Comparing ${a.cards[i]} with ${b.cards[i]}");
      var aValue = cardValue[a.cards[i]];
      var bValue = cardValue[b.cards[i]];
      print("aValue: $aValue, bValue: $bValue");
      if (aValue != bValue) {
        return aValue!.compareTo(bValue ?? 0);
      }
    }
    // Else, values are equal
    return 0;
  });

  return hands;
}

handValue evaluateCardHand(String hand) {
  var cards = hand.split('');

  // Check for five of a kind
  var fiveOfAKind =
      cards.where((card) => cards.where((e) => e == card).length == 5).length ==
          5;
  if (fiveOfAKind) return handValue.fiveOfAKind;

  // Check for four of a kind
  var fourOfAKind =
      cards.where((card) => cards.where((e) => e == card).length == 4).length ==
          4;
  if (fourOfAKind) return handValue.fourOfAKind;

  // Check for full house
  var threeOfAKind =
      cards.where((card) => cards.where((e) => e == card).length == 3).length ==
          3;
  var twoOfAKind =
      cards.where((card) => cards.where((e) => e == card).length == 2).length ==
          2;
  if (threeOfAKind && twoOfAKind) return handValue.fullHouse;

  // Check for three of a kind
  if (threeOfAKind) return handValue.threeOfAKind;

  // Check for two pairs
  var pairs =
      cards.where((card) => cards.where((e) => e == card).length == 2).length;
  if (pairs == 4) return handValue.twoPair;

  // Check for one pair
  if (pairs == 2) return handValue.onePair;

  // High card
  return handValue.highCard;
}

var cardValue = {
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  'T': 10,
  'J': 11,
  'Q': 12,
  'K': 13,
  'A': 14
};

enum handValue {
  highCard,
  onePair,
  twoPair,
  threeOfAKind,
  fullHouse,
  fourOfAKind,
  fiveOfAKind
}

class Hand {
  Enum handValue;
  String cards;
  int bet;

  Hand(this.handValue, this.cards, this.bet);
}

var input = '''32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483''';
