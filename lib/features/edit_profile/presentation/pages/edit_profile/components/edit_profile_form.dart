import 'package:booking_app_algoriza/core/blocs/profile/profile_cubit.dart';
import 'package:booking_app_algoriza/core/blocs/update_profile/update_profile_cubit.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/blocs/update_profile/update_profile_state.dart';
import '../../../../../../core/component/constants.dart';
import '../../../../../../core/utils/validator.dart';
import '../../../../../../core/widgets/custom_form_field.dart';
import '../../../../../../core/widgets/custom_primary_button.dart';
import 'add_image_widgets.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  @override
  void initState() {
    ProfileCubit.get(context).userProfile();
    name.text = ProfileCubit.get(context).user!.name!;
    email.text = ProfileCubit.get(context).user!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
        if (state is UserUpdateProfileLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
        if (state is UserUpdateProfileSuccessState) {
          Navigator.of(context).pop();
          // .push(MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                UpdateProfileCubit.get(context).pickImage();
              },
              child: AddImageWidget(
                imageFile: UpdateProfileCubit.get(context).image,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomFormField(
                      controller: name,
                      label: appTranslation(context).username,
                      hintText: appTranslation(context).enter_name,
                      keyboardType: TextInputType.name,
                      validator: (value) => Validator.validateEmpty(value!),
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.description,
                      ),
                    ),
                    CustomFormField(
                      controller: email,
                      label: appTranslation(context).email,
                      hintText: appTranslation(context).enter_email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => Validator.validateEmail(value!),
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: AppColors.description,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomPrimaryButton(
                      text: appTranslation(context).edit_profile,
                      press: () async {
                        UpdateProfileCubit.get(context).image != null
                            ? UpdateProfileCubit.get(context).updateProfile(
                                email: email.text, name: name.text, image: UpdateProfileCubit.get(context).image)
                            : UpdateProfileCubit.get(context).updateProfile(
                                email: email.text,
                                name: name.text,
                              );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
