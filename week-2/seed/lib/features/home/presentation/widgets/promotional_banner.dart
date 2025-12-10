import 'package:flutter/material.dart';
import 'package:seed/core/constants/app_assets.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.imagesBanner);
  }
}
