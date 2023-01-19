import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(children: const [
        Text(
          'Theme data types',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ]),
    );
  }
}

_appBar() {
  return AppBar(
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
    actions: const [
      Icon(
        Icons.person,
        color: Colors.white,
        size: 20,
      ),
      SizedBox(width: 20),
    ],
  );
}
