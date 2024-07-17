import 'package:flutter/material.dart';
import 'package:whatsapp_app/model/chat_seraching_model/serching_model.dart';

class seraching_helpers {
  static var serachinglist = [
    seraching_model(name: "Photo", icon: Icons.photo),
    seraching_model(name: "Videos", icon: Icons.video_call),
    seraching_model(name: "Links", icon: Icons.link),
    seraching_model(name: "GIFs", icon: Icons.gif_box),
    seraching_model(name: "Audio", icon: Icons.audiotrack),
    seraching_model(name: "Documents", icon: Icons.document_scanner_rounded),
  ];
}
