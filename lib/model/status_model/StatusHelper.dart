import 'package:whatsapp_app/model/status_model/StatusItemModel.dart';

class StatusHelper {
  static var statusList = [
    StatusItemModel(
        "Aron", "Yesterday, 21:22 PM", "assets/images/chat_img1.png"),
    StatusItemModel(
        "Fraklin", "Yesterday, 09:09 PM", "assets/images/chat_img5.png")
  ];

  static StatusItemModel getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;
}
