class ChatMessagesEntity {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  ChatMessagesEntity({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });
}
