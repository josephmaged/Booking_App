import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_primary_button.dart';
import 'account_widget.dart';

class ProfileAlertDialog extends StatelessWidget {
  const ProfileAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 130,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              AccountWidget(
                title: "Email",
                text: "admin@admin.com  ",
              ),
              Divider(
                color: Colors.black38,
              ),
              AccountWidget(
                title: "phone",
                text: "+965 6906 6111",
              ),
            ]),
      ),
      title: Text(
        "Call Us",
        style: Theme.of(context).textTheme.headline5,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: CustomPrimaryButton(
            height: 45,
            text: "Ok",
            press: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
