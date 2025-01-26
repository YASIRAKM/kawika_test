import 'package:flutter/material.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';
import 'package:kawika_machine_test/presentation/comments/model/comments_model.dart';

class CommentsCardTile extends StatelessWidget {
  final CommentsModel commentsModel;
  const CommentsCardTile({
    super.key,
    required this.commentsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: AppColors.secondryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                color: Colors.grey.shade300,
                blurRadius: 1),
            BoxShadow(
                offset: Offset(1, -1),
                color: Colors.grey.shade300,
                blurRadius: 1)
          ]),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commentsModel.name,
            style: AppTypography.cardTitle,
          ),
          Text(commentsModel.email, style: AppTypography.cardSubTitle),
          Text(
            commentsModel.body,
            style: AppTypography.cardContent,
          ),
        ],
      ),
    );
  }
}
