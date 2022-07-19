import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

import '../widgets/contact_card.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  var _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: _scrollOffset < 200 ? const Border(bottom: BorderSide(color: Colors.transparent)) : Border(bottom: BorderSide(color: Colors.grey.shade300)),
        padding: const EdgeInsetsDirectional.only(start: 2.0, end: 2.0),
        middle: Text(
          _scrollOffset < 200 ? "" : "Chats",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0
          ),
        ),
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            "Edit",
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: const Icon(
            CupertinoIcons.pencil_circle,
            size: 30.0,
            color: Colors.blue
          ),
        )
      ),
      child: ListView.separated(
        controller: _scrollController,
        itemCount: contactList.length + 2,
        separatorBuilder: (ctx, index) {
          return Divider(
            color: Colors.grey.shade200,
            thickness: 1.0,
            indent: index == 0 ? 0.0 : 75.0,
          );
        },
        itemBuilder: (ctx, index) {
          if (index == 1) {
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
          }
          if (index == 0) {
            return const SearchBar();
          }
          final user = contactList[index - 2];
          return ContactCard(user: user);
        },
      )
    );
  }
}
