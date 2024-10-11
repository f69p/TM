import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled/screen/reset_pass_screen.dart';
import 'package:untitled/screen/signin_screen.dart';

import '../utils/app_colors.dart';
import '../widgte/background_screen.dart';

class ForgotOTP extends StatefulWidget {
  const ForgotOTP({super.key});

  @override
  State<ForgotOTP> createState() => _ForgotOTPState();
}

class _ForgotOTPState extends State<ForgotOTP> {
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
                  'Your Email Address',
                  style: textTheme.displaySmall,
                ),
                Text(
                  'A 6 digits verification otp has been sent to your email address',
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
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,


          appContext: context,
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassScreen()));
  }
  void _onTapSignIn() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SigninScreen()), (_) => false);
  }
}
