import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/componants/listtile.dart';
import 'package:whatsapp_app/componants/text_btn.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final firestore = FirebaseFirestore.instance;
  final database = FirebaseDatabase.instance;

  final textController = TextEditingController();
  final sender = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Appservices.addheight(40),
            TextField(
              controller: textController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Sender name"),
              controller: sender,
            ),
            Text_btn(
              txt: "add data",
              ontap: () async {
                // await firestore
                //     .collection("users")
                //     .add({"name": "Aman", "address": "Hisar"}).then(
                //         (value) => print(value.id));
                // await firestore
                //     .collection("users")
                //     .where("address", isEqualTo: "hansi")
                //     .get()
                //     .then((value) => print(value.docs
                //         .map((e) => e.data().toString() + "${e.id}")));

                // realtime database

                // Add value on database
                await database
                    .ref("chats")
                    .push()
                    .set({"msg": textController.text, "sender": sender.text});
              },
              btnColor: AppColors.green,
              txtColor: AppColors.whiteColor,
            ),
            Expanded(
              child: FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: database.ref("chats"),
                  itemBuilder: (context, snapshot, animation, i) {
                    final data = snapshot.value as Map<Object?, Object?>;
                    return ListTile(
                      title: Text(data['msg'].toString()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
