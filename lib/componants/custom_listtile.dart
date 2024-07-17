import 'package:flutter/material.dart';

import 'package:whatsapp_app/Helpers/text_theme.dart';

// ignore: must_be_immutable
class Common_listtile extends StatelessWidget {
  String title;
  String icon;
  String? subtitle;
  Icon? trailing_icon;
  Color? iconcolor;
  TextStyle? textstyle, textstyle1;
  Function? onPressed;

  Common_listtile(
      {super.key,
      required this.title,
      this.subtitle,
      required this.icon,
      this.iconcolor,
      this.textstyle,
      this.trailing_icon,
      this.textstyle1,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onPressed!();
      },
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            (icon),
            color: iconcolor,
          )
        ],
      ),
      title: Text(title,
          style: textstyle == null ? GetTextTheme.fs14_regular : textstyle),
      subtitle: subtitle == null
          ? SizedBox()
          : Text(subtitle!,
              style:
                  textstyle1 == null ? GetTextTheme.fs14_regular : textstyle1),
      trailing: trailing_icon,
    );
  }
}
