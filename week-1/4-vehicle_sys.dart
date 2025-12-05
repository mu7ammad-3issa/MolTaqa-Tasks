class Vehicle {
  final String color;
  final String engineName;

  Vehicle({required this.color, required this.engineName});

  void startEngine() {
    print('ضع المفتاح أولا ثم قم بلف المفتاح');
  }
}

class Car extends Vehicle {
  final bool isHatchBag;

  Car({
    required super.color,
    required super.engineName,
    required this.isHatchBag,
  });

  @override
  void startEngine() {
    super.startEngine();
    print('أو استخدم الزر فى المفتاح للادارة المحرك عن بعد');
  }
}

class Motorcycle extends Vehicle {
  final String ay7aga;

  Motorcycle({
    required super.color,
    required super.engineName,
    required this.ay7aga,
  });

  @override
  void startEngine() {
    super.startEngine();
    print('أو استخدم المنفله');
  }
}

void main() {
  Car bmw = Car(color: 'black', engineName: 'v8-turbo', isHatchBag: false);
  bmw.startEngine();
}
