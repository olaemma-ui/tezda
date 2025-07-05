import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/theme/light_theme.dart';
import 'package:tezda/core/utils/font_manager.dart';
import 'package:tezda/core/utils/screen_utils.dart';
import 'package:tezda/presentation/widgets/bottom_sheet/app_bottom_sheet_widget.dart';
import 'package:tezda/presentation/widgets/bottom_sheet/option_sheet/option_sheet_model.dart';
import 'package:tezda/presentation/widgets/button/app_button.dart';

class PriceBottomSheet<T> extends StatefulWidget {
  final List<OptionSheetModel<T>> options;
  final OptionSheetModel<T> singlePrice;
  final String? title;
  final bool? showClose;
  final Function(OptionSheetModel<T> value)? onChange;
  final Function()? onSubmit;
  const PriceBottomSheet({
    super.key,
    required this.options,
    required this.singlePrice,
    this.title,
    this.showClose,
    this.onChange,
    this.onSubmit,
  });

  @override
  State<PriceBottomSheet<T>> createState() => _PriceBottomSheetState<T>();
}

class _PriceBottomSheetState<T> extends State<PriceBottomSheet<T>> {
  bool openDropdown = false;

  void _openDropdown([bool? value]) {
    setState(() {
      openDropdown = value ?? !openDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: widget.title,
      showClose: widget.showClose,
      child: Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: Column(
            children: [
              priceOption(widget.singlePrice, context, singleSelected),
              priceOption(
                OptionSheetModel(
                  id: null,
                  data: null,
                  title: "Bundle package",
                  subTitle: 'Choose your preferable bundle packages',
                ),
                context,
                false,
                _openDropdown,
              ),
              if (openDropdown)
                AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...widget.options.map(
                        (e) => priceOption(e, context, false),
                      ),
                    ],
                  ),
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
                    color: ColorManager.textWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
  GestureDetector priceOption(
      OptionSheetModel<T> e, BuildContext context, bool isSelected,
      [Function? onTap]) {
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
