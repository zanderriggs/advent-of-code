void main() {
  var result1 = 0;
  var lines = input.split('\n');
  var root = Node(
    "/",
  );
  var pointer = root;

  for (var line in lines) {
    if (line.contains('/')) {
      continue;
    } else if (line.startsWith('\$ ls')) {
      continue;
    } else if (line.startsWith('dir')) {
      var parts = line.split(' ');
      var newDir = Node(parts[1], parent: pointer);
      pointer.children.add(newDir);
    } else if (line.startsWith('\$ cd')) {
      var parts = line.split(' ');

      if (parts[2] == '..') {
        pointer = pointer.parent!;
      } else {
        pointer = pointer.children.firstWhere((n) => n.name == parts[2]);
      }
    } else {
      var parts = line.split(' ');
      var newFile =
          Node(parts[1], parent: pointer, fileSize: int.parse(parts[0]));
      pointer.children.add(
        newFile,
      );
    }
  }

  // === Problem 1 ===
  // Get All dirs smaller than 100000
  var allDirs = getAllChildren(root);
  for (var dir in allDirs) {
    var dirSize = dir.getSize();
    if (dirSize <= 100000) {
      result1 += dirSize;
    }
  }

  // === Problem 2 ===
  // Find smallest dir over goal
  var result2 = 0;

  var goal = 30000000 - (70000000 - root.getSize());
  print('Goal: $goal');
  allDirs.sort((a, b) => a.getSize().compareTo(b.getSize()));
  for (var dir in allDirs) {
    var dirSize = dir.getSize();
//     print('${dir.name} : $dirSize');
    if (dirSize >= goal && result2 == 0) {
      print('Assigning value to result2: ${dir.name} : $dirSize');
      result2 = dirSize;
    }
  }

  print('Result for problem 1: $result1');
  print('Result for problem 2: $result2');
}

class Node {
  String name;
  int? fileSize;
  List<Node> children = <Node>[];
  Node? parent;

  bool get isDirectory => fileSize == 0 || fileSize == null;

  Node(this.name, {this.fileSize, this.parent});

  int getSize() => isDirectory ? _childrenDirSizes() : fileSize!;
  int _childrenDirSizes() {
    var size = 0;
    if (isDirectory) {
      for (final child in children) {
        size += child.getSize();
      }
    }
    return size;
  }
}

List<Node> getAllChildren(Node node) {
  var allNodes = <Node>[];

  for (var child in node.children) {
    if (child.isDirectory) {
      allNodes.add(child);
      allNodes.addAll(getAllChildren(child));
    }
  }
  return allNodes;
}

// Input from Problem
var input = '''\$ cd /
\$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
\$ cd a
\$ ls
dir e
29116 f
2557 g
62596 h.lst
\$ cd e
\$ ls
584 i
\$ cd ..
\$ cd ..
\$ cd d
\$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k''';

// var input = '''''';