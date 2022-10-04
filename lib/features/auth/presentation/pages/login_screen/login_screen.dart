// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../core/utils/AppTextStyle.dart';
import '../../../../../config/themes/theme_cubit.dart';
import '../../../../../core/component/constants.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: ThemeCubit.themeMode != ThemeMode.dark
                ? const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF6194C2),
                        Color(0xFF78B1D5),
                        Color(0xFF8FCBDE),
                        Color(0xFF97D8E2),
                      ],
                      stops: [0.1, 0.4, 0.8, 0.9],
                    ),
                  )
                : const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff161618),
                        Color(0xff161617),
                        Color(0xFF212124),
                        Color(0xff818181),
                      ],
                      stops: [0.1, 0.4, 0.8, 0.9],
                    ),
                  ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    Text(appTranslation(context).welcomeBack,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.largeSubtitle.copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30),
                    const LoginForm()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
