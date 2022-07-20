import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../data/data.dart';

import '../models/chat.dart';

class ChatList extends StatelessWidget {
  final ScrollController scrollController;
  const ChatList({
    required this.scrollController,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIos = Platform.isIOS;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      controller: scrollController,
      itemCount: isIos ? chats.length + 2 : chats.length + 1,
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey.shade200,
          thickness: 1.0,
          indent: isIos && index == 0 ? 0.0 : 75.0,
        );
      },
      itemBuilder: (ctx, index) {
        if (index == 0 && isIos) {
          return const _SearchBar();
        } else if (index == 1 && isIos || index == 0 && Platform.isAndroid) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Row(
              children: [
                Icon(
                  isIos ? CupertinoIcons.archivebox_fill : Icons.archive_outlined,
                  color: isIos ? Colors.grey : Colors.green,
                  size: isIos ? 18.0 : 24.0
                ),
                const SizedBox(
                  width: 32.0,
                ),
                const Text(
                  "Archived",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  )
                ),
                const Spacer(),
                Text(
                  "2",
                  style: TextStyle(
                    color: isIos ? Colors.blue : Colors.green
                  )
                )
              ],
            )
          );
        } else {
          final chat = chats[isIos ? index - 2 : index - 1];
          return _ContactCard(chat: chat);
        }
      },
    );
  }
}


class _ContactCard extends StatelessWidget {
  final Chat chat;

  const _ContactCard({
    required this.chat,
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
                chat.user.profilePhoto
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
                    chat.user.contactName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                    chat.lastGroupMessageContactName == null ? chat.lastMessage :  "${chat.lastGroupMessageContactName}: ${chat.lastMessage}",
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
                  chat.timestamp,
                  style: TextStyle(
                      color: chat.isRead ? Colors.grey : Platform.isIOS ? Colors.blue : Colors.green,
                      fontSize: 16.0
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (chat.unseenTexts > 0)
                    CircleAvatar(
                      backgroundColor: Platform.isAndroid ? Colors.green : Colors.blue,
                      radius: 10.0,
                      child: Text(
                          "${chat.unseenTexts}",
                          style: const TextStyle(
                              fontSize: 12.0
                          )
                      ),
                    ),
                  if (chat.isMute)
                    const SizedBox(
                      width: 5.0,
                    ),
                  if(chat.isMute)
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


class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            "Chats",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            )
        ),
        const SizedBox(
          height: 10.0,
        ),
        CupertinoTextField(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          placeholder: "Search",
          prefix: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.extraLightBackgroundGray,
            border: Border.all(color: CupertinoColors.lightBackgroundGray, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: const [
            Text(
              "Broadcast Lists",
              style: TextStyle(
                color: Colors.blue,
              )
            ),
            Spacer(),
            Text(
              "New Group",
              style: TextStyle(
                color: Colors.blue,
              )
            )
          ],
        )
      ],
    );
  }
}
