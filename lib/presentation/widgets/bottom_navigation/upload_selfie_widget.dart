import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/utils/font_manager.dart';
import 'package:tezda/presentation/widgets/bottom_sheet/app_bottom_sheet_widget.dart';

class ConfirmActionSheetWidget extends StatefulWidget {
  final Function()? onCancel;
  final Function()? onConfirm;
  final String title;
  final String body;
  final String confirmText;
  final String cancelText;
  const ConfirmActionSheetWidget({
    super.key,
    required this.onCancel,
    required this.onConfirm,
    required this.title,
    required this.body,
    required this.confirmText,
    required this.cancelText,
  });

  @override
  State<ConfirmActionSheetWidget> createState() =>
      _ConfirmActionSheetWidgetState();
}

class _ConfirmActionSheetWidgetState extends State<ConfirmActionSheetWidget> {
  bool isLoading = false;
  setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isLoading,
      child: SingleChildScrollView(
        child: AppBottomSheetWidget(
          // title: 'Selfie Update',s
          showClose: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.question_circle,
                    color: ColorManager.primary,
                    size: 32,
                  ),
                  Text(
                    widget.title,
                    style: FontManager.getTextStyle(
                      fontWeight: FontManager.medium,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              Text(
                widget.body,
                style: FontManager.getTextStyle(fontSize: 12),
              ),
              const Gap(32),
              Row(
                children: [
                  if (widget.onCancel != null) ...[
                    Expanded(
                      child: TextButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                setIsLoading();
                                await widget.onCancel!();
                                setIsLoading();
                              },
                        style: TextButton.styleFrom(
                          side: BorderSide(
                            color: isLoading
                                ? ColorManager.error.withOpacity(.3)
                                : ColorManager.error,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          widget.cancelText,
                          style: FontManager.getTextStyle(
                            color: isLoading
                                ? ColorManager.error.withOpacity(.3)
                                : ColorManager.error,
                          ),
                        ),
                      ),
                    ),
                    const Gap(16)
                  ],
                  Expanded(
                    child: TextButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              setIsLoading();
                              await widget.onConfirm!();
                              setIsLoading();
                            },
                      child: Text(
                        widget.confirmText,
                        style: FontManager.getTextStyle(
                          color: ColorManager.textWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
