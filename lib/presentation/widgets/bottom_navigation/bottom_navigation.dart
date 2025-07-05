import 'package:flutter/material.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/utils/asset_manager/asset_manager.dart';
import 'package:tezda/core/utils/font_manager.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    this.onTap,
    required this.currentIndex,
  });
  final Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.textSecondary2,
      unselectedLabelStyle: FontManager.getTextStyle(
        color: ColorManager.black,
      ),
      selectedLabelStyle: FontManager.getTextStyle(
        color: ColorManager.black,
      ),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: AssetManager.home_default,
          activeIcon: AssetManager.home_active,
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: AssetManager.recent_default,
          activeIcon: AssetManager.recent_active,
          label: 'Nearby',
        ),
        BottomNavigationBarItem(
          icon: AssetManager.create_memory,
          activeIcon: AssetManager.create_memory,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: AssetManager.memories_default,
          activeIcon: AssetManager.memories_active,
          label: 'Memories',
        ),
        BottomNavigationBarItem(
          icon: AssetManager.profile_default,
          activeIcon: AssetManager.profile_active,
          label: 'Profile',
        ),
      ],
      backgroundColor: ColorManager.background,
    );
  }
}
