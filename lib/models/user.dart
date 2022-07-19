class User {
  final String profilePhoto;
  final String contactName;
  final String timestamp;
  final String lastMessage;
  final bool isGroup;
  final String? lastGroupMessageContactName;
  final bool isRead;
  final int unseenTexts;
  final bool isMute;

  User({
    required this.profilePhoto,
    required this.contactName,
    required this.timestamp,
    required this.lastMessage,
    this.isGroup = false,
    this.lastGroupMessageContactName,
    this.isRead = true,
    this.unseenTexts = 0,
    this.isMute = false,
  });

}