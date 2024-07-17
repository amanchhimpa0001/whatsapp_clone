import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/model/message_model/message_model.dart';

class ChatScreen extends StatefulWidget {
  final String name, image;
  const ChatScreen({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();

  List<MessageItemModel> myChatList = [];

  int chakvalue = 0;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        leadingWidth: 80,
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Appservices.goback(context);
                },
                child: Icon(Icons.arrow_back)),
            Image.asset(widget.image)
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.name,
              style: GetTextTheme.fs18_medium,
            ),
            Text(
              "Online",
              style: GetTextTheme.fs10_regular,
            )
          ],
        ),
        actions: const [
          Icon(Icons.call),
          Gap(20),
          Icon(Icons.videocam),
          Gap(20),
          Icon(Icons.more_vert_outlined),
          Gap(20),
        ],
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: myChatList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: index % 2 == 0
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        MessageBubble(
                          index: index,
                          message: myChatList[index].mostRecentMessage,
                          isSeen: false,
                          isMe: false,
                          time: myChatList[index].messageDate,
                          onPress: () {},
                          listLength: myChatList.length,
                          type: myChatList[index].type,
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.lightwhiteColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.emoji_emotions)),
                              Expanded(
                                child: TextFormField(
                                  controller: messageController,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.blackColor),
                                  onChanged: (value) {
                                    setState(() => chakvalue = value.length);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 0.0),
                                    hintText: 'Message...',
                                    hintStyle: TextStyle(
                                      color: AppColors.darkgrey,
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              chakvalue > 0
                                  ? SizedBox()
                                  : IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.attach_file),
                                    ),
                              chakvalue > 0
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {},
                                      child: Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.grey),
                                          child: Icon(
                                            Icons.currency_rupee_sharp,
                                            size: 20,
                                            color: AppColors.whiteColor,
                                          )),
                                    ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  messageController.text.isEmpty
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            if (messageController.text.isNotEmpty) {
                              var messageItem = MessageItemModel(
                                  "Aaron",
                                  messageController.text,
                                  DateTime.now().toIso8601String(),
                                  '');

                              myChatList.add(messageItem);
                              messageController.clear();
                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Please enter message")));
                            }
                          },
                          child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.green),
                              child: Icon(
                                chakvalue == 0 ? Icons.mic : Icons.arrow_back,
                                color: AppColors.whiteColor,
                              )),
                        ),
                  GestureDetector(
                    onTap: () {
                      if (messageController.text.isNotEmpty) {
                        var messageIten = MessageItemModel(
                            "Aaron",
                            messageController.text,
                            DateTime.now().toIso8601String(),
                            'me');
                        myChatList.add(messageIten);
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        messageController.clear();
                        setState(() {});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please enter message")));
                      }
                    },
                    child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.green),
                        child: Icon(
                          chakvalue == 0 ? Icons.mic : Icons.send,
                          color: AppColors.whiteColor,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
  });

  final bool isMe;
  final String message, type;
  final String time;
  final VoidCallback onPress;
  int index;
  int listLength;
  bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        // crossAxisAlignment:
        //     type == "me" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Text(
              message.toString(),
              maxLines: 1,
              style: GetTextTheme.fs12_regular,
            ),
          ),
          Gap(4),
        ],
      ),
    );
  }
}
