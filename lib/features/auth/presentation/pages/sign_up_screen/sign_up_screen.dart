import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/component/constants.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
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
            decoration: ThemeMode.system != ThemeMode.dark
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
                        Color(0xff818181),
                        Color(0xff161617),
                        Color(0xFF212124),
                      ],
                      stops: [0.1, 0.4, 0.8, 0.9],
                    ),
                  ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 80,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    appTranslation(context).welcome,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.largeTitle.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0),
                  const SignUpForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
