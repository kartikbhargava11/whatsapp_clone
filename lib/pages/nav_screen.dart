import 'package:flutter/cupertino.dart';

import './chat_screen_ios.dart';
import './calls_screen_ios.dart';
import './status_screen_ios.dart';

class NavScreen extends StatefulWidget {


  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  final _pages = [
    const StatusScreenIos(),
    const CallsScreenIos(),
    CupertinoPageScaffold(child: SizedBox.shrink()),
    const ChatScreenIos(),
    CupertinoPageScaffold(child: SizedBox.shrink()),
  ];

  final _icons = {
    "Status": CupertinoIcons.time,
    "Calls": CupertinoIcons.phone,
    "Camera": CupertinoIcons.camera,
    "Chats": CupertinoIcons.chat_bubble_2_fill,
    "Settings": CupertinoIcons.settings,
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _icons.map((title, icon) {
          return MapEntry(title, BottomNavigationBarItem(
            icon: Icon(
              icon
            ),
            label: title
          ));
        }).values.toList(),
      ),
      tabBuilder: (ctx, index) {
        return CupertinoTabView(
          builder: (context) {
            return _pages[index];
          },
        );
      },
    );
  }
}
