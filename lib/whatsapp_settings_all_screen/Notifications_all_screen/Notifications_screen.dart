import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/custom_dailog_radio_button.dart';
import 'package:whatsapp_app/componants/dailog_radio_dummydata.dart';
import 'package:whatsapp_app/componants/leadinghide_listtile.dart';
import 'package:whatsapp_app/componants/switch_tile.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Notifications_all_screen/Notifications_all_dailog/Pop_up_notifications_dailog.dart';

import '../../Helpers/app_service.dart';

class Notifications_screen extends StatefulWidget {
  const Notifications_screen({super.key});

  @override
  State<Notifications_screen> createState() => _Notifications_screenState();
}

class _Notifications_screenState extends State<Notifications_screen> {
  String lightLanguage = "None";
  String vibrate = "Default";
  // String vibrateMode = "Default";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Notifications",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              Common_switch_tile(
                title: "Conversation tones",
                boolvalue: true,
                subtitle: "Play  sounds for incoming and outgoing message.",
              ),
              Gap(10),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Massages"),
              ),
              leadinghidelisttile(
                onPressed: () {},
                title: "Notification tone",
                subtitle: "Default (WaterDrop_preview.ogg)",
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              leadinghidelisttile(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => radio_dialog_singleSelect(
                        selected: vibrate,
                        onDone: (v) => setState(() => vibrate = v),
                        dialogTital: "Vibrate",
                        buttonshow: false,
                        // dialogSubtitle: "sSBJKsbkxxs",
                        data: dailog_dummydata_radio_button().vibrate_list),
                  );
                },
                title: "Vibrate",
                subtitle: vibrate,
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              leadinghidelisttile(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Pop_up_notifications_dailog(),
                  );
                },
                title: "Popup notification",
                subtitle: "Not Aviable",
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              leadinghidelisttile(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => radio_dialog_singleSelect(
                        selected: lightLanguage,
                        onDone: (v) => setState(() => lightLanguage = v),
                        dialogTital: "Light",
                        buttonshow: false,
                        // dialogSubtitle: "sSBJKsbkxxs",
                        data: dailog_dummydata_radio_button().light_list),
                  );
                },
                title: "Light",
                subtitle: lightLanguage,
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              Common_switch_tile(
                title: "Use high priorty notification",
                boolvalue: true,
                subtitle:
                    "show previews of notification at the top of  the screen ",
              ),
              Divider(),
              Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Groups"),
              ),
              leadinghidelisttile(
                onPressed: () {},
                title: "Notification tone",
                subtitle: "Default (WaterDrop_preview.ogg)",
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              leadinghidelisttile(
                onPressed: () {},
                title: "Vibrate",
                subtitle: "Default",
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              leadinghidelisttile(
                onPressed: () {},
                title: "Popup notification",
                subtitle: "Not Aviable",
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              leadinghidelisttile(
                onPressed: () {},
                title: "Light",
                subtitle: "Green",
                textstyle: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.blackColor),
                textstyle1: GetTextTheme.fs12_regular,
              ),
              Common_switch_tile(
                title: "Use high priorty notification",
                boolvalue: true,
                subtitle:
                    "show previews of notification at the top of  the screen ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
