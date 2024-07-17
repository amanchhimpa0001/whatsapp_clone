import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/listtile.dart';
import 'package:whatsapp_app/componants/allaap_fix_data.dart';

class Settings_screen extends StatelessWidget {
  const Settings_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Settings",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(20),
              listtile(
                onPressed: () {
                  Navigator.pushNamed(context, Routesname.Profile_screen);
                },
                trailing: () {
                  Navigator.pushNamed(context, Routesname.ScanQRcode);
                },
                title: "Susi Franklin",
                icon: Appicons.profile,
                subtitle: "Hey there! Iam using WhatsApp.",
                trailinIcon: Image.asset(Appicons.scanner),
              ),
              Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: setting_fix_data.Setting_data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        horizontalTitleGap: 30,
                        visualDensity: VisualDensity(
                          horizontal: 3,
                        ),
                        onTap: () {
                          ontap(index, context);
                        },
                        leading:
                            Icon(setting_fix_data.Setting_data[index]["icon"]),
                        title:
                            Text(setting_fix_data.Setting_data[index]["title"]),
                        subtitle: Text(
                            setting_fix_data.Setting_data[index]["subtitle"]));
                  }),
              Gap(180),
              Text("from", style: GetTextTheme.fs10_regular),
              Text("FACEBOOK", style: GetTextTheme.fs14_regular),
              Gap(40),
            ],
          ),
        ),
      ),
    );
  }

  ontap(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Navigator.pushNamed(context, Routesname.Account_screen);
      case 1:
        return Navigator.pushNamed(context, Routesname.Chat_screen);
      case 2:
        return Navigator.pushNamed(context, Routesname.Notifications_screen);
      case 3:
        return Navigator.pushNamed(context, Routesname.Storage_and_Data);
      case 4:
        return Navigator.pushNamed(context, Routesname.Help_screen);

      default:
    }
  }
}
