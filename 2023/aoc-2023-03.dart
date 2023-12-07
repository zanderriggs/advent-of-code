main() {
  var rows = input.split('\n');
  var sum = 0;

  for (int i = 0; i < rows.length; i++) {
    var currentRow = rows[i];
    var regex = new RegExp(r'\d+');

    regex.allMatches(currentRow).forEach((match) {
      // Get data from rows
      var numberString = match.group(0).toString();

      var value = int.parse(numberString);
      var startingIndex = currentRow.indexOf(RegExp(numberString));
      var endingIndex = startingIndex + numberString.length - 1;

      // Search for values
      var searchIndexes = GetIndexesToSearch(
          startingIndex, endingIndex, i, rows.length, currentRow.length);

      var isNearSpecial = IsNearSpecialCharacter(searchIndexes, rows);

      // Add to total
      if (isNearSpecial) {
        sum += value;
      }
    });
  }

  // Output total
  print("Total: $sum");
}

List<Point> GetIndexesToSearch(int startingIndex, int endingIndex, int rowIndex,
    int rowCount, int columnCount) {
  var searchIndexes = <Point>[];

  for (int i = rowIndex - 1; i < rowIndex + 2; i++) {
    for (int j = startingIndex - 1; j <= endingIndex + 1; j++) {
      searchIndexes.add(Point(i, j));
    }
  }

  return searchIndexes
      .where((point) =>
          point.row >= 0 &&
          point.row < rowCount &&
          point.col >= 0 &&
          point.col < columnCount)
      .toList();
}

bool IsNearSpecialCharacter(List<Point> indexesToSearch, List<String> rows) {
  for (var index in indexesToSearch) {
    // print("Row: ${index.row}");
    // print("Col: ${index.col}");
    var char = rows[index.row][index.col];
    if (int.tryParse(char) == null && char != ".") {
      return true;
    }
  }

  return false;
}

class Point {
  int row = 0;
  int col = 0;
  Point(int row, int col) {
    this.row = row;
    this.col = col;
  }
}

var input = '''467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...\$.*....
.664.598..''';
