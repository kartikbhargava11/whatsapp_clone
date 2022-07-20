import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_list.dart';

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
        padding: const EdgeInsetsDirectional.only(start: 2.0, end: 16.0, bottom: 0.0),
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
            CupertinoIcons.pencil_ellipsis_rectangle,
            size: 24.0,
            color: Colors.blue
          ),
        )
      ),
      child: ChatList(
        scrollController: _scrollController,
      )
    );
  }
}
