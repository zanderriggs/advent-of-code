/* 
 * Problem input comprised of:
 *  - visualization of cargo stacks
 *  - instructions for re-arranging the stack
 * 
 */
var input = '''    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2''';

void main() {
  // === THE PARSING === //
  // Take input and separate into Cargo and Instructions
  var splitInput = input.split('\n\n');
  var cargoString = splitInput[0];
  //var instructionString = splitInput[1];

  // Parse cargo and convert to object
  // var cargo = Cargo(parseCargoInput(cargoString));
  var testList = parseCargoInput(cargoString);

//   final crates = List<Stacks<String>>.empty(growable:true);

  // === THE SORTING === //
  // This is how we'll follow the re-stacking instructions
  var testStack = <String>[];

  // 'add' simulates adding something to the top of a stack
  testStack.add('one');
  testStack.add('two');
  testStack.add('three');
  testStack.add('four');

  // 'removeLast' simulates taking the top item off a stack
  testStack.removeLast();
  testStack.removeLast();
  testStack.add('5');

  // 'last' simulates getting the 'top' item in a stack
  // print(testStack.last);

  var cargoMap = <String, List<String>>{
    '1': ['Z', 'N']
  };

//   print(cargoMap);
}

class Stack<T> {
  final _cargoList = <T>[];

  void push(T value) => _cargoList.add(value);

  T pop() => _cargoList.removeLast();

  T get peek => _cargoList.last;

  bool get isEmpty => _cargoList.isEmpty;
  bool get isNotEmpty => _cargoList.isNotEmpty;

  @override
  String toString() => _cargoList.toString();
}

List<String> parseCargoInput(String input) {
  // Split cargo string and invert list for Cargo object constructor

  var splitReversedCargo = input.split('\n').reversed.toList();

  return splitReversedCargo;
}

class Cargo {
  Map<int, List<String>> cargo = <int, List<String>>{
    0: ['']
  };

  Cargo(List<String> input) {
    var indexer = input[0];
    input.removeAt(0);

    cargo = generateCargoFromInput(indexer, input);
  }

  Map<int, List<String>> generateCargoFromInput(
      String indexer, List<String> input) {
    // Return this map:
    var cargoMap = <int, List<String>>{};

    // Get indexers
    var indexers = indexer.split(' ');
    indexers.removeWhere((x) => x == '');
    print('Indexers: $indexers');

    // Get cargo
//     var firstList = input[0].replaceAll(RegExp(r'[^A-Z ]'),'').split(' ');
//     print('First list: $firstList');

    for (var list in input) {
      var cleanedList = list.replaceAll(RegExp(r'[^A-Z ]'), '').split(' ');
      for (int i = 0; i < cleanedList.length; i++) {
        if (i > 0 && cleanedList[i] == '' && cleanedList[i - 1] == '') {
          cleanedList.removeAt(i);
        }
      }
      print(cleanedList);
    }

    // grab every fourth char

    return cargoMap;
  }
}

class Moves {
  final int quantity;
  final int from;
  final int to;

  Moves(this.quantity, this.from, this.to);
}
