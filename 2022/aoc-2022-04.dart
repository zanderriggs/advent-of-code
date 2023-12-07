void main() {
  var input = '''2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8''';

  var pairs = input.split('\n');

  var overlappingPairs = 0;

  for (var pair in pairs) {
    if (pairsOverlap(pair.split(','))) {
      overlappingPairs = overlappingPairs + 1;
    }
  }

  print('There are $overlappingPairs operlapping pairs.');
}

bool pairsOverlap(List<String> pairs) {
  var firstPair = pairs[0].split('-');
  var secondPair = pairs[1].split('-');

  // compare pair 1 to pair 2
  if (int.parse(firstPair[0]) >= int.parse(secondPair[0]) &&
      int.parse(firstPair[1]) <= int.parse(secondPair[1])) {
    // pair 2 contains pair 1
    return true;
  }

  if (int.parse(secondPair[0]) >= int.parse(firstPair[0]) &&
      int.parse(secondPair[1]) <= int.parse(firstPair[1])) {
    // pair 1 contains pair 2
    return true;
  }

  // Else, pairs to not entirely overlap
  return false;
}
