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
    final isIos = Platform.isIOS;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      controller: scrollController,
      itemCount: isIos ? contactList.length + 2 : contactList.length + 1,
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey.shade200,
          thickness: 1.0,
          indent: isIos && index == 0 ? 0.0 : 75.0,
        );
      },
      itemBuilder: (ctx, index) {
        if (index == 0 && isIos) {
          return const SearchBar();
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
          final user = contactList[isIos ? index - 2 : index - 1];
          return ContactCard(user: user);
        }
      },
    );
  }
}
