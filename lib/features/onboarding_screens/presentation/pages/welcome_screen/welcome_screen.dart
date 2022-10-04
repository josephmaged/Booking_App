// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors
import 'package:booking_app_algoriza/config/themes/app_theme.dart';
import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_algoriza/core/utils/hex_color.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/custom_secundary_button.dart';
import '../../../../../../../core/widgets/custom_primary_button.dart';
import '../../../../auth/presentation/pages/login_screen/login_screen.dart';
import '../../../../auth/presentation/pages/sign_up_screen/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.textFormFieldBackground,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .4,
                    width: size.width,
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Discover Your",
                          style: AppTextStyle.largeTitle.copyWith(color: AppColors.description),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Comfort Zone!",
                          style: AppTextStyle.largeSubtitle.copyWith(color: AppColors.description),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Great experiences at backpacker prices",
                    style: AppTextStyle.descriptionStyle.copyWith(color: AppColors.description),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPrimaryButton(
                      text: "Login",
                      press: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomSecondaryButton(
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
