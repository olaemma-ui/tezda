import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/utils/font_manager.dart';
import 'package:tezda/core/utils/screen_utils.dart';

class AppBottomSheetWidget extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? showClose;
  const AppBottomSheetWidget({
    super.key,
    required this.child,
    this.title,
    this.showClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          if (showClose ?? true)
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 30,
                height: 30,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: ColorManager.primary,
                    size: 20,
                  ),
                ),
              ),
            ),
          if (!(showClose ?? false) && title != null) const Gap(16),
          if (title != null)
            Text(
              title!,
              style: FontManager.getTextStyle(
                fontSize: context.scaleText(18),
                fontWeight: FontManager.semiBold,
              ),
            ),
          const Gap(16),
          child
        ],
      ),
    );
  }
}
