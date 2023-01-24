import 'package:flutter/material.dart';
import 'package:learning_flutter/ui/fonts/dark_fonts.dart';
import 'package:learning_flutter/ui/fonts/light_fonts.dart';
import 'package:learning_flutter/ui/theme/theme_model.dart';
import 'package:provider/provider.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const CustomInput({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (conetxt, theme, child) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: theme.isDarkTheme ? darkTitleStyle : lightTitleStyle,
          ),
          Container(
              height: 52,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.isDarkTheme ? Colors.grey[800] : Colors.white70,
                  border: Border.all(
                    color: theme.isDarkTheme
                        ? Colors.grey[600]!
                        : Colors.grey[100]!,
                    width: 1,
                  )),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    autofocus: false,
                    cursorColor:
                        theme.isDarkTheme ? Colors.grey[500] : Colors.white70,
                    controller: controller,
                    style: theme.isDarkTheme ? darkTitleStyle : lightTitleStyle,
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: theme.isDarkTheme
                            ? darkTitleStyle
                            : lightTitleStyle,
                        contentPadding: const EdgeInsets.only(left: 20),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: theme.isDarkTheme
                              ? Colors.grey[100]!
                              : Colors.grey[800]!,
                          width: 0,
                        ))),
                  )),
                ],
              ))
        ]),
      );
    });
  }
}
