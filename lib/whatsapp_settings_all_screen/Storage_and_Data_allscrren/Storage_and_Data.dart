import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/chakbox_dailog_custom.dart';
import 'package:whatsapp_app/componants/custom_dailog_radio_button.dart';
import 'package:whatsapp_app/componants/dailog_chakbox_dummydata.dart';
import 'package:whatsapp_app/componants/dailog_radio_dummydata.dart';
import 'package:whatsapp_app/componants/leadinghide_listtile.dart';
import 'package:whatsapp_app/componants/listtile.dart';
import 'package:whatsapp_app/componants/switch_tile.dart';

class Storage_and_Data extends StatefulWidget {
  const Storage_and_Data({super.key});

  @override
  State<Storage_and_Data> createState() => _Storage_and_DataState();
}

class _Storage_and_DataState extends State<Storage_and_Data> {
  String photo_upload = "Auto (recommended)";

  List<String> mobiledata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Storage and data",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listtile(
                textstyle: GetTextTheme.fs13_regular,
                textstyle1: GetTextTheme.fs12_regular,
                onPressed: () {
                  Navigator.pushNamed(context, Routesname.Manage_storage);
                },
                title: "Manage storage",
                icon: Appicons.folder_black,
                subtitle: "3.1 MB",
              ),
              Divider(),
              listtile(
                textstyle: GetTextTheme.fs13_regular,
                textstyle1: GetTextTheme.fs12_regular,
                onPressed: () {
                  Navigator.pushNamed(context, Routesname.Network_usage);
                },
                title: "Network usage",
                icon: Appicons.storage,
                subtitle: "6.1 MB sent  69.2 MB received",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Common_switch_tile(
                    title: "Use less data for calls", boolvalue: true),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Media auto-download",
                  style: GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greyColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Voice messages are always automatically downloaded",
                  style: GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greyColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  children: [
                    leadinghidelisttile(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => dialog_chakbox(
                              selected: mobiledata,
                              data: chakbox_dailog_data().Media_auto_list,
                              onDone: (v) => setState(() => mobiledata = v),
                              buttonshow: true,
                              dialogTital: "When using mobile data"),
                        );
                      },
                      textstyle1: GetTextTheme.fs12_regular,
                      title: "When using mobile data ",
                      subtitle: mobiledata.join(", "),
                    ),
                    leadinghidelisttile(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => dialog_chakbox(
                              selected: mobiledata,
                              data: chakbox_dailog_data().Media_auto_list,
                              onDone: (v) => setState(() => mobiledata = v),
                              buttonshow: true,
                              dialogTital: "When using mobile data"),
                        );
                      },
                      textstyle1: GetTextTheme.fs12_regular,
                      title: "When connected on Wi-Fi",
                      subtitle: mobiledata.join(", "),
                    ),
                    leadinghidelisttile(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => dialog_chakbox(
                              selected: mobiledata,
                              data: chakbox_dailog_data().Media_auto_list,
                              onDone: (v) => setState(() => mobiledata = v),
                              buttonshow: true,
                              dialogTital: "When using mobile data"),
                        );
                      },
                      textstyle1: GetTextTheme.fs12_regular,
                      title: "When roaming",
                      subtitle: mobiledata.join(", "),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Media auto-download",
                  style: GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greyColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Voice messages are always automatically downloaded",
                  style: GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greyColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: leadinghidelisttile(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => radio_dialog_singleSelect(
                          selected: photo_upload,
                          onDone: (v) => setState(() => photo_upload = v),
                          dialogTital: "Photo upload quality",
                          buttonshow: true,
                          dialogSubtitle:
                              "Best quality photos are larger and can take longer to send",
                          data: dailog_dummydata_radio_button()
                              .photo_upload_quality_list),
                    );
                  },
                  textstyle1: GetTextTheme.fs12_regular,
                  title: "Photo upload quality",
                  subtitle: photo_upload,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
