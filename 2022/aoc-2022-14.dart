import 'dart:math';

void main() {
  Set<Point> space = {};
  var sandStart = Point(500, 0);
  var count = 0;

  Point minPoint() {
    return Point(
      space.map((e) => e.x).reduce((a, b) => min(a, b)),
      space.map((e) => e.y).reduce(min),
    );
  }

  Point maxPoint() {
    return Point(
      space.map((e) => e.x).reduce(max),
      space.map((e) => e.y).reduce(max),
    );
  }

  void drawSpace() {
    final min = minPoint();
    final max = maxPoint();
    final spaceString = StringBuffer();
    for (var y = min.y; y <= max.y; y++) {
      String line = '${y.toString().padLeft(3, "0")} ';
      for (var x = min.x; x <= max.x; x++) {
        if (space.contains(Point(x, y))) {
          line += "#";
        } else {
          line += ".";
        }
      }
      spaceString.writeln(line);
    }
    print(spaceString.toString());
  }

  void addPoints(Point from, Point to) {
    print('$from $to');
    if (from.x == to.x) {
      for (var y = from.y;
          from.y < to.y ? y <= to.y : y >= to.y;
          from.y > to.y ? y-- : y++) {
        space.add(Point(from.x, y));
      }
    }
    if (from.y == to.y) {
      for (var x = from.x;
          from.x < to.x ? x <= to.x : x >= to.x;
          from.x > to.x ? x-- : x++) {
        space.add(Point(x, from.y));
      }
    }
  }

  final formations = input
      .split("\n")
      .map((e) => e.split(" -> "))
      .map((e) => e.map((e) => e.split(",").map(int.parse).toList()))
      .map((e) => e.map((e) => Point(e[0], e[1])))
      .map((e) => e.toList())
      .toList();

  for (final f in formations) {
    for (var i = 0; i < f.length - 1; i++) {
      addPoints(f[i], f[i + 1]);
    }
  }

  Point? dropSand(Point p) {
    // return the point if we come to rest (to add to space)
    // return null if we've hit an "end" condition
    // recurse if we need to "keep falling"
    // end condition?
    // should return null if outside the established "space"
    if (p.y > maxPoint().y) {
      return null;
    }

    // look below, if clear drop down
    if (!space.contains(Point(p.x, p.y + 1))) {
      return dropSand(Point(p.x, p.y + 1));
    }

    // if not clear, look left, if clear, drop left
    if (!space.contains(Point(p.x - 1, p.y + 1))) {
      return dropSand(Point(p.x - 1, p.y + 1));
    }

    // if not clear, look right, if clear, drop right
    if (!space.contains(Point(p.x + 1, p.y + 1))) {
      return dropSand(Point(p.x + 1, p.y + 1));
    }

    // we're stuck - rest here
    return p;
  }

  print('min: ${minPoint()}');
  print('min: ${maxPoint()}');
  addPoints(Point(minPoint().x - 50, maxPoint().y + 2),
      Point(maxPoint().x + 50, maxPoint().y + 2));
  print('min: ${minPoint()}');
  print('min: ${maxPoint()}');

  while (!space.contains(sandStart)) {
    space.add(dropSand(sandStart) ?? sandStart);
    if (!space.contains(sandStart)) {
      count += 1;
    }
  }

  print('Total sand dropped: $count');

  drawSpace();
}

var input = '''498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9''';
