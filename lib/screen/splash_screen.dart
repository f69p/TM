import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/controllers/auth.dart';
import 'package:untitled/screen/main_bottom_nav_bar_screen.dart';
import 'package:untitled/screen/signin_screen.dart';
import 'package:untitled/utils/asset_image.dart';
import 'package:untitled/widgte/background_screen.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
   void initState(){
       super.initState();
       _moveToNextScreen();
     }

  Future<void>_moveToNextScreen()async{
    await Future.delayed(const Duration(seconds: 3));
    await AuthController.getAccessToken();
    if(AuthController.isLoggedIn()){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>const MainBottomNavBarScreen())
      );
    }else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>const SigninScreen())
      );
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetPath.logoImage),
          ],
        ),
      ),)
    );
  }

}

