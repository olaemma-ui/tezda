import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/theme/light_theme.dart';
import 'package:tezda/core/utils/font_manager.dart';
import 'package:tezda/core/utils/screen_utils.dart';
import 'package:tezda/presentation/widgets/bottom_sheet/app_bottom_sheet_widget.dart';
import 'package:tezda/presentation/widgets/bottom_sheet/option_sheet/option_sheet_model.dart';
import 'package:tezda/presentation/widgets/button/app_button.dart';

class OffersBottomSheet<T> extends StatefulWidget {
  final List<OptionSheetModel<T>> options;
  final String? title;
  final bool? showClose;
  final bool? multiSelect;
  final Function(OptionSheetModel<T> value)? onChange;
  final Function()? onSubmit;
  const OffersBottomSheet({
    super.key,
    required this.options,
    this.title,
    this.multiSelect,
    this.showClose,
    this.onChange,
    this.onSubmit,
  });

  @override
  State<OffersBottomSheet<T>> createState() => _OffersBottomSheetState<T>();
}

class _OffersBottomSheetState<T> extends State<OffersBottomSheet<T>> {
  bool openDropdown = false;

  void _openDropdown([bool? value]) {
    setState(() {
      openDropdown = value ?? !openDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AppBottomSheetWidget(
        title: widget.title,
        showClose: widget.showClose,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.options.map(
                    (e) => priceOption(
                      e: e,
                      context: context,
                      isSelected: (widget.multiSelect ?? false)
                          ? e.isSelected ?? false
                          : false,
                      // multiSelect: widget.multiSelect ?? false,
                    ),
                  ),
                ],
              ),
              const Gap(24),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool singleSelected = false;
  GestureDetector priceOption({
    required OptionSheetModel<T> e,
    required BuildContext context,
    required bool isSelected,
    // required bool multiSelect,
    Function? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) return onTap();
        if (widget.onChange != null) {
          bool found = false;
          for (OptionSheetModel<T> el in widget.options) {
            int i = widget.options.indexOf(el);
            widget.options[i] = el.copyWith(isSelected: false);
            singleSelected = false;
            if (e.id == el.id) {
              widget.options[i] = el.copyWith(isSelected: true);
              widget.onChange!(widget.options[i]);
              found = true;
            }
          }

          if (!found) {
            singleSelected = true;
            _openDropdown(false);
            e = e.copyWith(isSelected: true);
            widget.onChange!(e);
          }
          setState(() {});
        }
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 8),
        width: context.screenWidth,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: (e.isSelected ?? false) || isSelected
              ? ColorManager.primaryAcent
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: (e.isSelected ?? false) || isSelected
                ? ColorManager.primary
                : ColorManager.defaultBorder,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (onTap == null)
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: ColorManager.background,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: (e.isSelected ?? false) || isSelected ? 6 : 1.5,
                    color: (e.isSelected ?? false) || isSelected
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
            if (onTap != null)
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: ColorManager.grey.withOpacity(.7),
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
      ),
    );
  }
}
