import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/theme_changer.dart';

class Theme_dailog extends StatefulWidget {
  const Theme_dailog({super.key});

  @override
  State<Theme_dailog> createState() => _Theme_dailogState();
}

class _Theme_dailogState extends State<Theme_dailog> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Choose theme",
                style: GetTextTheme.fs18_medium,
              ),
            ),
            RadioListTile<ThemeMode>(
              title: Text('Light Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.light,
              onChanged: themeChanger.setTheme,
            ),
            RadioListTile<ThemeMode>(
              title: Text('Dark Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.dark,
              onChanged: themeChanger.setTheme,
            ),
            RadioListTile<ThemeMode>(
              title: Text('System Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.system,
              onChanged: themeChanger.setTheme,
            )
          ],
        ));
  }
}
