import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
