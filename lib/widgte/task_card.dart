import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/app_colors.dart';

class taskCard extends StatefulWidget {
  const taskCard({
    super.key,
  });

  @override
  State<taskCard> createState() => _taskCardState();
}

class _taskCardState extends State<taskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title of the Task',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Text('Description of task'),
            const Text(
              'Date: 12/12/2002',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTaskChip(),
                Wrap(
                  children: [
                    IconButton(
                      onPressed:_onTapEditButton,
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: _onTapDeleteButton,
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
void _onTapEditButton(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title:Text('Edit Status') ,
        content:Column(
          mainAxisSize: MainAxisSize.min,
          children: ['New',  'Completed' 'Cancelled', 'Progress'].map((e) {
            return ListTile(
              onTap: (){

              },
              title:Text(e),
            );
          }).toList()
        ) ,
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancle')),
          TextButton(onPressed: (){}, child: Text('OKay')),
        ],
      );
    });
}
void _onTapDeleteButton(){

}
 
  
  Widget _buildTaskChip() {
    return Chip(
      label: Text('New'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.themeColor),
      ),
    );
  }}