import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_flutter/screens/add_task_bar.dart';
import 'package:learning_flutter/ui/theme/theme_model.dart';
import 'package:learning_flutter/widgets/appBar.dart';
import 'package:learning_flutter/widgets/button.dart';
import 'package:learning_flutter/widgets/datepicker.dart';
import 'package:provider/provider.dart';

import 'fonts/dark_fonts.dart';
import 'fonts/light_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, theme, child) {
      return Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateTime.now().hour < 12
                          ? Text('Good morning',
                              style: theme.isDarkTheme
                                  ? darkSmallHeading
                                  : lightSmallHeading)
                          : DateTime.now().hour < 18
                              ? Text('Good afternoon',
                                  style: theme.isDarkTheme
                                      ? darkSmallHeading
                                      : lightSmallHeading)
                              : Text('Good evening',
                                  style: theme.isDarkTheme
                                      ? darkSmallHeading
                                      : lightSmallHeading),
                      Text(DateFormat.yMMMd().format(DateTime.now()),
                          style: theme.isDarkTheme
                              ? darkSubHeadingStyle
                              : lightSubHeadingStyle),
                      Text('Today',
                          style: theme.isDarkTheme
                              ? darkHeadingStyle
                              : lightHeadingStyle),
                    ],
                  ),
                  CustomButton(
                      label: '+ Add Task',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddTaskBar()));
                      })
                ],
              ),
            ),
            const SizedBox(height: 20),
            const CustomDatePicker()
          ],
        ),
      );
    });
  }
}
