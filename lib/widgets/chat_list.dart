import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './contact_card.dart';
import './search_bar.dart';

import '../data/data.dart';

class ChatList extends StatelessWidget {
  final ScrollController scrollController;
  const ChatList({
    required this.scrollController,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: Platform.isIOS ? contactList.length + 2 : contactList.length,
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey.shade200,
          thickness: 1.0,
          indent: Platform.isIOS && index == 0 ? 0.0 : 75.0,
        );
      },
      itemBuilder: (ctx, index) {
        if (index == 0 && Platform.isIOS) {
          return const SearchBar();
        } else if (index == 1 && Platform.isIOS) {
          return Container(
            padding: const EdgeInsets.only(left: 28.0, top: 6.0, right: 28.0, bottom: 2.0),
            child: Row(
              children: const [
                Icon(
                  CupertinoIcons.archivebox_fill,
                  color: Colors.grey,
                  size: 18.0
                ),
                SizedBox(
                  width: 28.0,
                ),
                Text(
                  "Archived",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  )
                )
              ],
            )
          );
        } else {
          final user = contactList[Platform.isIOS ? index - 2 : index];
          return ContactCard(user: user);
        }
      },
    );
  }
}
