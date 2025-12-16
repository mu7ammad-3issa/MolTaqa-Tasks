import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/constants/app_assets.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/features/home/presentation/widgets/project_card.dart';

class ProjectsSliverList extends StatelessWidget {
  const ProjectsSliverList({super.key});

  static const List<Map<String, dynamic>> _projects = [
    {
      'title': 'انشاء مركز طبي',
      'location': 'الرياض',
      'type': 'الكتروني',
      'amount': '100,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': true,
    },
    {
      'title': 'انشاء مركز تجاري',
      'location': 'الرياض',
      'type': 'غير الكتروني',
      'amount': '140,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': false,
    },
    {
      'title': 'انشاء مركز تجاري',
      'location': 'الرياض',
      'type': 'غير الكتروني',
      'amount': '140,000 ريال',
      'percentage': '25 %',
      'evaluation': '1,000000',
      'imageUrl': Assets.imagesProjectCard,
      'isElectronic': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: _projects.length,
      itemBuilder: (context, index) {
        final project = _projects[index];
        return Padding(
          padding: context.only(
            bottom: index < _projects.length - 1 ? 12.h : 0,
          ),
          child: ProjectCard(
            title: project['title'] as String,
            location: project['location'] as String,
            type: project['type'] as String,
            amount: project['amount'] as String,
            percentage: project['percentage'] as String,
            evaluation: project['evaluation'] as String,
            imageUrl: project['imageUrl'] as String,
            isElectronic: project['isElectronic'] as bool,
          ),
        );
      },
    );
  }
}
