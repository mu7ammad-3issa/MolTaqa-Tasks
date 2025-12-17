import 'package:seed/features/home/data/models/advertisements_response_model/advertisement_model.dart';

class AdvertisementsResponseModel {
  final List<AdvertisementModel> data;
  final int status;

  AdvertisementsResponseModel({required this.data, required this.status});

  factory AdvertisementsResponseModel.fromJson(Map<String, dynamic> json) {
    return AdvertisementsResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((ad) => AdvertisementModel.fromJson(ad as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
    );
  }
}
