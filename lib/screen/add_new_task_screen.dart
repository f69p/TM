import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgte/taskManagerAppbar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const TaskScreenAppbar() ,
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 42,),
              Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 26),
              TextFormField(
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title'
                ),
              ),
             const SizedBox(height: 16),
              TextFormField(
                maxLines: 5,
                decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description',
        
                ),
              ),
             const SizedBox(height: 16),
        
              ElevatedButton(onPressed: (){}, child:const Icon(Icons.arrow_forward_ios),),
            ],
          ),
        ),
      ),

    );
  }
}
