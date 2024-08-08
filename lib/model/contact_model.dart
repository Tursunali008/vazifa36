class ContactModel {
  final int contactId;
  final String contactName;
  final String contactLastname;
  final bool isOnlie;
  final String imageUrl;
  final DateTime lastOnlineTime;

  ContactModel({
    required this.contactId,
    required this.contactName,
    required this.contactLastname,
    required this.isOnlie,
    required this.imageUrl,
    required this.lastOnlineTime,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      contactId: json["contact-id"],
      contactName: json["contact-name"],
      contactLastname: json["contact-last-name"],
      isOnlie: json["is-online"],
      imageUrl: json["image-url"],
      lastOnlineTime: json["last-online-time"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "contact-di": contactId,
      "contact-name": contactName,
      "contact-last-name": contactLastname,
      "is-online": isOnlie,
      "image-url": imageUrl,
      "last-online-time": lastOnlineTime,
    };
  }
}