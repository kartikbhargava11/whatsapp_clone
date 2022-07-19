import 'package:flutter/material.dart';
import './chat_list_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final _pages = [
    Scaffold(),
    ChatListScreen(),
    Scaffold(),
    Scaffold(),
  ];


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double yourWidth = width  / 5;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert
              ),
            ),
          ],
          backgroundColor: Colors.green[600],
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 22.0
          ),
          title: const Text("WhatsApp"),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Container(
                width: 30,
                height: 50,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.camera_alt,
                ),
              ),
              Container(
                  width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("CHATS")),
              Container(
                  width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("STATUS")),
              Container(
                width: yourWidth,
                height: 50,
                alignment: Alignment.center,
                child: Text("CALL"))
            ],
          ),
        ),
        body: TabBarView(
          children: _pages,
        ),
      )
    );
  }
}
