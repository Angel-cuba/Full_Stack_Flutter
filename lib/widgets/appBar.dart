import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/notifications/notification_services.dart';
import '../ui/theme/theme_model.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar> {
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
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppBar(
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
            const SizedBox(width: 10),
            const CircleAvatar(
              // radius: 20,
              backgroundImage: AssetImage('images/Angel_NON-bg.png'),
            ),
          ],
        ),
      );
    });
  }
}
