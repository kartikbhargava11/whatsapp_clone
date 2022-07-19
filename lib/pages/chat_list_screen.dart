import 'package:flutter/material.dart';

import '../widgets/chat_list.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {

  late ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(
          Icons.chat
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12.0),
        child: ChatList(
          scrollController: _scrollController,
        ),
      ),
    );
  }
}
