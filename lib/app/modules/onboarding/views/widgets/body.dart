import 'package:flutter/material.dart';
import 'onboarding_button.dart';
import 'welcome_box.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // Background - Container - Box
        WelcomeBox(),
        // Get - Started - And - Login - Button
        OnboardingButtons(),
      ],
    );
  }
}
