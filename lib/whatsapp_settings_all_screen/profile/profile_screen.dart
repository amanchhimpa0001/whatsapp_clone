import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/custom_listtile.dart';
import 'package:whatsapp_app/controllers/userdatacontrolller.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<dataservices>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Profile",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: Column(
        children: [
          Gap(40),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: imageFile == null
                        ? Image.asset(
                            Getimage.chat_img1,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            imageFile!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                    right: 15,
                    child: GestureDetector(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              imagePickerbottomSheet(context)),
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.darkgrey, width: 2),
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Gap(30.h),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.person),
            title: Text(
              "Name",
              style: GetTextTheme.fs10_regular,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Susi Franklin",
                  style: GetTextTheme.fs12_regular,
                ),
                Gap(5),
                Text(
                  "This is not your username or pin. This name will be visible to your whatsApp contacts.",
                  style: GetTextTheme.fs10_regular
                      .copyWith(color: AppColors.greyColor),
                )
              ],
            ),
            trailing: Icon(
              Icons.edit,
              color: AppColors.green,
            ),
          ),
          Gap(10),
          Divider(),
          Common_listtile(
            textstyle: GetTextTheme.fs12_regular,
            textstyle1: GetTextTheme.fs14_regular,
            iconcolor: AppColors.green,
            trailing_icon: Icon(
              Icons.edit,
              color: AppColors.green,
            ),
            title: "About",
            subtitle: "Hey there! I am using whatsApp.",
            icon: Appicons.help,
          ),
          Gap(10),
          Divider(),
          Common_listtile(
            textstyle: GetTextTheme.fs12_regular,
            textstyle1:
                GetTextTheme.fs14_regular.copyWith(color: AppColors.blackColor),
            iconcolor: AppColors.green,
            title: "Phone",
            subtitle: provider.userdata.phonenumber,
            icon: Appicons.phone,
          )
        ],
      ),
    );
  }

  getImageFormGallery(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Navigator.of(context).pop();
    }
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

  imagePickerbottomSheet(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Container(
        color: Colors.white,
        height: 250,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pic Image From",
                style: GetTextTheme.fs20_bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  getImageFormCamra(context);
                },
                icon: const Icon(Icons.camera),
                label: const Text("CAMERA"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  getImageFormGallery(context);
                },
                icon: const Icon(Icons.image),
                label: const Text("GALLERY"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Appservices.goback(context);
                },
                icon: Icon(Icons.close),
                label: Text("CANCEL"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
