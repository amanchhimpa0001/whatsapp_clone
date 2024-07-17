import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/home_view_page_all/story_page_view.dart';
import 'package:whatsapp_app/model/status_model/StatusHelper.dart';
import 'package:whatsapp_app/model/status_model/StatusItemModel.dart';

class status_screen extends StatelessWidget {
  const status_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, position) {
              StatusItemModel statusItemModel =
                  StatusHelper.getStatusItem(position);

              if (position == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      minLeadingWidth: 60,
                      onTap: () {},
                      leading:
                          Stack(alignment: Alignment.bottomRight, children: [
                        Image.asset(
                          Getimage.chat_img2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blackColor),
                              shape: BoxShape.circle,
                              color: AppColors.green),
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ]),
                      title: Text(
                        'My status',
                        style: GetTextTheme.fs14_bold,
                      ),
                      subtitle: Text(
                        'Tap to add status update',
                        style: GetTextTheme.fs12_regular,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                      child: Text('Recent Updates',
                          style: GetTextTheme.fs12_regular),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Appservices.pushto(context, StoryPageView());
                      },
                      leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 2)),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(statusItemModel.image),
                        ),
                      ),
                      title: Text(
                        statusItemModel.name,
                        style: GetTextTheme.fs14_regular,
                      ),
                      subtitle: Text(
                        statusItemModel.name + ", " + statusItemModel.dateTime,
                        style: GetTextTheme.fs12_regular,
                      ),
                    ),
                    const Divider(),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                      child: Text('View Updates',
                          style: GetTextTheme.fs12_regular),
                    ),
                    ListTile(
                      onTap: () {
                        Appservices.pushto(context, StoryPageView());
                      },
                      leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(statusItemModel.image)),
                      title: Text(
                        statusItemModel.name,
                        // ignore: deprecated_member_use
                        style: GetTextTheme.fs14_regular,
                      ),
                      subtitle: Text(
                        statusItemModel.name + ", " + statusItemModel.dateTime,
                        style: GetTextTheme.fs12_regular,
                      ),
                    ),
                    const Divider(),
                  ],
                );
              }
            },
            itemCount: StatusHelper.itemCount,
          ),
        ),
      ],
    );
  }
}
