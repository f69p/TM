import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/data/models/network_respons.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/screen/sign_up_screen.dart';
import 'package:untitled/utils/app_colors.dart';
import 'package:untitled/widgte/background_screen.dart';
import 'package:untitled/widgte/center_circular_indicator.dart';
import 'package:untitled/widgte/snack_bar_message.dart';

import '../data/utils-data/urls.dart';
import 'forgot_password_email_screen.dart';
import 'main_bottom_nav_bar_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
 final TextEditingController  _EmailtextEditingController = TextEditingController();
 final TextEditingController _PassTEController = TextEditingController();
bool _inProgress=true;
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
                  'Get Started With',
                  style: textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildSignInForm(),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _onTapForgotPassword,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                _buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapForgotPassword() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>const ForgotEmail()));
  }

  RichText _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        text: "Don't have an account?",
        children: [
          TextSpan(
              text: 'Sign Up',
              style: const TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignUp),
        ],
      ),
    );
  }

  Widget _buildSignInForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _EmailtextEditingController,
            decoration:
               const InputDecoration(border: OutlineInputBorder(), labelText: 'email'),
            validator: (String? value){
              if(value?.isEmpty??true){
                return'Enter a valid email';
              }
              return null;
            }
          ),
        const SizedBox(height: 16),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _PassTEController,
            decoration:const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
            validator: (String?value){
              if(value?.isEmpty??true){
                return 'Enter Pass';
              }
              if(value!.length<=6){
                return'Enter a pass more then 6 ch';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: _inProgress==true,
            replacement:const CenterCircularProgressIndecator(),
            child: ElevatedButton(
              onPressed: _onTapNextButton,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
   if(!_formkey.currentState!.validate()){
     return;
   }
   _signIn();
  }
Future<void> _signIn() async {
  _inProgress = true;
  setState(() {});
  Map<String,dynamic>requestBody={
    "email":_EmailtextEditingController.text.trim(),
    "password":_PassTEController.text,
  };
  final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.login,body: requestBody);
  _inProgress = false;
  setState(() {});
  if (response.isSuccess) {
    Navigator.pushAndRemoveUntil( context,
        MaterialPageRoute(builder: (context) =>const MainBottomNavBarScreen()), (
            route) => false);
  }

   else{
     showSnackBarMessage(context,response.errorMessage,true);

  }
}
  
  
  void _onTapSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>const SignUpScreen()));
  }
}
