class MessageModel {
  final int messageId;
  final String messageText;
  final bool isFile;
  final String createdTime;
  final int contactId;
  final int status;

  MessageModel({
    required this.messageId,
    required this.messageText,
    required this.isFile,
    required this.createdTime,
    required this.contactId,
    required this.status,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json["message-id"],
      messageText: json["message-text"],
      isFile: json["is-file"],
      createdTime: json["created-time"],
      contactId: json["contact-id"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message-id": messageId,
      "message-text": messageText,
      "is-file": isFile,
      "created-time": createdTime,
      "contact-id": contactId,
      "status": status,
    };
  }
}