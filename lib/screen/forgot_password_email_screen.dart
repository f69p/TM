import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgte/background_screen.dart';
import 'forgot_pass_otp_screen.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Your Email Address',
                  style: textTheme.displaySmall,
                ),
                Text(
                  'A 6 digits verification otp will be sent to your email address',
                  style: textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                buildBuildSignUPForm(),
                const SizedBox(height: 16),
                _buildHaveAccountSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildBuildSignUPForm() => _buildVerifyEmailForm();

  void _onTapForgotPassword() {
// TODO: implement on tap password
  }

  RichText _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        text: " Have account?",
        children: [
          TextSpan(
              text: 'Sign in',
              style: const TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignIn),
        ],
      ),
    );
  }

  Column _buildVerifyEmailForm() {
    return Column(
      children: [
        TextFormField(
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'email'),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: _onTapNextButton,
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  void _onTapNextButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotOTP()));
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }
}
