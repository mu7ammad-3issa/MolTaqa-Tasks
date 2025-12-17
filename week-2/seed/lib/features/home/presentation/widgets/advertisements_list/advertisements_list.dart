import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/features/home/domain/entities/advertisement_entity.dart';
import 'package:seed/features/home/presentation/widgets/advertisements_list/advertisement_card.dart';

class AdvertisementsList extends StatelessWidget {
  final List<AdvertisementEntity> advertisements;

  const AdvertisementsList({super.key, required this.advertisements});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: advertisements.length,
      itemBuilder: (context, index) {
        final advertisement = advertisements[index];
        return Padding(
          padding: context.only(
            bottom: index < advertisements.length - 1 ? 12.h : 0,
          ),
          child: AdvertisementCard(advertisement: advertisement),
        );
      },
    );
  }
}
