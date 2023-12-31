void main() {
  var input = '''A Y
B X
C Z''';

  Map<String, int> roundResults1 = <String, int>{};
  roundResults1 = {
    'A X': 1 + 3,
    'A Y': 2 + 6,
    'A Z': 3 + 0,
    'B X': 1 + 0,
    'B Y': 2 + 3,
    'B Z': 3 + 6,
    'C X': 1 + 6,
    'C Y': 2 + 0,
    'C Z': 3 + 3,
  };

  Map<String, int> roundResults2 = <String, int>{};
  roundResults2 = {
    'A X': 3 + 0,
    'A Y': 1 + 3,
    'A Z': 2 + 6,
    'B X': 1 + 0,
    'B Y': 2 + 3,
    'B Z': 3 + 6,
    'C X': 2 + 0,
    'C Y': 3 + 3,
    'C Z': 1 + 6,
  };

  var roundsList = input.split('\n');
  var total = 0;

  for (var round in roundsList) {
    total += roundResults2[round]!;
  }

  print('The final result is: $total');
}
