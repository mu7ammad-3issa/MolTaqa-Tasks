import 'package:seed/features/home/data/models/city_model.dart';

class CitiesResponseModel {
  final List<CityModel> data;
  final int status;

  CitiesResponseModel({required this.data, required this.status});

  factory CitiesResponseModel.fromJson(Map<String, dynamic> json) {
    return CitiesResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((city) => CityModel.fromJson(city as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
    );
  }
}
