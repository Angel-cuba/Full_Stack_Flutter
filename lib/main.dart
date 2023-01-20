import 'package:flutter/material.dart';
import 'package:learning_flutter/ui/home_page.dart';
import 'package:learning_flutter/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import 'ui/theme/theme_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: theme.isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
