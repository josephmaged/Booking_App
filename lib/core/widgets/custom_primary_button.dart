import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:booking_app_algoriza/core/utils/app_radius.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
    this.text,
    this.press,
    this.height = 56,
  }) : super(key: key);
  final String? text;
  final double height;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.button)),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(text!,
            style: AppTextStyle.buttonStyle),
      ),
    );
  }
}
