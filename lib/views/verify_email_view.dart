import 'package:flutter/material.dart';
import 'package:my_notes/constants/colors.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  VerifyEmailViewState createState() => VerifyEmailViewState();
}

class VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify email',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: AppColors.textColor,
        backgroundColor: AppColors.appbarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "We've sent you an email verification. Please open it to verify your account.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "If you haven't received a verification email yet, press the button below",
              textAlign: TextAlign.center,
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Spacer(),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              child: const Text(
                'Send email verification',
                style: TextStyle(color: Color.fromARGB(255, 94, 47, 30)),
              ),
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text(
                'Restart',
                style: TextStyle(color: Color.fromARGB(255, 94, 47, 30)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
