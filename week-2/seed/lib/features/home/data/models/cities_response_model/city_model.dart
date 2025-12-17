import 'package:seed/features/home/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({required super.id, required super.name});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(id: json['id'] as int, name: json['name'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
