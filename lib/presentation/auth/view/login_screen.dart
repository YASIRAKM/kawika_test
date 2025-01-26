import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';
import 'package:kawika_machine_test/core/utils/show_message.dart';
import 'package:kawika_machine_test/core/utils/transparent_dialoge.dart';
import 'package:kawika_machine_test/main.dart';
import 'package:kawika_machine_test/presentation/auth/view_model/view_model.dart';
import 'package:kawika_machine_test/presentation/home/view/bottom_nav_view.dart';
import 'package:kawika_machine_test/widgets/custom_button.dart';
import 'package:kawika_machine_test/widgets/custom_text_field.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(authNotifierProvider, (prev, next) {
      if (next is AsyncLoading) {
        transparentDialoge(context);
      } else {
        if (Navigator.canPop(context)) {
          navigatorKey.currentState!.pop();
        }
      }
      if (next is AsyncData) {
        if (next.value.isAuthenticated) {
          _username.clear();
          _password.clear();
          navigatorKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => BottomNavview(),
            ),
            (route) => false,
          );
        } else {
          showMessage(message: next.value.message);
        }
      }
      if (next is AsyncError) {
        showMessage(message: next.error.toString());
      }
    });
    return Scaffold(
      backgroundColor: AppColors.secondryColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Text(
                "Login",
                style: AppTypography.headline,
              ),
              CustomTextField(
                controller: _username,
                label: "Username",
                validate: true,
              ),
              CustomTextField(
                controller: _password,
                label: "Password",
                validate: true,
                isPassword: true,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?"),
                  )),
              CustomButton(
                buttonTitle: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(authNotifierProvider.notifier).login(
                        username: _username.text.trim(),
                        password: _password.text.trim());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
