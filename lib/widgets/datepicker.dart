import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/ui/theme/theme_model.dart';
import 'package:provider/provider.dart';

import '../ui/fonts/dark_fonts.dart';
import '../ui/fonts/light_fonts.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, theme, child) {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: DatePicker(
          DateTime.now(),
          width: 60,
          height: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue.shade500,
          selectedTextColor: Colors.white60,
          dateTextStyle:
              theme.isDarkTheme ? darkSubHeadingStyle : lightSubHeadingStyle,
          onDateChange: (date) {
            // New date selected
            // setState(() {
            _selectedDate = date;
            print(_selectedDate);
            // });
          },
        ),
      );
    });
  }
}
