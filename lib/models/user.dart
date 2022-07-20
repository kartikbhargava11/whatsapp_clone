class User {
  final String profilePhoto;
  final String contactName;
  final bool isGroup;
  User({
    required this.profilePhoto,
    required this.contactName,
    this.isGroup = false,
  });
}