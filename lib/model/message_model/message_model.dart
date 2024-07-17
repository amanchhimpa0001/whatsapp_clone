class MessageItemModel {
  String name;
  String mostRecentMessage;
  String messageDate;
  String type;

  MessageItemModel(
      this.name, this.mostRecentMessage, this.messageDate, this.type);
}

class Massage {
  String text;
  DateTime date;
  bool isSentByMe;

  Massage({required this.text, required this.date, required this.isSentByMe});
}
