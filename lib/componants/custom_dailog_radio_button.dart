// ==============================
// single select dialog
// --

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class radio_dialog_singleSelect extends StatefulWidget {
  String? dialogTital, dialogSubtitle;
  List<String> data;
  var selected;
  bool buttonshow;
  final Function(String) onDone;
  radio_dialog_singleSelect(
      {super.key,
      this.dialogTital,
      this.dialogSubtitle,
      required this.selected,
      required this.data,
      required this.onDone,
      this.buttonshow = false});

  @override
  State<radio_dialog_singleSelect> createState() =>
      _radio_dialog_singleSelectState();
}

class _radio_dialog_singleSelectState extends State<radio_dialog_singleSelect> {
  var colour = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      colour = widget.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.dialogTital == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.dialogTital.toString(),
                    style: GetTextTheme.fs18_bold,
                  ),
                ),
          widget.dialogSubtitle == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.dialogSubtitle.toString(),
                    style: GetTextTheme.fs14_regular.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
          ...List.generate(
              widget.data.length,
              (index) => ListTile(
                    onTap: () {
                      setState(() {
                        colour = widget.data[index].toString();

                        widget.buttonshow == false
                            ? (
                                widget.onDone(colour),
                                Appservices.goback(context),
                              )
                            : null;
                      });
                    },
                    leading: Radio(
                      activeColor: AppColors.green,
                      value: widget.data[index].toString(),
                      groupValue: colour,
                      onChanged: (value) {
                        setState(() {
                          colour = value.toString();
                          widget.buttonshow == false
                              ? (
                                  widget.onDone(value.toString()),
                                  Appservices.goback(context),
                                )
                              : null;
                        });
                      },
                    ),
                    title: Text(widget.data[index]),
                  )),
          widget.buttonshow == false
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Appservices.goback(context);
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(color: AppColors.green),
                        )),
                    TextButton(
                        onPressed: () {
                          widget.onDone(colour);
                          Appservices.goback(context);
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(color: AppColors.green),
                        ))
                  ],
                )
        ],
      ),
    );
  }
}
