import 'package:flutter/material.dart';
import 'package:seed/core/theming/colors_manager.dart';

enum AdStatus {
  all('الكل'),
  underConstruction('تحت الانشاء'),
  published('منشور'),
  hidden('محجوب'),
  rejected('مرفوض'),
  archived('مؤرشف');

  final String label;
  const AdStatus(this.label);

  Color get backgroundColor {
    switch (this) {
      case AdStatus.all:
        return ColorsManager.primary;
      case AdStatus.underConstruction:
        return ColorsManager.statusGreen;
      case AdStatus.published:
        return ColorsManager.primary;
      case AdStatus.hidden:
        return ColorsManager.textSecondary;
      case AdStatus.rejected:
        return ColorsManager.statusRed;
      case AdStatus.archived:
        return ColorsManager.statusOrange;
    }
  }
}
