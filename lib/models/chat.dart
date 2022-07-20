import './user.dart';

class Chat {
  final User user;
  final String timestamp;
  final String lastMessage;
  final String? lastGroupMessageContactName;
  final bool isRead;
  final int unseenTexts;
  final bool isMute;

  Chat({
    required this.user,
    required this.timestamp,
    required this.lastMessage,
    this.lastGroupMessageContactName,
    this.isRead = true,
    this.unseenTexts = 0,
    this.isMute = false,
  });
}