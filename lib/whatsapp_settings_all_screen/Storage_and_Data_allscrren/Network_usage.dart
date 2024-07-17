import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/leadinghide_listtile.dart';
import 'package:whatsapp_app/componants/linear_indigator_listtile.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Storage_and_Data_allscrren/Storage_and_Data_dailog/REset_statistics_dailog.dart';

class Network_usage extends StatelessWidget {
  const Network_usage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Network usage",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Usage",
                      style: GetTextTheme.fs12_bold,
                    ),
                    Gap(15),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "78 ",
                          style: GetTextTheme.fs24_regular.copyWith(
                            color: AppColors.grey,
                          )),
                      TextSpan(
                          text: "MB",
                          style: GetTextTheme.fs18_regular.copyWith(
                            color: AppColors.grey,
                          ))
                    ])),
                    Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "⬆ Sent",
                          style: GetTextTheme.fs13_regular.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        Gap(150),
                        Text("⬇ Received",
                            style: GetTextTheme.fs13_regular
                                .copyWith(color: AppColors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("6.1 MB"),
                        Gap(150),
                        Text("6.1 MB"),
                      ],
                    ),
                    Gap(15),
                    Divider()
                  ],
                ),
              ),
              linear_indigator_listtile(
                title: "Calls",
                txtupkb: "⬆ 973 kB",
                icon: Icons.phone,
                subtitletxt1: "11 outgoing",
                subtitletxt2: "8 incoming",
                txtdownkb: "⬇ 1.2 MB",
              ),
              linear_indigator_listtile(
                title: "Media",
                txtupkb: "⬆ 973 kB",
                icon: Icons.perm_media_rounded,
                txtdownkb: "⬇ 1.2 MB",
              ),
              linear_indigator_listtile(
                title: "Google Drive",
                txtupkb: "⬆ 0.0 kB",
                icon: Icons.add_to_drive_rounded,
                txtdownkb: "⬇ 0.0 MB",
              ),
              linear_indigator_listtile(
                title: "Messages",
                txtupkb: "⬆ 4.4 MB",
                icon: Icons.chat,
                subtitletxt1: "180 sent",
                subtitletxt2: "399 recived",
                txtdownkb: "⬇ 1.2 MB",
              ),
              linear_indigator_listtile(
                title: "Status",
                txtupkb: "⬆ 0.0 MB",
                icon: Icons.data_saver_off,
                subtitletxt1: "0 sent",
                subtitletxt2: "3,030 recived",
                txtdownkb: "⬇ 30.5 MB",
              ),
              linear_indigator_listtile(
                icon: Icons.language,
                title: "Roaming",
                txtupkb: "⬆ 973 kB",
                txtdownkb: "⬇ 1.2 MB",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: leadinghidelisttile(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => REset_statistics_dailog(),
                    );
                  },
                  textstyle1: GetTextTheme.fs12_regular,
                  title: "REset statistics",
                  subtitle: "Last reset time: Never",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
