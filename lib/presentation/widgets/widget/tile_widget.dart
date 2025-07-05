import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/utils/font_manager.dart';
import 'package:tezda/core/utils/screen_utils.dart';

class TileWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color? color;
  final Color? backgroundColor;
  final String? subTitle;
  final Widget? icon;
  final int? maxLines;
  final Widget? suffix;
  final ImageProvider? leadingImage;
  final EdgeInsets? padding;
  final bool? showDivider;
  final TextOverflow? bodyOverflow;
  const TileWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
    this.icon,
    this.bodyOverflow,
    this.color,
    this.backgroundColor,
    this.padding,
    this.suffix,
    this.maxLines,
    this.showDivider = true,
    this.leadingImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: backgroundColor ?? Colors.transparent,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: color ?? ColorManager.primary,
                      radius: 20,
                      backgroundImage: leadingImage,
                      child: leadingImage == null ? icon : null,
                    ),
                    const Gap(8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: ((context.screenWidth < 500)
                                    ? 500
                                    : context.screenWidth) -
                                (suffix == null ? 260 : 290),
                            child: Text(
                              title,
                              style: FontManager.getTextStyle(
                                fontWeight: FontManager.medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (subTitle != null)
                            Text(
                              subTitle!,
                              style: FontManager.getTextStyle(
                                color: ColorManager.textDefault,
                                fontSize: 12,
                              ),
                              maxLines: maxLines,
                              overflow: bodyOverflow,
                            ),
                        ],
                      )
                    ),
                    suffix ??
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 20,
                        )
                  ],
                ),
                if (showDivider!) ...[
                  const Gap(8),
                  const Divider(
                    color: ColorManager.defaultBorder,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TileWidgetShimmer extends StatelessWidget {
  const TileWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 10,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 6,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      leading: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      trailing: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
