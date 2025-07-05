import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:tezda/core/enums/app_routes_enum.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/theme/light_theme.dart';
import 'package:tezda/core/utils/asset_manager/asset_manager.dart';
import 'package:tezda/core/utils/font_manager.dart';
import 'package:tezda/core/utils/screen_utils.dart';
import 'package:tezda/presentation/widgets/button/app_button.dart';
import 'package:tezda/presentation/widgets/text_field/text_field.dart';

// 👉  import your provider with a *package* path
import 'package:tezda/presentation/pages/auth/login/login_provider.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ── STATE & CONTROLLER ────────────────────────────────────────────────
    final form = ref.watch(loginFormControllerProvider);
    final controller = ref.read(loginFormControllerProvider.notifier);

    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5E6D0), Color(0xFFE6D5F5)],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Gap(16),
            // back button only when coming from onboarding
            // if (GoRouter.of(context).history.last.name == AppRoutes.onboarding)
            //   Align(
            //     alignment: Alignment.topLeft,
            //     child: IconButton(
            //       padding: EdgeInsets.zero,
            //       onPressed: () => GoRouter.of(context).pop(),
            //       icon: const Icon(CupertinoIcons.arrow_left,
            //           color: ColorManager.black),
            //     ),
            //   ),
            // const Gap(16),

            // ── FORM CARD ────────────────────────────────────────────────
            Flexible(
              child: Center(
                child: Form(
                  key: controller.formKey,
                  child: Card(
                    elevation: 0,
                    color: const Color.fromARGB(150, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side:
                          const BorderSide(width: 2, color: ColorManager.white),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // logo
                          Container(
                            height: 35,
                            width: 35,
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: ColorManager.primary,
                            ),
                            child: AssetManager.logo,
                          ),
                          // title & subtitle
                          Text(
                            'Login',
                            style: FontManager.getTextStyle(
                              fontSize: context.scaleText(24),
                              fontWeight: FontManager.semiBold,
                            ),
                          ),
                          Text(
                            "Welcome back! Please log in to continue where you left off and see what's new.",
                            textAlign: TextAlign.center,
                            style: FontManager.getTextStyle(
                              color: ColorManager.textSecondary2,
                            ),
                          ),
                          const Gap(24),

                          // ── username FIELD ──
                          AppTextFormField(
                            labelText: 'Username',
                            radius: 10,
                            iconData: Icons.person_outline,
                            controller: controller.usernameController,
                            enabled: !form.isSubmitting,
                            errorText: form.usernameError,
                            onChanged: controller.setusername,
                          ),

                          const Gap(16),

                          // ── PASSWORD FIELD ──
                          AppTextFormField(
                            labelText: 'Password',
                            radius: 10,
                            iconData: Icons.lock_outline,
                            controller: controller.passwordController,
                            enabled: !form.isSubmitting,
                            errorText: form.passwordError,
                            obscureText: !form.showPassword,
                            onChanged: controller.setPassword,
                            validator: (_) => controller.validatePassword(),
                            suffixIcon: IconButton(
                              onPressed: controller.togglePasswordVisibility,
                              icon: Icon(
                                form.showPassword
                                    ? CupertinoIcons.eye_slash
                                    : CupertinoIcons.eye,
                                color: ColorManager.textHint,
                                size: 20,
                              ),
                            ),
                          ),

                          const Gap(16),

                          // forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => {},
                              child: Text(
                                'Forget Password?',
                                style: FontManager.getTextStyle(
                                  fontWeight: FontManager.medium,
                                  fontSize: 12,
                                  color: ColorManager.black,
                                ),
                              ),
                            ),
                          ),

                          const Gap(24),

                          // ── LOGIN BUTTON ──
                          AppGradientButton(
                            onPressed: form.isSubmitting
                                ? null
                                : controller.submitLogin,
                            child: form.isSubmitting
                                ? const CupertinoActivityIndicator()
                                : Text(
                                    'Log In',
                                    style: FontManager.getTextStyle(
                                      color: ColorManager.textWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                          ),

                          const Gap(24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
