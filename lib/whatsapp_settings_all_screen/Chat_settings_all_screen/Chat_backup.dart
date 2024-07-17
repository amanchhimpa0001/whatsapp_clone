import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/custom_listtile.dart';
import 'package:whatsapp_app/componants/leadinghide_listtile.dart';
import 'package:whatsapp_app/componants/listtile.dart';
import 'package:whatsapp_app/componants/switch_tile.dart';
import 'package:whatsapp_app/componants/text_btn.dart';

class Chat_backup_screen extends StatelessWidget {
  const Chat_backup_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Chat backup",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listtile(
                textstyle: GetTextTheme.fs12_regular
                    .copyWith(color: AppColors.greyColor),
                textstyle1: GetTextTheme.fs10_regular
                    .copyWith(color: AppColors.greyColor),
                onPressed: () {},
                title: 'Last Backup',
                icon: Appicons.backup,
                subtitle:
                    "Back up your messages and media to Google Drive. You can restore them when you reinstall WhatsApp. Your messages will also back up to your phone’s internal storage.",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Text(
                      "Local: 2:00 am",
                      style: GetTextTheme.fs12_regular,
                    ),
                    Text(
                      "Google Drive: Never",
                      style: GetTextTheme.fs12_regular,
                    ),
                    Gap(20),
                    Text_btn(
                      txt: "BACK UP",
                      txtColor: AppColors.blackColor,
                      ontap: () {},
                      btnColor: AppColors.green,
                    )
                  ],
                ),
              ),
              Divider(),
              listtile(
                textstyle: GetTextTheme.fs12_regular
                    .copyWith(color: AppColors.greyColor),
                textstyle1: GetTextTheme.fs10_regular
                    .copyWith(color: AppColors.greyColor),
                onPressed: () {},
                title: 'Google Drive settings',
                icon: Appicons.Google_Drive,
                subtitle:
                    "Messages and media backed up in Google Drive are not protected by WhatsApp end-to-end encryption.",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    leadinghidelisttile(
                      onPressed: () {},
                      title: "Back up to Google Drive",
                      subtitle: "Never",
                      textstyle: GetTextTheme.fs13_regular
                          .copyWith(color: AppColors.blackColor),
                      textstyle1: GetTextTheme.fs12_regular,
                    ),
                    leadinghidelisttile(
                      onPressed: () {},
                      title: "Google Account",
                      subtitle: "None selected",
                      textstyle: GetTextTheme.fs13_regular
                          .copyWith(color: AppColors.blackColor),
                      textstyle1: GetTextTheme.fs12_regular,
                    ),
                    leadinghidelisttile(
                      onPressed: () {},
                      title: "Back up over",
                      subtitle: "Wi-Fi only",
                      textstyle: GetTextTheme.fs13_regular
                          .copyWith(color: AppColors.blackColor),
                      textstyle1: GetTextTheme.fs12_regular,
                    ),
                    Common_switch_tile(
                      title: "Include videos",
                      boolvalue: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
