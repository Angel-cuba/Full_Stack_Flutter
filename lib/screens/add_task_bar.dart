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

  String _endTime = DateFormat("HH:mm")
      .format(DateTime.now().add(const Duration(minutes: 5)))
      .toString();
  String _startTime = DateFormat("HH:mm").format(DateTime.now()).toString();

  int _selectedReminder = 5;
  final List<int> _reminderList = [5, 10, 15, 30, 60];

  String _selectedRepeat = 'Never';
  final List<String> _repeatList = [
    'Never',
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];

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
                              }
                            }

                            getDateFromUser();
                          }),
                      controller: controller),
                  Row(
                    children: [
                      Expanded(
                          child: CustomInput(
                              title: 'Start Date',
                              hint: _startTime,
                              widget: IconButton(
                                icon: const Icon(Icons.access_time_rounded),
                                onPressed: () {
                                  _getStartTime(theme);
                                },
                              ),
                              controller: controller)),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: CustomInput(
                              title: 'End Date',
                              hint: _endTime,
                              widget: IconButton(
                                  icon: const Icon(Icons.access_time_rounded),
                                  onPressed: () {
                                    _getEndTime(theme);
                                  }),
                              controller: controller)),
                    ],
                  ),
                  CustomInput(
                    title: 'Remind',
                    hint: "$_selectedReminder minutes before",
                    controller: controller,
                    widget: DropdownButton(
                      value: _selectedReminder,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 32,
                      elevation: 6,
                      style:
                          theme.isDarkTheme ? lightTitleStyle : lightTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: theme.isDarkTheme
                          ? Colors.black87
                          : Colors.teal.shade700,
                      items: _reminderList.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          _selectedReminder = value!;
                        });
                      },
                    ),
                  ),
                  CustomInput(
                    title: 'Repeat',
                    hint: _selectedRepeat,
                    controller: controller,
                    widget: DropdownButton(
                      value: _selectedRepeat,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 32,
                      elevation: 6,
                      style:
                          theme.isDarkTheme ? lightTitleStyle : lightTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: theme.isDarkTheme
                          ? Colors.black87
                          : Colors.teal.shade700,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      },
                      items: _repeatList.map((String? value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                              '$value' == 'Never'
                                  ? 'Never repeat'
                                  : '$value' == 'Daily'
                                      ? 'Repeat daily'
                                      : '$value' == 'Weekly'
                                          ? 'Repeat weekly'
                                          : '$value' == 'Monthly'
                                              ? 'Repeat monthly'
                                              : '$value' == 'Yearly'
                                                  ? 'Repeat yearly'
                                                  : '',
                              style: theme.isDarkTheme
                                  ? lightTitleStyle
                                  : lightTitleStyle),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )),
      );
    }));
  }

  _getStartTime(theme) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: theme.isDarkTheme ? Colors.black87 : Colors.black,
                onPrimary: Colors.white70,
                surface: Colors.blue,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });
    if (pickedTime != null) {
      setState(() {
        _startTime = pickedTime.format(context);
      });
    }
  }

  _getEndTime(theme) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: theme.isDarkTheme ? Colors.black87 : Colors.teal,
                onPrimary: Colors.white70,
                surface: Colors.blue,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });
    if (pickedTime != null) {
      setState(() {
        _endTime = pickedTime.format(context);
      });
    }
  }
}
