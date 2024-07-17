import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/custom_dailog_radio_button.dart';
import 'package:whatsapp_app/componants/dailog_radio_dummydata.dart';
import 'package:whatsapp_app/componants/listtile.dart';
import 'package:whatsapp_app/componants/switch_tile.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Chat_settings_all_screen/App_language.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Chat_settings_all_screen/theme_screen.dart';

class Chat_screen extends StatefulWidget {
  const Chat_screen({super.key});

  @override
  State<Chat_screen> createState() => _Chat_screenState();
}

class _Chat_screenState extends State<Chat_screen> {
  String fonechoose = "Small";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Chats",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10),
                Text(
                  "Display",
                  style: GetTextTheme.fs12_regular,
                ),
                listtile(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => radio_dialog_singleSelect(
                          selected: fonechoose,
                          onDone: (v) => setState(() => fonechoose = v),
                          dialogTital: "Light",
                          data: dailog_dummydata_radio_button().Font_size_list),
                    );
                  },
                  title: 'Theme',
                  icon: Appicons.theme,
                  subtitle: fonechoose,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.Wallpaper_screen);
                  },
                  title: Text(
                    "Wallpaper",
                    style: GetTextTheme.fs14_regular,
                  ),
                  leading: Image.asset(Appicons.wallpaper),
                ),
                Divider(
                  thickness: 2,
                ),
                Gap(10),
                Text(
                  "Chat settings",
                  style: GetTextTheme.fs12_regular,
                ),
                Gap(10),
                Common_switch_tile(
                    title: "Enter is send",
                    boolvalue: true,
                    subtitle: "Enter key will send your message"),
                Gap(10),
                Common_switch_tile(
                    title: "Media visibility",
                    boolvalue: true,
                    subtitle:
                        "Show newly downloaded media in your phone’s gallery"),
                Gap(10),
                listtile(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => radio_dialog_singleSelect(
                          selected: fonechoose,
                          onDone: (v) => setState(() => fonechoose = v),
                          dialogTital: "Font",
                          data: dailog_dummydata_radio_button().Font_size_list),
                    );
                  },
                  title: 'Font size',
                  icon: Appicons.theme,
                  subtitle: fonechoose,
                ),
                Divider(
                  thickness: 2,
                ),
                listtile(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => App_language(),
                    );
                  },
                  title: 'App language',
                  icon: Appicons.language,
                  subtitle: "Phone's language (English)",
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.Chat_backup_screen);
                  },
                  title: Text("Chat backup", style: GetTextTheme.fs14_regular),
                  leading: Image.asset(Appicons.theme),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.Chat_history);
                  },
                  title: Text("Chat history", style: GetTextTheme.fs14_regular),
                  leading: Image.asset(Appicons.history),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
