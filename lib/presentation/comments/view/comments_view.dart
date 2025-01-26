import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';
import 'package:kawika_machine_test/main.dart';
import 'package:kawika_machine_test/presentation/comments/view/widgets/comments_card_tile.dart';
import 'package:kawika_machine_test/presentation/comments/view_model/comments_view_model.dart';
import 'package:kawika_machine_test/presentation/home/view/bottom_nav_view.dart';

import 'package:kawika_machine_test/widgets/error_view_widget.dart';
import 'package:kawika_machine_test/widgets/loading_view_widget.dart';

class CommenstView extends ConsumerWidget {
  const CommenstView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(commentsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondryColor,
        title: Text(
          "Comments",
          style: AppTypography.appBarTitle,
        ),
      ),
      backgroundColor: AppColors.secondryColor,
      body: comments.when(
        data: (data) {
          return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) {
                return CommentsCardTile(
                  commentsModel: data[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 12,
                );
              },
              itemCount: data.length);
        },
        error: (error, stackTrace) {
          return ErrorViewWidget(
            errorMessage: "Error fetching comments",
            onRetry: () {
              navigatorKey.currentState!.pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => BottomNavview(),
                ),
                (route) => false,
              );
            },
          );
        },
        loading: () {
          return LoadingViewWidget();
        },
      ),
    );
  }
}
