import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class linear_indigator_listtile extends StatefulWidget {
  String title;
  String txtupkb;
  String txtdownkb;
  String? subtitletxt1;
  String? subtitletxt2;

  IconData icon;
  linear_indigator_listtile({
    super.key,
    required this.title,
    required this.txtupkb,
    required this.icon,
    this.subtitletxt1,
    this.subtitletxt2,
    required this.txtdownkb,
  });

  @override
  State<linear_indigator_listtile> createState() =>
      _linear_indigator_listtileState();
}

class _linear_indigator_listtileState extends State<linear_indigator_listtile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(widget.icon),
              Gap(20),
              Text(
                widget.title,
                style: GetTextTheme.fs12_bold,
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Text(
                    widget.txtupkb,
                    style: GetTextTheme.fs13_regular.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  Gap(15),
                  Text(widget.txtdownkb,
                      style: GetTextTheme.fs13_regular
                          .copyWith(color: AppColors.grey))
                ],
              ),
              Gap(10)
            ],
          ),
          Gap(5),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: LinearPercentIndicator(
              barRadius: Radius.circular(10),
              // width: Appservices.getScreenWidth(context),
              lineHeight: 3.0,
              percent: 0.7,
              backgroundColor: AppColors.grey,
              progressColor: AppColors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Row(
              children: [
                widget.subtitletxt1 == null
                    ? SizedBox()
                    : Text(
                        widget.subtitletxt1!,
                        style: GetTextTheme.fs13_regular.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                Gap(15),
                widget.subtitletxt2 == null
                    ? SizedBox()
                    : Text(
                        widget.subtitletxt2!,
                        style: GetTextTheme.fs13_regular.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
