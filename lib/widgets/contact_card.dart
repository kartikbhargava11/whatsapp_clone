import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class ContactCard extends StatelessWidget {
  final User user;

  const ContactCard({
    required this.user,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              user.profilePhoto
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  user.contactName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  user.lastGroupMessageContactName == null ? user.lastMessage :  "${user.lastGroupMessageContactName}: ${user.lastMessage}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0
                  )
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                user.timestamp,
                style: TextStyle(
                  color: user.isRead ? Colors.grey : Platform.isIOS ? Colors.blue : Colors.green,
                  fontSize: 16.0
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (user.unseenTexts > 0)
                    CircleAvatar(
                      backgroundColor: Platform.isAndroid ? Colors.green : Colors.blue,
                      radius: 10.0,
                      child: Text(
                        "${user.unseenTexts}",
                        style: const TextStyle(
                          fontSize: 12.0
                        )
                      ),
                    ),
                  if (user.isMute)
                    const SizedBox(
                      width: 5.0,
                    ),
                  if(user.isMute)
                    const Icon(
                      CupertinoIcons.volume_off,
                      color: Colors.grey,
                    )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
