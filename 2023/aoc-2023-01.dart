void main() {
  // parse string
  var numberList = input.split("\n");

  var wordToNumber = {
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
  };

  var total = 0;
  numberList.forEach((item) {
    RegExp regex = RegExp(r'\d|one|two|three|four|five|six|seven|eight|nine');

    var first = "";
    var last = "";

    // Loops brother
    for (int i = 0; i < item.length; i++) {
      if (first == "") {
        first = regex
            .firstMatch(item.substring(i, item.length))!
            .group(0)
            .toString();
      }

      if (regex.firstMatch(item.substring(i, item.length)) != null) {
        last = regex
            .firstMatch(item.substring(i, item.length))!
            .group(0)
            .toString();
      }
    }

    // if string is longer than one character, get numberic value from wordToNumber dictionary
    if (first.length > 1) {
      first = wordToNumber[first]!;
    }

    if (last.length > 1) {
      last = wordToNumber[last]!;
    }

    print("First number from loop: $first");
    print("Last number from loop: $last");
    print("Number from loop: $first$last");
    total += int.parse("$first$last");
  });
  print("The total is: $total");
}

var input = '''two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen''';
