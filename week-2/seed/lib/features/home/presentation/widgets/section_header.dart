import 'package:flutter/material.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllTap;

  const SectionHeader({super.key, required this.title, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onSeeAllTap,
              child: Text('عرض الكل', style: AppStyles.font14PrimaryLight),
            ),
            verticalSpace(2),
            Container(height: 1, width: 52, color: ColorsManager.primary),
          ],
        ),
        Text(title, style: AppStyles.font20TextPrimaryMedium),
      ],
    );
  }
}
