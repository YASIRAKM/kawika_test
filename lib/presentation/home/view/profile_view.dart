import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';
import 'package:kawika_machine_test/core/utils/confirm_dialoge.dart';
import 'package:kawika_machine_test/core/utils/show_message.dart';
import 'package:kawika_machine_test/main.dart';
import 'package:kawika_machine_test/presentation/auth/view_model/view_model.dart';

import 'package:kawika_machine_test/presentation/home/view/wigets/profile_data_tile.dart';
import 'package:kawika_machine_test/presentation/home/view/wigets/profile_list_tile.dart';
import 'package:kawika_machine_test/presentation/home/view_model/profile_view_model.dart';

import 'package:kawika_machine_test/widgets/error_view_widget.dart';
import 'package:kawika_machine_test/widgets/loading_view_widget.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileProvider);
    return Scaffold(
      backgroundColor: AppColors.secondryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondryColor,
        title: Text(
          "Profile",
          style: AppTypography.appBarTitle,
        ),
      ),
      body: user.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              spacing: 12,
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: -10,
                      right: 10,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ),
                    ProfileDatWidgetCard(
                      data: data,
                    ),
                  ],
                ),
                Divider(
                  indent: 80,
                  thickness: .5,
                  endIndent: 80,
                ),
                Column(
                  spacing: 4,
                  children: [
                    ProfileHandleTile(
                      iconData: Icons.settings,
                      onTap: () {},
                      title: "Settings",
                    ),
                    Divider(
                      indent: 100,
                      endIndent: 100,
                    ),
                    ProfileHandleTile(
                      iconData: Icons.admin_panel_settings_sharp,
                      onTap: () {},
                      title: "F A Q",
                    ),
                    Divider(
                      indent: 100,
                      endIndent: 100,
                    ),
                    ProfileHandleTile(
                      iconData: Icons.support,
                      onTap: () {},
                      title: "Support",
                    ),
                    Divider(
                      indent: 100,
                      endIndent: 100,
                    ),
                    ProfileHandleTile(
                      iconData: Icons.logout_rounded,
                      onTap: () {
                        confirmDialoge(
                          context: context,
                          title: "Logout",
                          content: "Do you want to logout?",
                          onPressed: () async {
                            bool res = await ref
                                .read(authNotifierProvider.notifier)
                                .logout();
                            if (res) {
                              navigatorKey.currentState!.pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Splash(),
                                ),
                                (route) => false,
                              );
                            } else {
                              showMessage(message: "Failed to logout");
                            }
                          },
                        );
                      },
                      title: "Logout",
                    ),
                  ],
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return ErrorViewWidget(
            errorMessage: "Unable to fetch user",
            onRetry: () {
              ref.read(profileProvider.notifier).getuser();
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
