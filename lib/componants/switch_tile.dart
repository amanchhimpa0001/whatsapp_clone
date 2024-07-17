import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

// ignore: must_be_immutable
class Common_switch_tile extends StatefulWidget {
  String title;
  String? subtitle;
  bool boolvalue;

  Common_switch_tile({
    super.key,
    required this.title,
    required this.boolvalue,
    this.subtitle,
  });

  @override
  State<Common_switch_tile> createState() => _Common_switch_tileState();
}

class _Common_switch_tileState extends State<Common_switch_tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: GetTextTheme.fs14_regular.copyWith(color: AppColors.blackColor),
      ),
      visualDensity: VisualDensity.comfortable,
      subtitle: widget.subtitle == null
          ? SizedBox()
          : Text(
              widget.subtitle.toString(),
              style: GetTextTheme.fs13_regular
                  .copyWith(color: AppColors.greyColor),
            ),
      trailing: Padding(
        padding: const EdgeInsets.only(bottom: 13),
        child: Switch(
            value: widget.boolvalue,
            activeColor: AppColors.green,
            inactiveThumbColor: AppColors.grey,
            onChanged: (newvalue) {
              setState(() {
                widget.boolvalue = !widget.boolvalue;
              });
            }),
      ),
    );
  }
}
