import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/calls_list.dart';

import '../data/data.dart';

enum Calling {
  all,
  missed
}


class CallsScreenIos extends StatefulWidget {
  const CallsScreenIos({Key? key}) : super(key: key);

  @override
  State<CallsScreenIos> createState() => _CallsScreenIosState();
}

class _CallsScreenIosState extends State<CallsScreenIos> {
  late ScrollController _scrollController;
  var _scrollOffset = 0.0;
  Calling _selectedSegment = Calling.all;
  var _showOnlyMissed = false;

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
        border: _scrollOffset < 200 ? const Border(bottom: BorderSide(color: Colors.transparent)) : Border(bottom: BorderSide(color: Colors.grey.shade300)),
        backgroundColor: CupertinoColors.white,
        padding: const EdgeInsetsDirectional.only(start: 2.0, end: 16.0),
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            "Edit",
            style: TextStyle(
              fontSize: 16.0,
              color: CupertinoColors.link
            )
          ),
        ),
        middle: CupertinoSlidingSegmentedControl(
          onValueChanged: (Calling? value) {
            if (value != null) {
              if (value == Calling.missed) {
                _showOnlyMissed = true;
              } else {
                _showOnlyMissed = false;
              }
              setState(() {
                _selectedSegment = value;
              });
            }
          },
          groupValue: _selectedSegment,
          children: const {
            Calling.all: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                "All",
                style: TextStyle(
                  fontSize: 14.0
                )
              ),
            ),
            Calling.missed: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                "Missed",
                style: TextStyle(
                  fontSize: 14.0
                )
              ),
            )
          },
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: const Icon(
            CupertinoIcons.phone_badge_plus,
            color: CupertinoColors.link,
            size: 28.0,
          ),
        ),
      ),
      child: CallsList(
        scrollController: _scrollController,
        calls: _showOnlyMissed ? missedCalls : calls,
      ),
    );
  }
}
