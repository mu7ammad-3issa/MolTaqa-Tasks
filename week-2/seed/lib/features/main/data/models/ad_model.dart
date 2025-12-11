import 'package:seed/features/main/data/models/ad_status.dart';

class AdModel {
  final String title;
  final String location;
  final String type;
  final String amount;
  final String percentage;
  final String evaluation;
  final String imageUrl;
  final bool isElectronic;
  final AdStatus status;

  const AdModel({
    required this.title,
    required this.location,
    required this.type,
    required this.amount,
    required this.percentage,
    required this.evaluation,
    required this.imageUrl,
    required this.status,
    this.isElectronic = true,
  });
}
