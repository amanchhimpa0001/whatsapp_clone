import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

// ignore: must_be_immutable
class leadinghidelisttile extends StatelessWidget {
  String title;
  String? subtitle;
  TextStyle? textstyle, textstyle1;

  Widget? trailinIcon;
  Function? onPressed;
  Function? trailing;
  leadinghidelisttile(
      {super.key,
      required this.title,
      this.subtitle,
      this.textstyle,
      this.textstyle1,
      this.trailing,
      this.onPressed,
      this.trailinIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onPressed!(),
      horizontalTitleGap: 20,
      visualDensity: VisualDensity(
        horizontal: 3,
      ),
      title: Text(title,
          style: textstyle == null ? GetTextTheme.fs14_regular : textstyle),
      subtitle: subtitle == null
          ? SizedBox()
          : Text(subtitle!,
              style:
                  textstyle1 == null ? GetTextTheme.fs14_regular : textstyle1),
      trailing: trailinIcon != null
          ? IconButton(
              onPressed: () {
                trailing!();
              },
              icon: trailinIcon!)
          : SizedBox(),
    );
  }
}
