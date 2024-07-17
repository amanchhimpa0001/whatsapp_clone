import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/home_view_page_all/calls_screen.dart';
import 'package:whatsapp_app/home_view_page_all/camera_screen.dart';
import 'package:whatsapp_app/home_view_page_all/chat_list_view.dart';
import 'package:whatsapp_app/home_view_page_all/status_screen.dart';
import 'package:whatsapp_app/home_view_page_all/theme_change.dart';

class Home_page extends StatefulWidget {
  const Home_page({
    super.key,
  });

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 4, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      animationDuration: Duration(milliseconds: 0),
      length: 4,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        setState(() {});
      });
  }

  File? imageFile;
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        floatingActionButton: _tabController.index == 0
            ? SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _tabController.index == 2
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: FloatingActionButton(
                            backgroundColor: AppColors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routesname.Massage_search);
                            },
                            child: Icon(
                              Icons.edit,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        )
                      : SizedBox(),
                  // Gap(10),
                  FloatingActionButton(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: () {
                      Navigator.pushNamed(context, Routesname.Massage_search);
                    },
                    child: _tabController.index == 2
                        ? Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.whiteColor,
                          )
                        : _tabController.index == 3
                            ? Icon(
                                Icons.add_call,
                                color: AppColors.whiteColor,
                              )
                            : Icon(
                                Icons.chat,
                                color: AppColors.whiteColor,
                              ),
                  ),
                ],
              ),
        appBar: AppBar(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.green,
          automaticallyImplyLeading: false,
          title: Text(
            "WhatsApp",
            style: GetTextTheme.fs20_bold.copyWith(color: AppColors.whiteColor),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  getImageFormCamra(context);
                  // Navigator.pushNamed(context, Routesname.seraching_chats);
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.whiteColor,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routesname.seraching_chats);
                },
                icon: Icon(
                  Icons.search_rounded,
                  color: AppColors.whiteColor,
                )),
            _tabController.index == 3
                ? PopupMenuButton(
                    color: AppColors.whiteColor,
                    enabled: true,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            "Clear call log",
                            style: GetTextTheme.fs14_regular,
                          )),
                      PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            "Seattings",
                            style: GetTextTheme.fs14_regular,
                          )),
                    ],
                  )
                : _tabController.index == 1
                    ? PopupMenuButton(
                        color: AppColors.whiteColor,
                        enabled: true,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {},
                              child: Text(
                                "New group",
                                style: GetTextTheme.fs14_regular,
                              )),
                          PopupMenuItem(
                              onTap: () {},
                              child: Text(
                                "New broadcast",
                                style: GetTextTheme.fs14_regular,
                              )),
                          PopupMenuItem(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routesname.linked_devices);
                              },
                              child: Text(
                                "Linked devices",
                                style: GetTextTheme.fs14_regular,
                              )),
                          PopupMenuItem(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routesname.Starrred_Messages);
                              },
                              child: Text(
                                "Starred messages",
                                style: GetTextTheme.fs14_regular,
                              )),
                          PopupMenuItem(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routesname.Payments_screen);
                              },
                              child: Text(
                                "Payments",
                                style: GetTextTheme.fs14_regular,
                              )),
                          PopupMenuItem(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routesname.Settings_screen);
                              },
                              child: Text(
                                "Settings",
                                style: GetTextTheme.fs14_regular,
                              )),
                          PopupMenuItem(
                              onTap: () {
                                Appservices.pushto(context, themechange());
                              },
                              child: Text(
                                "Dark mode",
                                style: GetTextTheme.fs14_regular,
                              )),
                        ],
                      )
                    : PopupMenuButton(
                        color: AppColors.whiteColor,
                        enabled: true,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {},
                              child: Text(
                                "Status privacy",
                                style: GetTextTheme.fs14_regular,
                              )),
                          PopupMenuItem(
                              onTap: () {},
                              child: Text(
                                "Seattings",
                                style: GetTextTheme.fs14_regular,
                              )),
                        ],
                      ),
          ],
          bottom: TabBar(
              controller: _tabController,
              onTap: (val) {
                currentIndex = val;
                setState(() {});
              },
              indicatorColor: AppColors.whiteColor,
              tabs: [
                Tab(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.groups_outlined,
                        color: AppColors.whiteColor,
                      )),
                ),
                Tab(
                  child: Text(
                    "CHATS",
                    style: GetTextTheme.fs14_bold
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
                Tab(
                  child: Text(
                    "STATUS",
                    style: GetTextTheme.fs14_bold
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
                Tab(
                  child: Text(
                    "CALLS",
                    style: GetTextTheme.fs14_bold
                        .copyWith(color: AppColors.whiteColor),
                  ),
                )
              ]),
          toolbarHeight: 50,
        ),
        body: TabBarView(controller: _tabController, children: [
          camera_screen(),
          chat_list_view(),
          status_screen(),
          calls_screen(),
        ]),
      );
    });
  }

  getImageFormCamra(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Navigator.of(context).pop();
    }
  }
}
