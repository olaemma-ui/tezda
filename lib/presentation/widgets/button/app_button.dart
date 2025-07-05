import 'package:flutter/material.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/utils/screen_utils.dart';

class AppGradientButton extends StatefulWidget {
  final Widget child;

  final Border? border;
  final double? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool? useFixedSize;
  final Function()? onPressed;

  const AppGradientButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.useFixedSize = true,
  });

  @override
  _AppGradientButtonState createState() => _AppGradientButtonState();
}

class _AppGradientButtonState extends State<AppGradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isHovered
                ? [
                    const Color.fromARGB(255, 255, 200, 160),
                    const Color.fromARGB(255, 255, 180, 130),
                    ColorManager.primary.withOpacity(0.9),
                    ColorManager.primary.withOpacity(0.9),
                    const Color.fromARGB(255, 255, 140, 60),
                  ]
                : [
                    const Color.fromARGB(255, 255, 185, 145),
                    const Color.fromARGB(255, 255, 164, 112),
                    ColorManager.primary,
                    ColorManager.primary,
                  ],
          ),
          border: widget.border,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
        ),
        padding: EdgeInsets.all(widget.padding ?? 0),
        child: TextButton(
          style: TextButton.styleFrom(
            fixedSize:
                widget.useFixedSize! ? Size(context.screenWidth, 48) : null,
            elevation: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            ),
            padding: EdgeInsets.zero,
            backgroundColor: widget.backgroundColor ?? ColorManager.galssWhite,
          ),
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }
}
