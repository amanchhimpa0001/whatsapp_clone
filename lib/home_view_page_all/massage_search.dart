import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/listtile.dart';

class Massage_search extends StatefulWidget {
  const Massage_search({super.key});

  @override
  State<Massage_search> createState() => _Massage_searchState();
}

class _Massage_searchState extends State<Massage_search> {
  List<Contact> contacts = [];
  bool loading = false;

  void getPhoneData() async {
    setState(() => loading = true);
    if (await FlutterContacts.requestPermission()) {
      var contactsList = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      contacts = contactsList;
    }
    setState(() => loading = false);
  }

  @override
  void initState() {
    getPhoneData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: GetTextTheme.fs20_regular,
            ),
            Text(
              "365 contacts",
              style: GetTextTheme.fs16_regular,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
            color: AppColors.whiteColor,
            enabled: true,
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () {},
                  child: Text(
                    "Invite a friend",
                    style: GetTextTheme.fs14_regular,
                  )),
              PopupMenuItem(
                  onTap: () {},
                  child: Text(
                    "Contacts",
                    style: GetTextTheme.fs14_regular,
                  )),
              PopupMenuItem(
                  onTap: () {},
                  child: Text(
                    "Refresh",
                    style: GetTextTheme.fs14_regular,
                  )),
              PopupMenuItem(
                  onTap: () {},
                  child: Text(
                    "Help",
                    style: GetTextTheme.fs14_regular,
                  )),
            ],
          ),
        ],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  listtile(
                    textstyle: GetTextTheme.fs16_bold,
                    onPressed: () {
                      Navigator.pushNamed(context, Routesname.Profile_screen);
                    },
                    trailing: () {
                      Navigator.pushNamed(context, Routesname.ScanQRcode);
                    },
                    title: "New group",
                    icon: Getimage.person_img,
                  ),
                  listtile(
                      textstyle: GetTextTheme.fs16_bold,
                      onPressed: () {
                        Navigator.pushNamed(context, Routesname.Profile_screen);
                      },
                      trailing: () {
                        Navigator.pushNamed(context, Routesname.ScanQRcode);
                      },
                      trailinIcon: Image.asset(Appicons.scanner),
                      title: "New contact",
                      icon: Getimage.plus_person),
                  Flexible(
                      child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, i) {
                            final contact = contacts[i];

                            return ListTile(
                              title: Text(
                                "${contact.displayName}",
                                style: GetTextTheme.fs16_medium,
                              ),
                              subtitle: Text("Lorem ipsum dolor sit amet"),
                              leading: contact.photoOrThumbnail != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(1000),
                                      child: Image.memory(
                                        contact.photoOrThumbnail!,
                                        scale: 2,
                                      ))
                                  : SizedBox(),
                            );
                          }))
                ],
              ),
            ),
    );
  }
}
