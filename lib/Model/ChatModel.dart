class ChatModel {
  String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;

  ChatModel({
    required this.name,
    this.icon,
     this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
  });
}
