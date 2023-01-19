import 'package:flutter/material.dart';
import 'package:learning_flutter/ui/theme/theme_model.dart';
import 'package:provider/provider.dart';

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
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              print('Menu button');
            },
            child: const Icon(
              Icons.nightlight_round,
              color: Colors.white,
              size: 20,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  theme.isDarkTheme
                      ? theme.isDarkTheme = false
                      : theme.isDarkTheme = true;
                },
                icon: Icon(theme.isDarkTheme
                    ? Icons.wb_sunny
                    : Icons.nightlight_round),
                color: theme.isDarkTheme
                    ? Theme.of(context).iconTheme.color
                    : Theme.of(context).iconTheme.color),
            const SizedBox(width: 20),
          ],
        ),
        body: Column(children: [
          Text(
            'Theme data types',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ]),
      );
    });
  }
}
