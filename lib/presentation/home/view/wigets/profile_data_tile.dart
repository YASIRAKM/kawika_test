import 'package:flutter/material.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';
import 'package:kawika_machine_test/presentation/auth/model/user_model.dart';
import 'package:kawika_machine_test/widgets/custom_image_view.dart';

class ProfileDatWidgetCard extends StatelessWidget {
  final UserModel data;
  const ProfileDatWidgetCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CustomImageView(
            height: 100,
            width: 100,
            image: data.image,
          ),
        ),
        Divider(
          thickness: .5,
          indent: 160,
          endIndent: 160,
        ),
        Text(
          "${data.firstName} ${data.lastName}",
          style: AppTypography.title,
        ),
        Text(data.email, style: AppTypography.subTitle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Username : ${data.username}",
              style: AppTypography.body1,
            ),
            Text(
              "Gender : ${data.gender}",
              style: AppTypography.body1,
            ),
          ],
        )
      ],
    );
  }
}
