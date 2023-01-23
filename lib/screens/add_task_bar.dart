import 'package:flutter/material.dart';
import 'package:learning_flutter/widgets/appBar.dart';

class AddTaskBar extends StatefulWidget {
  const AddTaskBar({super.key});

  @override
  State<AddTaskBar> createState() => _AddTaskBarState();
}

class _AddTaskBarState extends State<AddTaskBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_outlined),
      ),
      body: const Center(
        child: Text('Add Task Bar'),
      ),
    );
  }
}
