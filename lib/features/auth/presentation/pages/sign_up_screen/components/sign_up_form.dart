import 'package:booking_app_algoriza/core/blocs/register/register_cubit.dart';
import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../../../core/utils/validator.dart';
import '../../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../../../../../core/widgets/custom_secundary_button.dart';
import '../../../../../../../../core/widgets/password_form_field.dart';
import '../../../../../../core/blocs/register/register_state.dart';
import '../../../../../../core/component/constants.dart';
import '../../../../../home/presentation/pages/home_screen.dart';
import '../../login_screen/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  bool secure = true;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildNameTF() {
    return CustomFormField(
      label: appTranslation(context).username,
      controller: name,
      hintText: appTranslation(context).enter_name,
      keyboardType: TextInputType.name,
      validator: (value) => Validator.validateEmpty(value!),
      prefixIcon: Icon(
        Icons.person,
        color: AppColors.textFormFieldIcon,
      ),
    );
  }

  Widget _buildEmailTF() {
    return CustomFormField(
      label: appTranslation(context).email,
      controller: email,
      hintText: appTranslation(context).enter_email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator.validateEmail(value!),
      prefixIcon: Icon(
        Icons.email,
        color: AppColors.textFormFieldIcon,
      ),
    );
  }

  Widget _buildPasswordTF() {
    return CustomFormField(
      controller: password,
      hintText: appTranslation(context).enter_password,
      validator: (value) => Validator.validatePassword(value!),
      keyboardType: TextInputType.visiblePassword,
      secure: secure,
      prefixIcon: Icon(
        Icons.lock,
        color: AppColors.textFormFieldIcon,
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            secure = !secure;
          });
        },
        child: secure == false
            ? Icon(
                Icons.visibility,
                color: AppColors.textFormFieldIcon,
              )
            : Icon(
                Icons.visibility_off,
                color: AppColors.textFormFieldIcon,
              ),
      ),
    );
  }

  Widget _buildConfirmPasswordTF() {
    return CustomFormField(
      controller: confirmPassword,
      hintText: appTranslation(context).enter_password,
      validator: (value) {
        if (value!.isEmpty) return "Empty";
        if (value != password.text) {
          return "Not match";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      secure: secure,
      prefixIcon: Icon(
        Icons.lock,
        color: AppColors.textFormFieldIcon,
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            secure = !secure;
          });
        },
        child: secure == false
            ? Icon(
                Icons.visibility,
                color: AppColors.textFormFieldIcon,
              )
            : Icon(
                Icons.visibility_off,
                color: AppColors.textFormFieldIcon,
              ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
        if (state is UserRegisterSuccessState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: CustomSecondaryButton(
              onPressed: () async {
                if (email.text.isEmpty) {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.error(
                      message: appTranslation(context).email_empty,
                    ),
                  );
                  return;
                }
                if (password.text.isEmpty) {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.error(
                      message: appTranslation(context).password_empty,
                    ),
                  );
                  return;
                }

                if (password.text.length < 5) {
                  showTopSnackBar(
                    context,
                    const CustomSnackBar.error(
                      message: "Password is min than six",
                    ),
                  );
                  return;
                }
                if (confirmPassword.text.isEmpty) {
                  showTopSnackBar(
                    context,
                    const CustomSnackBar.error(
                      message: "ConfirmPassword is empty",
                    ),
                  );
                  return;
                }
                if (confirmPassword.text != password.text) {
                  showTopSnackBar(
                    context,
                    const CustomSnackBar.error(
                      message: "confirmPassword and password don't match",
                    ),
                  );
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  RegisterCubit.get(context).userRegister(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                      confirmPassword: confirmPassword.text);
                } else {
                  if (kDebugMode) {
                    print("Not Valid");
                  }
                }
              },
              text: appTranslation(context).register),
        );
      },
    );
  }

  Widget _buildSignInWithText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(appTranslation(context).have_account, style: TextStyle(color: AppColors.description)),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                child: Text(
                  " ${appTranslation(context).login}",
                  style: TextStyle(color: AppColors.textButton),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
      },
      builder: (context, state) {
        return Form(
            key: _formKey,
            child: Column(
              children: [
                _buildNameTF(),
                _buildEmailTF(),
                _buildPasswordTF(),
                _buildConfirmPasswordTF(),
                _buildSignUpBtn(),
                _buildSignInWithText(),
              ],
            ));
      },
    );
  }
}
