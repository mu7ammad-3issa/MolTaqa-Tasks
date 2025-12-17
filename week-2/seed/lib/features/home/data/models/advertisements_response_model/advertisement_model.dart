import 'package:seed/features/home/domain/entities/advertisement_entity.dart';

class AdvertisementModel extends AdvertisementEntity {
  AdvertisementModel({
    required super.name,
    required super.mainImage,
    required super.isOnline,
    super.city,
    super.askMoney,
    super.partnershipRatio,
    super.totalProjectEvaluation,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) {
    return AdvertisementModel(
      name: json['name'] as String,
      mainImage: json['main_image'] as String,
      isOnline: json['is_online'] as int,
      city: json['city'] as String?,
      askMoney: json['ask_money'] as num?,
      partnershipRatio: json['partnership_ratio'] as num?,
      totalProjectEvaluation: json['total_project_evaluation'] as num?,
    );
  }
}
