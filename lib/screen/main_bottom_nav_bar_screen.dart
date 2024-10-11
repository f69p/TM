import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/cancle_task_screen.dart';
import 'package:untitled/screen/completed_task_screen.dart';
import 'package:untitled/screen/new_task_screen.dart';
import 'package:untitled/screen/progress_task_screen.dart';
import 'package:untitled/utils/app_colors.dart';

import '../widgte/taskManagerAppbar.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex=0;

  final List<Widget>_screen=const[
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskScreenAppbar(),
body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index){
          _selectedIndex=index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.new_label),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box),
            label: 'Completed',
          ),
          NavigationDestination(icon: Icon(Icons.close), label: 'Cancelled'),
          NavigationDestination(icon: Icon(Icons.padding), label: 'Progress'),
        ],
      ),
    );
  }
}


