import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_flutter/ui/notifications/notification_services.dart';
import 'package:learning_flutter/ui/theme/theme.dart';
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
          elevation: .1,
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
                      title: 'Theme changed',
                      body: theme.isDarkTheme
                          ? 'You have selected dark theme'
                          : 'Nice choice, light theme');
                  //Schedule a notification
                  notifications.scheduleNotification(
                      id: 0,
                      title: 'Scheduled notification',
                      body: 'This is a scheduled notification',
                      seconds: 5);
                },
                icon: Icon(theme.isDarkTheme
                    ? Icons.wb_sunny
                    : Icons.nightlight_round),
                color: theme.isDarkTheme
                    ? Theme.of(context).iconTheme.color
                    : Theme.of(context).iconTheme.color),
            const SizedBox(width: 20),
            const CircleAvatar(
              // radius: 20,
              backgroundImage: AssetImage('images/Angel_NON-bg.png'),
            ),
          ],
        ),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DateTime.now().hour < 12
                  ? const Text('Good morning')
                  : DateTime.now().hour < 18
                      ? const Text('Good afternoon')
                      : const Text('Good evening'),
              Text(DateFormat.yMMMd().format(DateTime.now()),
                  style: subHeadingStyle),
              Text('Today', style: headingStyle),
            ]),
          )
        ]),
      );
    });
  }
}
