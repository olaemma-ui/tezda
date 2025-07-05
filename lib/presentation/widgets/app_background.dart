import 'package:flutter/material.dart';
import 'package:tezda/core/theme/color_manager.dart';

class AppBackground extends StatelessWidget {
  final AppBar? appBar;
  final Widget? bottomNavigationBar;
  final Widget? child;
  const AppBackground({
    super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: ColorManager.background,
      bottomNavigationBar: bottomNavigationBar,
      body: child,
    );
  }
}
