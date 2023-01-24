import 'package:flutter/material.dart';
import 'package:learning_flutter/ui/fonts/light_fonts.dart';
import 'package:learning_flutter/ui/theme/theme_model.dart';
import 'package:learning_flutter/widgets/appBar.dart';
import 'package:learning_flutter/widgets/input.dart';
import 'package:provider/provider.dart';

import '../ui/fonts/dark_fonts.dart';

class AddTaskBar extends StatefulWidget {
  const AddTaskBar({super.key});

  @override
  State<AddTaskBar> createState() => _AddTaskBarState();
}

class _AddTaskBarState extends State<AddTaskBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: ((context, theme, child) {
      var controller;
      return Scaffold(
        appBar: const CustomAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_outlined),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Add Task',
                      style: theme.isDarkTheme
                          ? darkHeadingStyle
                          : lightHeadingStyle),
                  SizedBox(height: 20),
                  CustomInput(
                      title: 'Title',
                      hint: 'Enter your title',
                      controller: controller),
                ],
              ),
            )),
      );
    }));
  }
}
