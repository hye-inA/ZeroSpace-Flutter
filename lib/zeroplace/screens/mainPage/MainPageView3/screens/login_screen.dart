import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';
import 'package:zeroplace/common/const/app_strings.dart';
import 'package:zeroplace/common/const/app_theme.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/zeroplace/screens/mainPage/MainPageView3/component/custom_text_form_field.dart';
import 'package:zeroplace/zeroplace/screens/mainPage/MainPageView3/widgets/login_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        top: true,
        bottom: false,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.zero,
          children: [
            LoginBackground(children: [
              Text(
                AppStrings.welcome,
                style: AppTheme.titleLarge,
              ),
              SizedBox(height: 6),
              Text(AppStrings.signInToYourAccount, style: AppTheme.bodySmall)
            ]),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      hintText: "이메일을 입력해주세요",
                      onChanged: (String value) {},
                      textInputAction: TextInputAction.next,
                      labelText: AppStrings.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 18),
                    CustomTextFormField(
                      hintText: "비밀번호를 입력해주세요",
                      onChanged: (String value) {},
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      labelText: AppStrings.password,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.PRIMARY_ORRANGE),
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.doNotHaveAnAccount,
                ),
                const SizedBox(width: 4),
                //TextButton(onPressed: onPressed, child: child)
              ],
            )
          ],
        ),
      ),
    );
  }
}
