import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/model/call_model/CallItemModel.dart';
import 'package:whatsapp_app/model/call_model/call_helper.dart';

class calls_screen extends StatelessWidget {
  const calls_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 7),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 28,
                      backgroundImage:
                          AssetImage(CallHelper.callList[index].image),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(CallHelper.callList[index].name,
                                        style: GetTextTheme.fs14_regular),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    CallHelper.callList[index].dateTime,
                                    style: GetTextTheme.fs12_regular,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              CallHelper.callList[index].icon,
                              color: Color(0xff00b09c),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: CallHelper.callList.length,
    );
  }
}
