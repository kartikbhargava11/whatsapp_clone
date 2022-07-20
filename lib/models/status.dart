import './user.dart';

class Status {
  final User user;
  final String timestamp;
  final bool isViewed;

  Status({
    required this.user,
    required this.timestamp,
    this.isViewed = false,
  });
}