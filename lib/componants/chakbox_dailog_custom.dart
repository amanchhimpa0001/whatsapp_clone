// ==============================
// single select dialog
// --

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class dialog_chakbox extends StatefulWidget {
  String? dialogTital, dialogSubtitle;
  List<String> data;
  var selected;
  bool buttonshow;
  final Function(List<String>) onDone;
  dialog_chakbox(
      {super.key,
      this.dialogTital,
      this.dialogSubtitle,
      required this.selected,
      required this.data,
      required this.onDone,
      this.buttonshow = false});

  @override
  State<dialog_chakbox> createState() => _dialog_chakboxState();
}

class _dialog_chakboxState extends State<dialog_chakbox> {
  // var colour = '';
  List<String> selected = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = widget.selected;
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
                        if (selected
                            .any((element) => element == widget.data[index])) {
                          selected.remove(widget.data[index]);
                        } else {
                          selected.add(widget.data[index]);
                        }
                        // colour = widget.data[index].toString();

                        widget.buttonshow == false
                            ? (
                                widget.onDone(selected),
                                Appservices.goback(context),
                              )
                            : null;
                      });
                    },
                    leading: Checkbox.adaptive(
                      value: selected
                          .any((element) => element == widget.data[index]),
                      autofocus: false,
                      activeColor: AppColors.green,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      visualDensity: VisualDensity(horizontal: -4),
                      onChanged: (value) {
                        setState(() {
                          if (selected.any(
                              (element) => element == widget.data[index])) {
                            selected.remove(widget.data[index]);
                          } else {
                            selected.add(widget.data[index]);
                          }
                          // colour = widget.data[index].toString();

                          widget.buttonshow == false
                              ? (
                                  widget.onDone(selected),
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
                          widget.onDone(selected);
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
