import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/task_summary_card.dart';
import 'package:untitled/utils/app_colors.dart';

import '../widgte/task_card.dart';
import 'add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySummary(),
          Expanded(child:
          ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
            return taskCard();
          }, separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 0,);  },))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Padding _buildSummarySummary() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TaskSummaryCard(title: 'New', count: 9),
            TaskSummaryCard(title: 'Completed', count: 9),
            TaskSummaryCard(title: 'Cancelled', count: 9),
            TaskSummaryCard(title: 'Progress', count: 9),
          ],
        ),
      ),
    );
  }

  void _onTapAddFab() {}
}


