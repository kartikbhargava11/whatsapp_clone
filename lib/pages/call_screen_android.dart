import 'package:flutter/material.dart';

import '../widgets/calls_list.dart';

import '../data/data.dart';

class CallScreenAndroid extends StatefulWidget {
  const CallScreenAndroid({Key? key}) : super(key: key);

  @override
  State<CallScreenAndroid> createState() => _CallScreenAndroidState();
}

class _CallScreenAndroidState extends State<CallScreenAndroid> {

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
          Icons.phone_in_talk_outlined
        ),
      ),
      body: CallsList(
        scrollController: _scrollController,
        calls: calls,
      ),
    );
  }
}
