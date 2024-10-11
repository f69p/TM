import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/data/models/network_respons.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils-data/urls.dart';
import 'package:untitled/widgte/snack_bar_message.dart';

import '../utils/app_colors.dart';
import '../widgte/background_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _EmaileditingController = TextEditingController();
  final TextEditingController _FirstNameeditingController =
      TextEditingController();
  final TextEditingController _LastNameeditingController =
      TextEditingController();
  final TextEditingController _MobileeditingController =
      TextEditingController();
  final TextEditingController _PasswordeditingController =
      TextEditingController();
  bool _inProgres = false;

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
                  'Join With Us',
                  style: textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildSignUpForm(),
                const SizedBox(height: 16),
                Center(
                  child: _buildHaveAccountSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildSignUpForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _EmaileditingController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'email'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _FirstNameeditingController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'First name'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter first Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _LastNameeditingController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Last name'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter Last Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _MobileeditingController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Mobile'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _PasswordeditingController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter pass';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: !_inProgres,
            replacement: const CircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapNextButton,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    _inProgres = true;
    setState(() {});
    Map<String, dynamic> requesrbody = {
      "email": _EmaileditingController.text.trim(),
      "firstName": _FirstNameeditingController.text.trim(),
      "lastName": _LastNameeditingController.text.trim(),
      "mobile": _MobileeditingController.text.trim(),
      "password": _PasswordeditingController.text.trim(),
      "photo": ""
    };

    NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.registrstion, body: requesrbody);
    _inProgres = false;
    setState(() {});

    if (response.isSuccess) {
      showSnackBarMessage(context, 'New user created');
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  void _onTapNextButton() {
    if (_formkey.currentState!.validate()) {
      _signUp();
    }
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }

  void dispose() {
    _MobileeditingController.dispose();
    _LastNameeditingController.dispose();
    _FirstNameeditingController.dispose();
    _PasswordeditingController.dispose();
    _EmaileditingController.dispose();
  }
}
