import 'package:flutter/material.dart';
import 'package:learning_flutter/ui/notifications/notification_services.dart';
import 'package:learning_flutter/ui/theme/theme_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LocalNotifications notifications;

  @override
  void initState() {
    notifications = LocalNotifications();
    notifications.initNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, theme, child) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  theme.isDarkTheme
                      ? theme.isDarkTheme = false
                      : theme.isDarkTheme = true;
                  notifications.showNotification(
                      id: 0,
                      title: 'Menu',
                      body: theme.isDarkTheme
                          ? 'You have selected dark theme'
                          : 'Nice choice, light theme');
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
          Text(
            'Brightness: ${theme.isDarkTheme ? 'dark' : 'light'}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ElevatedButton(
              onPressed: () async {
                print('Notify 2');
              },
              child: Text(
                'Notify',
                style: Theme.of(context).textTheme.subtitle1,
              )),
        ]),
      );
    });
  }
}
