// ignore_for_file: must_be_immutable

import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_algoriza/core/utils/app_radius.dart';
import 'package:booking_app_algoriza/core/utils/hex_color.dart';
import 'package:flutter/material.dart';

import '../utils/AppTextStyle.dart';

class CustomFormField extends StatelessWidget {
  String? label;
  String? hintText;
  TextEditingController? controller = TextEditingController();
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  Widget? suffixIcon = Container();
  Widget? prefixIcon = const SizedBox(width: 5);
  bool readOnly;
  TextStyle? labelTextStyle = AppTextStyle.smallTitle;
  bool? secure;
  bool? enabled;
  ValueChanged<String>? onFieldSubmitted;

  CustomFormField({
    this.controller,
    this.label,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.labelTextStyle,
    this.secure = false,
    this.enabled = true,
    this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
              readOnly: readOnly,
              onFieldSubmitted: onFieldSubmitted,
              style: AppTextStyle.smallTitle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.text),
              controller: controller,
              keyboardType: keyboardType!,
              enabled: enabled,
              onSaved: (newValue) => controller!.text = newValue!,
              obscureText: secure!,
              decoration: InputDecoration(
                labelText: hintText!,
                labelStyle: AppTextStyle.smallTitle
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.description),
                fillColor: AppColors.textFormFieldBackground,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.textFormField),
                ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
              ),
              validator: validator),
        ),
      ],
    );
  }
}
