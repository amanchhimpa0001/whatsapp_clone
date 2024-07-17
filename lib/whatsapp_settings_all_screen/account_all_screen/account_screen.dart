import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/allaap_fix_data.dart';

class Account_screen extends StatelessWidget {
  const Account_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Account",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: Account_fix_data.Account_data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    horizontalTitleGap: 30,
                    visualDensity: VisualDensity(
                      horizontal: 3,
                    ),
                    onTap: () {
                      Account_ontap(index, context);
                    },
                    leading: Icon(Account_fix_data.Account_data[index]["icon"]),
                    title: Text(Account_fix_data.Account_data[index]["title"]),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Account_ontap(int index, BuildContext context) {
    switch (index) {
      // case 0:
      //   return Navigator.pushNamed(context, Routesname.Account_screen);
      case 1:
        return Navigator.pushNamed(context, Routesname.Security_scrren);
      case 3:
        return Navigator.pushNamed(context, Routesname.Twostep_verification);
      case 2:
        return Navigator.pushNamed(context, Routesname.Change_number);
      case 4:
        return Navigator.pushNamed(context, Routesname.Request_account_info);
      case 5:
        return Navigator.pushNamed(context, Routesname.Delete_my_account);

      default:
    }
  }
}
