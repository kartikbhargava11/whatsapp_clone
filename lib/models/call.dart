import './user.dart';

class Call {
  final User user;
  final String timestamp;
  final bool isIncomingCall;
  final bool isAudioCall;
  final int numberOfCalls;
  final bool isMissed;


  Call({
    required this.user,
    required this.timestamp,
    this.isIncomingCall = true,
    this.isAudioCall = true,
    this.numberOfCalls = 1,
    this.isMissed = false,

  });
}