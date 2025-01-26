
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';

class ProfileHandleTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData iconData;

  const ProfileHandleTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: AppColors.primaryColor,
          size: 20,
        ),
        title: Text(
          title,
          style: AppTypography.cardTitle,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: AppColors.primaryColor.withAlpha((.5 * 255).toInt()),
        ),
      ),
    );
  }
}
