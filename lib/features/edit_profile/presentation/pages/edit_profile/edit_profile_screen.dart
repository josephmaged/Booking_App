import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/theme_cubit.dart';
import '../../../../../core/component/constants.dart';
import 'components/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height * 1.1,
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
                    Color(0xff818181),
                    Color(0xff161610),
                    Color(0xFF212124),
                  ],
                  stops: [0.1, 0.4, 0.8, 0.9],
                ),
              ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 60,
                      height: 40,
                      padding: const EdgeInsets.only(),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: 4,
                ),
                child: Text(appTranslation(context).edit_profile, style: AppTextStyle.largeSubtitle),
              ),
              const SizedBox(height: 20),
              const EditProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
