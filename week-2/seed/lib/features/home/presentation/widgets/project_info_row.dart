import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';

class ProjectInfoRow extends StatelessWidget {
  final String icon;
  final String text;

  const ProjectInfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: AppStyles.font12TextSecondaryLight),
        horizontalSpace(4),
        SvgPicture.asset(icon),
      ],
    );
  }
}
