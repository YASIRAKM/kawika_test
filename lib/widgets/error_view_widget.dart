import 'package:flutter/material.dart';
import 'package:kawika_machine_test/widgets/custom_button.dart';

class ErrorViewWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  const ErrorViewWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Icon(
              Icons.warning_rounded,
              size: 60,
            ),
            Text(errorMessage),
            CustomButton(
                height: 40,
                width: 150,
                onPressed: onRetry,
                buttonTitle: "Retry")
          ],
        ),
      ),
    );
  }
}
