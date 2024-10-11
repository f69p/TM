import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/profile_Screen.dart';
import 'package:untitled/screen/signin_screen.dart';

import '../utils/app_colors.dart';

class TaskScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TaskScreenAppbar({
    super.key, this.isProfileScreen=false,
  });
final bool isProfileScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(isProfileScreen){
          return;
        }
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ));
      },
      child: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Foysal Islam',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'foysal@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                      (route) => false);
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
