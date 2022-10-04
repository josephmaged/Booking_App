import 'package:booking_app_algoriza/core/blocs/login/login_cubit.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_algoriza/core/widgets/custom_primary_button.dart';
import 'package:booking_app_algoriza/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../../../core/utils/AppTextStyle.dart';
import '../../../../../../../../core/utils/validator.dart';
import '../../../../../../../../core/widgets/custom_form_field.dart';

import '../../../../../../core/blocs/login/login_state.dart';
import '../../../../../../core/component/constants.dart';
import '../../sign_up_screen/sign_up_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool _rememberMe = false;
  bool secure = true;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildEmailTF() {
    return CustomFormField(
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/reset_password"),
        child: Text(
          appTranslation(context).forget_pass,
          style: AppTextStyle.smallTitle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 30.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            appTranslation(context).remember_me,
            style: AppTextStyle.smallTitle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CustomPrimaryButton(
            press: () async {
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

              if (_formKey.currentState!.validate()) {
                LoginCubit.get(context).userLogin(
                  email: email.text,
                  password: password.text,
                );
              } else {
                print("Not Valid");
              }
            },
            text: appTranslation(context).login,
          ),
        );
      },
    );
  }

  Widget _buildSignUpWithText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appTranslation(context).not_have_account,
                style: TextStyle(
                  color: AppColors.description
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
                },
                child: Text(
                  " ${appTranslation(context).register}",
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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
        if (state is UserLoginSuccessState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        return Form(
            key: _formKey,
            child: Column(
              children: [
                _buildEmailTF(),
                _buildPasswordTF(),
                _buildForgotPasswordBtn(),
                _buildRememberMeCheckbox(),
                _buildLoginBtn(),
                _buildSignUpWithText(),
              ],
            ));
      },
    );
  }
}
