import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterCircularProgressIndecator extends StatelessWidget {
  const CenterCircularProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: CircularProgressIndicator(),
    );
  }
}
