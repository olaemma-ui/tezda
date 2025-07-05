import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/theme/light_theme.dart';
import 'package:tezda/core/utils/font_manager.dart';
import 'package:tezda/core/utils/screen_utils.dart';
import 'package:tezda/presentation/widgets/bottom_sheet/app_bottom_sheet_widget.dart';
import 'package:tezda/presentation/widgets/bottom_sheet/option_sheet/option_sheet_model.dart';
import 'package:tezda/presentation/widgets/button/app_button.dart';

class OptionBottomSheet<T> extends StatefulWidget {
  final List<OptionSheetModel<T>> options;
  final String? title;
  final bool? showClose;
  final Function(OptionSheetModel<T> value)? onChange;
  final Function()? onSubmit;
  const OptionBottomSheet({
    super.key,
    required this.options,
    this.title,
    this.showClose,
    this.onChange,
    this.onSubmit,
  });

  @override
  State<OptionBottomSheet<T>> createState() => _OptionBottomSheetState<T>();
}

class _OptionBottomSheetState<T> extends State<OptionBottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: widget.title,
      showClose: widget.showClose,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...widget.options.map(
              (e) => GestureDetector(
                onTap: () {
                  if (widget.onChange != null) {
                    for (OptionSheetModel<T> el in widget.options) {
                      int i = widget.options.indexOf(el);
                      widget.options[i] = el.copyWith(isSelected: false);
                      if (e.data == el.data) {
                        widget.options[i] = el.copyWith(isSelected: true);
                        widget.onChange!(widget.options[i]);
                      }
                    }
                    setState(() {});
                  }
                },
                child: (Container(
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 8),
                  width: context.screenWidth,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (e.isSelected ?? false)
                        ? ColorManager.primaryAcent
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: (e.isSelected ?? false)
                          ? ColorManager.primary
                          : ColorManager.defaultBorder,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: ColorManager.background,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: (e.isSelected ?? false) ? 6 : 1.5,
                            color: (e.isSelected ?? false)
                                ? ColorManager.primary
                                : ColorManager.defaultBorder,
                          ),
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: e.subTitle != null
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: FontManager.getTextStyle(),
                            ),
                            if (e.subTitle != null)
                              Text(
                                e.subTitle!,
                                style: FontManager.getTextStyle(
                                  fontSize: 12,
                                  color: ColorManager.textDefault,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (e.trailing != null)
                        Text(
                          e.trailing!,
                          style: FontManager.getTextStyle(
                            fontSize: 12,
                            fontWeight: FontManager.semiBold,
                          ),
                        ),
                    ],
                  ),
                )),
              ),
            ),
            const Gap(24),
            if (widget.onSubmit != null)
              AppGradientButton(
                onPressed: widget.onSubmit,
                // style: AppTheme.themeData.textButtonTheme.style?.copyWith(
                //   backgroundColor: const WidgetStatePropertyAll(
                //     ColorManager.primary,
                //   ),
                // ),
                child: Text(
                  'Proceed',
                  style: FontManager.getTextStyle(
                    color: ColorManager.textWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
