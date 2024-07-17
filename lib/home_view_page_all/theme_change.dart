import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';

import 'package:whatsapp_app/theme_changer.dart';

class themechange extends StatefulWidget {
  const themechange({Key? key}) : super(key: key);

  @override
  _themechangeState createState() => _themechangeState();
}

class _themechangeState extends State<themechange> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('aman bhai '),
      ),
      body: Column(
        children: <Widget>[
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.light,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.dark,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.system,
            onChanged: themeChanger.setTheme,
          ),
        ],
      ),
    );
  }
}
