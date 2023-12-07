void main () {
    // Part 1
    var times = input.split("\n").first.split(" ").where((item) => int.tryParse(item) != null).toList().map(int.parse).toList();
    var distances = input.split("\n").last.split(" ").where((item) => int.tryParse(item) != null).toList().map(int.parse).toList();

    var timeSum = calclateTimeValues(times, distances);

    print("Time: $times");
    print("Distance: $distances");
    print("Result: $timeSum");

    // Part 2
    var timeTotal = [int.parse(times.fold("", (previousValue, nextValue) => "$previousValue$nextValue"))];
    var distanceTotal = [int.parse(distances.fold("", (previousValue, nextValue) => "$previousValue$nextValue"))];
    var timeSum2 = calclateTimeValues(timeTotal, distanceTotal);
    
    print("Part 2 Result: $timeSum2");
}

int calclateTimeValues(List<int> times, List<int> distances) {
  // calculate best times and multiply them together
  var timeSum = <int>[];

  for (int i = 0; i < times.length; i++) {
    int numberOfWaysToBeatTheRecord = 0;

    for (int j = 0; j < times[i]; j++)
    {
      // calculate distances
      var totalDistance = (times[i] - j) * j;
      //if beats record
      if (totalDistance > distances[i])
      {
        // increment numberOfWaysToBeatTheRecord
        numberOfWaysToBeatTheRecord++;
      }
        
    }
    timeSum.add(numberOfWaysToBeatTheRecord);
  }

  print(timeSum);
  return timeSum.reduce((value, element) => value * element);
}

// var input = '''Time:      7  15   30
// Distance:  9  40  200''';

var input = '''Time:        60     80     86     76
Distance:   601   1163   1559   1300''';
