void main() {
  var input = '''vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw''';

  var inputList = input.split('\n');

  var priorityTotal = 0;

  for (var input in inputList) {
    var splitString = splitStringInHalf(input);
    var commonLetter = findCommonLetter(splitString);
    var priority = getPriority(commonLetter);
    print('Priority of letter $commonLetter: $priority');
    priorityTotal = priorityTotal + priority;
  }

  print('Total priority: $priorityTotal');
}

////
List<String> splitStringInHalf(String stringToSplit) {
  var string1 = stringToSplit.substring(0, (stringToSplit.length / 2).floor());
  var string2 = stringToSplit.substring(
      (stringToSplit.length / 2).floor(), stringToSplit.length);
  List<String> splitStringList = [string1, string2];
  return splitStringList;
}

////
String findCommonLetter(List<String> compartments) {
  //compare strings
  Map<String, int> dictionary = <String, int>{};

  for (var char in compartments.first.split('')) {
    if (!dictionary.containsKey(char)) {
      dictionary[char] = 1;
    }
  }

  for (var char in compartments.last.split('')) {
    if (dictionary.containsKey(char)) {
      return char;
    }
  }
  return '';
}

////
int getPriority(String item) {
  //search map for the given item and return the value
  int priority = itemPriority[item]!;

  return priority;
}

Map<String, int> itemPriority = {
  'a': 1,
  'b': 2,
  'c': 3,
  'd': 4,
  'e': 5,
  'f': 6,
  'g': 7,
  'h': 8,
  'i': 9,
  'j': 10,
  'k': 11,
  'l': 12,
  'm': 13,
  'n': 14,
  'o': 15,
  'p': 16,
  'q': 17,
  'r': 18,
  's': 19,
  't': 20,
  'u': 21,
  'v': 22,
  'w': 23,
  'x': 24,
  'y': 25,
  'z': 26,
  'A': 27,
  'B': 28,
  'C': 29,
  'D': 30,
  'E': 31,
  'F': 32,
  'G': 33,
  'H': 34,
  'I': 35,
  'J': 36,
  'K': 37,
  'L': 38,
  'M': 39,
  'N': 40,
  'O': 41,
  'P': 42,
  'Q': 43,
  'R': 44,
  'S': 45,
  'T': 46,
  'U': 47,
  'V': 48,
  'W': 49,
  'X': 50,
  'Y': 51,
  'Z': 52,
};
