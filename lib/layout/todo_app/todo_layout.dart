import 'package:flutter/material.dart';

class TodoLayout extends StatelessWidget {
  const TodoLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Todo Layout'),),
      body:const Center(
        child:  Text('Todo Layout'),
      ),
    );
  }
}
