import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/home_view_page_all/chat_scrren.dart';
import 'package:whatsapp_app/model/chat_model/ChatHelper.dart';
import 'package:whatsapp_app/model/chat_model/ChatItemModel.dart';
import 'package:whatsapp_app/model/chat_seraching_model/seraching_helpers.dart';
import 'package:whatsapp_app/model/chat_seraching_model/serching_model.dart';

class seraching_chats extends StatefulWidget {
  const seraching_chats({super.key});

  @override
  State<seraching_chats> createState() => _seraching_chatsState();
}

class _seraching_chatsState extends State<seraching_chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.green,
        onPressed: () {
          Navigator.pushNamed(context, Routesname.New_peymants);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(50)),
        icon: Icon(
          Icons.chat,
          color: AppColors.whiteColor,
        ),
        label: Text(""),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Appservices.goback(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.greyColor, width: 1.8))),
                    width: AppConfig.screenWidth,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Serach..."),
                    ),
                  ),
                )
              ],
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Wrap(
                      direction: Axis.vertical,
                      runSpacing: 40,
                      children: [
                        ...List.generate(
                            growable: true,
                            seraching_helpers.serachinglist.length,
                            (index) => Row(
                                  children: <Widget>[
                                    Icon(
                                      seraching_helpers
                                          .serachinglist[index].icon,
                                      color: AppColors.darkgrey,
                                    ),
                                    Text(
                                      seraching_helpers
                                          .serachinglist[index].name,
                                      style: GetTextTheme.fs18_regular,
                                    )
                                  ],
                                ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            Divider(),
            Expanded(
              child: ListView.builder(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
