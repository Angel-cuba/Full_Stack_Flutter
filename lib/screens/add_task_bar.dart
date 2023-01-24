import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // selectedDate = DateTime.now();
    super.initState();
  }

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
                  CustomInput(
                      title: 'Title',
                      hint: 'Enter your title',
                      controller: controller),
                  CustomInput(
                      title: 'Description',
                      hint: 'Enter your description',
                      controller: controller),
                  CustomInput(
                      title: 'Date',
                      hint: DateFormat.yMMMd().format(selectedDate),
                      widget: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            void getDateFromUser() async {
                              final DateTime? pickerDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2025),
                                  initialDatePickerMode: DatePickerMode.day,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: theme.isDarkTheme
                                              ? Colors.black87
                                              : Colors.teal,
                                          onPrimary: Colors.white70,
                                          surface: Colors.blue,
                                          onSurface: Colors.black,
                                        ),
                                        dialogBackgroundColor: Colors.white,
                                      ),
                                      child: child!,
                                    );
                                  },
                                  // Here we are disabling the weekends from the calendar
                                  // Just saturday and sunday
                                  selectableDayPredicate: (DateTime val) {
                                    if (val.weekday == 6 || val.weekday == 7) {
                                      return false;
                                    }
                                    return true;
                                  });
                              if (pickerDate != null) {
                                setState(() {
                                  selectedDate = pickerDate;
                                });
                                print(selectedDate);
                              }
                            }

                            getDateFromUser();
                          }
                          // },
                          ),
                      controller: controller),
                ],
              ),
            )),
      );
    }));
  }
}

// void _getDateFromUser(BuildContext context) async {
//   final DateTime? pickerDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2022));
//   if (pickerDate != null && pickerDate != selectedDate) {
//     setState(() {
//       selectedDate = pickerDate;
//     });
//   }
// }
