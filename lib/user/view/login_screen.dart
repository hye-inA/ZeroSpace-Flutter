import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zeroplace/common/component/custom_text_form_field.dart';
import 'package:zeroplace/common/const/app_colors.dart';
import 'package:zeroplace/common/const/app_strings.dart';
import 'package:zeroplace/common/const/app_theme.dart';
import 'package:zeroplace/common/const/data.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/common/view/home_screen.dart';
import 'package:zeroplace/common/widgets/background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    // localhost
    final emulatorIp = '10.0.0.2:3000';
    final simulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;
    return DefaultLayout(
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.zero,
        children: [
          Background(children: [
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
                    onChanged: (String value) {
                      email = value;
                    },
                    textInputAction: TextInputAction.next,
                    labelText: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 18),
                  CustomTextFormField(
                    hintText: "비밀번호를 입력해주세요",
                    onChanged: (String value) {
                      password = value;
                    },
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    labelText: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      // ID:비밀번호
                      final rawString = '$email:$password';

                      print(rawString);

                      Codec<String, String> stringToBase64 = utf8.fuse(base64);

                      String token = stringToBase64.encode(rawString);

                      final resp = await dio.post(
                        'http://$ip/auth/login',
                        options: Options(
                          headers: {
                            'authorization': 'Basic $token',
                          },
                        ),
                      );
                      final refreshToken = resp.data['refreshToken'];
                      final accessToken = resp.data['accessToken'];

                      await storage.write(
                          key: REFRESH_TOKEN_KEY, value: refreshToken);
                      await storage.write(
                          key: ACCESS_TOKEN_KEY, value: accessToken);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(),
                        ),
                      );
                      print(resp.data);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.PRIMARY_ORRANGE),
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 2.0,
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
    );
  }
}
