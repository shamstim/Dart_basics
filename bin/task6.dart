import 'dart:math';

void main(List<String> args) {
  // Модуль 2. Задание 6. Вычисление площади треугольника по координатам вершин

  // Получение расстояния до точки
  var point1 = Point(5, 15, 25);
  var point2 = Point(0, 9, 43);
  var point3 = Point(24, 12, 8);

  print(point1.distanceTo(point2));

  // Получение площади треугольника
  var triangle = Triangle([point1, point2, point3]);
  print(triangle.getSquare());
}

class Point {
  int x;
  int y;
  int z;

  Point(this.x, this.y, this.z);

  double distanceTo(Point point) {
    var _distance = sqrt(
        pow((point.x - x), 2) + pow((point.y - y), 2) + pow((point.z - z), 2));

    return _distance;
  }
}

class Triangle {
  List<Point> coord = [];

  Triangle(this.coord);

  double getSquare() {
    Point a = coord[0];
    Point b = coord[1];
    Point c = coord[2];

    var distance1 = a.distanceTo(b);
    var distance2 = b.distanceTo(c);
    var distance3 = c.distanceTo(a);

    return getSquareTriangle(distance1, distance2, distance3);
  }
}

double getSquareTriangle(double length1, double length2, double length3) {
  var perimetr = (length1 + length2 + length3) / 2;

  var square = sqrt(perimetr *
      (perimetr - length1) *
      (perimetr - length2) *
      (perimetr - length3));

  return square;
}
