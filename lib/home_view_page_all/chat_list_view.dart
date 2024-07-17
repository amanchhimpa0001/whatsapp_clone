import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/home_view_page_all/chat_scrren.dart';
import 'package:whatsapp_app/model/chat_model/ChatHelper.dart';
import 'package:whatsapp_app/model/chat_model/ChatItemModel.dart';

class chat_list_view extends StatefulWidget {
  const chat_list_view({super.key});

  @override
  State<chat_list_view> createState() => _chat_list_viewState();
}

class _chat_list_viewState extends State<chat_list_view> {
  @override
  Widget build(BuildContext context) {
      
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                              image: ChatHelper.chatList[index].image,
                              name: ChatHelper.chatList[index].name,
                            )));
              },
              child: ListTile(
                minVerticalPadding: 10,
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage:
                      AssetImage(ChatHelper.chatList[index].image.toString()),
                ),
                title: Text(ChatHelper.chatList[index].name,
                    style: GetTextTheme.fs14_bold),
                subtitle: Row(
                  children: [
                    Icon(
                      index % 2 == 0 ? Icons.done : Icons.done_all,
                      color: index % 2 == 0 ? Colors.grey : Colors.blue,
                    ),
                    Gap(5),
                    Expanded(
                      child: Text(
                        ChatHelper.chatList[index].mostRecentMessage,
                        style: GetTextTheme.fs12_regular,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
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
    );
  }
}
