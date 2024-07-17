import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/home_view_page_all/chat_scrren.dart';
import 'package:whatsapp_app/model/chat_model/ChatHelper.dart';
import 'package:whatsapp_app/model/chat_model/ChatItemModel.dart';

class Export_chat extends StatelessWidget {
  const Export_chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Choose chat",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text(
                "Recent chats",
                style: GetTextTheme.fs12_regular,
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // ChatItemModel chatItem = ChatHelper.getChatItem(position);
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ChatScreen(
                          //               image: chatItem.image,
                          //               name: chatItem.name,
                          //             )));
                        },
                        child: ListTile(
                          minVerticalPadding: 10,
                          leading: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                                ChatHelper.chatList[index].image.toString()),
                          ),
                          title: Text(ChatHelper.chatList[index].name,
                              style: GetTextTheme.fs14_bold),
                          subtitle: Row(
                            children: [
                              Icon(
                                index % 2 == 0 ? Icons.done : Icons.done_all,
                                color:
                                    index % 2 == 0 ? Colors.grey : Colors.blue,
                              ),
                              Gap(5),
                              Text(
                                ChatHelper.chatList[index].mostRecentMessage,
                                style: GetTextTheme.fs12_regular,
                              ),
                            ],
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(ChatHelper.chatList[index].messageDate,
                                style: GetTextTheme.fs12_medium),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: ChatHelper.chatList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
