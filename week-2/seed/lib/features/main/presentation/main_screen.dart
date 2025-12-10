import 'package:flutter/material.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/features/home/presentation/screens/home_screen.dart';
import 'package:seed/features/main/presentation/widgets/bottom_nav_bar.dart';
import 'package:seed/features/main/presentation/screens/my_ads_screen.dart';
import 'package:seed/features/main/presentation/screens/add_ad_screen.dart';
import 'package:seed/features/main/presentation/screens/more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MyAdsScreen(),
    AddAdScreen(),
    MoreScreen(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGray,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
