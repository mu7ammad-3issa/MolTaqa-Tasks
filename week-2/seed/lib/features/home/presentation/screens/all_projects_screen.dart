import 'package:flutter/material.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/presentation/widgets/all_projects/all_projects_bloc_builder.dart';
import 'package:seed/features/home/presentation/widgets/all_projects_screen_header.dart';

class AllProjectsScreen extends StatelessWidget {
  final String cityName;

  const AllProjectsScreen({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGray,
      body: Column(
        children: [
          // Custom Header with selected city name
          AllProjectsScreenHeader(selectedCity: cityName),
          // Advertisements List
          const Expanded(child: AllProjectsBlocBuilder()),
        ],
      ),
    );
  }
}
