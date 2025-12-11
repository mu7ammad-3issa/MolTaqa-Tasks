import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/features/home/presentation/widgets/project_card.dart';
import 'package:seed/features/main/data/models/ad_status.dart';
import 'package:seed/features/main/presentation/widgets/ad_status_badge.dart';

class AdCard extends StatelessWidget {
  final String title;
  final String location;
  final String type;
  final String amount;
  final String percentage;
  final String evaluation;
  final String imageUrl;
  final bool isElectronic;
  final AdStatus status;

  const AdCard({
    super.key,
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProjectCard(
          title: title,
          location: location,
          type: type,
          amount: amount,
          percentage: percentage,
          evaluation: evaluation,
          imageUrl: imageUrl,
          isElectronic: isElectronic,
        ),
        Positioned(
          left: 8.w,
          top: 8.h,
          child: AdStatusBadge(status: status),
        ),
      ],
    );
  }
}
