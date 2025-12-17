class AdvertisementEntity {
  final String name;
  final String mainImage;
  final int isOnline;
  final String? city;
  final num? askMoney;
  final num? partnershipRatio;
  final num? totalProjectEvaluation;

  AdvertisementEntity({
    required this.name,
    required this.mainImage,
    required this.isOnline,
    this.city,
    this.askMoney,
    this.partnershipRatio,
    this.totalProjectEvaluation,
  });
}
