import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class Security_scrren extends StatefulWidget {
  const Security_scrren({super.key});

  @override
  State<Security_scrren> createState() => _Security_scrrenState();
}

class _Security_scrrenState extends State<Security_scrren> {
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Security",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Center(child: Image.asset(Getimage.security)),
              Gap(40),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text:
                        "WhatsApp secures your conversations with\nend-to-end encryption. This means you\nmessages, call and status updates stay\nbetween you and the people you choose. Not\neven whatsApp can read or listen to them.",
                    style: GetTextTheme.fs14_regular),
                TextSpan(
                    text: "Learn more",
                    style: GetTextTheme.fs14_regular.copyWith(
                      color: AppColors.blue,
                    ))
              ])),
              Gap(40),
              Divider(),
              Gap(15),
              ListTile(
                title: Text(
                  "Show security notifications",
                  style: GetTextTheme.fs14_regular,
                ),
                subtitle: Text(
                  "Get notified when your security code changes for contact. Learn more",
                  style: GetTextTheme.fs10_regular,
                ),
                trailing: Switch(
                  inactiveThumbColor: AppColors.greyscale,
                  activeColor: AppColors.grey,
                  value: istrue,
                  onChanged: (value) {
                    setState(() {
                      istrue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
