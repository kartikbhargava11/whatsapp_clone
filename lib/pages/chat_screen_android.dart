import 'package:flutter/material.dart';

import '../widgets/chat_list.dart';

class ChatScreenAndroid extends StatefulWidget {
  const ChatScreenAndroid({Key? key}) : super(key: key);

  @override
  State<ChatScreenAndroid> createState() => _ChatScreenAndroidState();
}

class _ChatScreenAndroidState extends State<ChatScreenAndroid> {

  final ScrollController _scrollController = ScrollController();

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
      body: ChatList(
        scrollController: _scrollController,
      ),
    );
  }
}
