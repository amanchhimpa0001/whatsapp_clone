import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/allaap_fix_data.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/chat_history/chat_history_all_dailog/Archive_all_chats_dailog.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/chat_history/chat_history_all_dailog/Clear_all_chats_dailog.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/chat_history/chat_history_all_dailog/Delete%20_all_chats_dailog.dart';

class Chat_history extends StatelessWidget {
  const Chat_history({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Chat history",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: chathistory_fix_data.chathistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    horizontalTitleGap: 30,
                    visualDensity: VisualDensity(
                      horizontal: 3,
                    ),
                    onTap: () {
                      chat_history_ontap(index, context);
                    },
                    leading:
                        Icon(chathistory_fix_data.chathistory[index]["icon"]),
                    title:
                        Text(chathistory_fix_data.chathistory[index]["title"]),
                  );
                }),
          ],
        ),
      ),
    );
  }

  chat_history_ontap(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Navigator.pushNamed(context, Routesname.Export_chat);
      case 1:
        return showDialog(
          context: context,
          builder: (context) => Archive_all_chats_dailog(),
        );
      case 2:
        return showDialog(
          context: context,
          builder: (context) => Clear_all_chats_dailog(),
        );

      case 3:
        return showDialog(
          context: context,
          builder: (context) => Delete_all_chats_dailog(),
        );

      default:
    }
  }
}
