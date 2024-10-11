import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/signin_screen.dart';

import '../utils/app_colors.dart';
import '../widgte/background_screen.dart';
import 'forgot_pass_otp_screen.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Set Password',
                  style: textTheme.displaySmall,
                ),
                Text(
                  'Minimum number of password should be 8 letter ',
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

  Column buildBuildSignUPForm() =>_buildVerifyEmailForm();


  void _onTapForgotPassword(){
// TODO: implement on tap password
  }

  RichText _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        style:const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        text: " Have account?",
        children: [
          TextSpan(
              text: 'Sign in',
              style:const TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()..onTap=_onTapSignIn

          ),

        ],
      ),
    );
  }

  Column _buildVerifyEmailForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Password'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Confirm Password'),
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

  void _onTapNextButton(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SigninScreen()), (_) => false);
  }
  void _onTapSignIn() {
    Navigator.pop(context);
  }
}
