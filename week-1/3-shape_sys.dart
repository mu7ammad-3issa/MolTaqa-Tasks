import 'dart:math';

abstract class Shape {
  double area();
}

class Circle extends Shape {
  final double radius;

  Circle({required this.radius});

  @override
  double area() {
    return pi * pow(radius, 2);
  }
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle({required this.width, required this.height});

  @override
  double area() {
    return width * height;
  }
}

void main() {
  Circle c1 = Circle(radius: 10);
  print(c1.area());

  Rectangle r1 = Rectangle(width: 5, height: 6);
  print(r1.area());
}
