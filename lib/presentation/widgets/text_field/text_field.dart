import 'package:flutter/material.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/theme/light_theme.dart';
import 'package:tezda/core/utils/font_manager.dart';

class AppTextFormField extends FormField<String> {
  AppTextFormField({
    super.key,
    super.initialValue,
    EdgeInsets? contentPadding,
    double? radius,
    IconData? iconData,
    Color? prefixIconBackgroundColor,
    Color? fillColor,
    String? hintText,
    String? labelText,
    String? errorText,
    TextStyle? labelStyle,
    double? iconSize,
    Color? iconColor,
    TextInputType? keyboardType,
    TextEditingController? controller,
    TextInputAction? textInputAction,
    bool? obscureText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    int? maxLines,
    int? maxLength,
    super.enabled,
    super.validator,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
    bool? readOnly,
    void Function()? onTap,
    bool? autoFocus,
  }) : super(
          builder: (FormFieldState<String> field) {
            return TextFormField(
              initialValue: initialValue,
              keyboardType: keyboardType,
              controller: controller,
              autofocus: autoFocus ?? false,
              textInputAction: textInputAction,
              obscureText: obscureText ?? false,
              enabled: enabled,
              maxLines: maxLines ?? 1,
              maxLength: maxLength,
              // onChanged: (value) {
              //   field.didChange(value);
              //   if (onChanged != null) {
              //     onChanged(value);
              //   }
              // },

              onChanged: (value) {
                if (onChanged != null) {
                  onChanged(value);
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onFieldSubmitted: onFieldSubmitted,
              readOnly: readOnly ?? false,
              onTap: onTap,
              cursorColor: ColorManager.primary,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                errorBorder: AppTheme.outlineInputBorder(
                  color: ColorManager.error,
                  radius: radius,
                ),
                border: AppTheme.outlineInputBorder(
                  color: ColorManager.defaultBorder,
                  radius: radius,
                ),
                enabledBorder: AppTheme.outlineInputBorder(
                  color: ColorManager.defaultBorder,
                  radius: radius,
                ),
                focusedBorder: AppTheme.outlineInputBorder(
                  color: ColorManager.focusInputBorder,
                  radius: radius,
                ),
                focusedErrorBorder: AppTheme.outlineInputBorder(
                  color: ColorManager.error,
                  radius: radius,
                ),
                labelText: labelText,
                labelStyle: labelStyle,
                hintStyle: labelStyle,
                hintText: hintText,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                counterText: '',
                contentPadding: contentPadding,
                floatingLabelStyle: FontManager.getTextStyle(
                  color: ColorManager.textDefault,
                  fontSize: 16,
                ),
                error: errorText != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: ColorManager.error,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              errorText,
                              style: FontManager.getTextStyle(
                                color: ColorManager.error,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      )
                    : null,
                fillColor: fillColor ?? const Color(0XFFFCFCFD),
              ),
              style: FontManager.getTextStyle(
                fontSize: 14,
                color: ColorManager.textDefault,
              ),
            );
          },
        );
}
