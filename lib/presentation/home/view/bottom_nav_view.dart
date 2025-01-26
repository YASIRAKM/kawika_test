import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/presentation/comments/view/comments_view.dart';
import 'package:kawika_machine_test/presentation/home/view/profile_view.dart';
import 'package:kawika_machine_test/presentation/home/view_model/bottom_index_view_model.dart';

class BottomNavview extends ConsumerWidget {
  const BottomNavview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(bottomIndexProvider);
    return Scaffold(
      body: selectedIndex == 0 ? CommenstView() : ProfileView(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            ref.read(bottomIndexProvider.notifier).state = value;
          },
          selectedItemColor: AppColors.selectedItemColor,
          backgroundColor: AppColors.secondryColor,
          unselectedItemColor: AppColors.unselectedItemColor,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment), label: "Comments"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
