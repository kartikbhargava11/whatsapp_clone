import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../data/data.dart';

class StatusScreenIos extends StatefulWidget {
  const StatusScreenIos({Key? key}) : super(key: key);

  @override
  State<StatusScreenIos> createState() => _StatusScreenIosState();
}

class _StatusScreenIosState extends State<StatusScreenIos> {
  late ScrollController _scrollController;
  var _scrollOffset = 0.0;
  final List<Widget> _recentStatus = [];
  final List<Widget> _viewedStatus = [];
  var _isLoaded = false;

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
    if (!_isLoaded) {
      for (var index = 0; index < recentUpdates.length; index++) {
        final status = recentUpdates[index];
        _recentStatus.add(
          Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue,
                      ),
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            status.user.profilePhoto
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            status.user.contactName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600
                            )
                        ),
                        Text(
                            status.timestamp,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
              if (index != recentUpdates.length - 1)
                Divider(
                  color: Colors.grey.shade200,
                  thickness: 1.0,
                  indent: 60.0,
                )
            ],
          )
        );
      }
      for (var index = 0; index < viewedUpdates.length; index++) {
        final status = viewedUpdates[index];
        _viewedStatus.add(
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        status.user.profilePhoto
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              status.user.contactName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          Text(
                              status.timestamp,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
                if (index != viewedUpdates.length - 1)
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 1.0,
                    indent: 60.0,
                  )
              ],
            )
        );
      }
      setState(() {
        _isLoaded = true;
      });
    }
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        border: _scrollOffset < 200 ? const Border(bottom: BorderSide(color: Colors.transparent)) : Border(bottom: BorderSide(color: Colors.grey.shade300)),
        padding: const EdgeInsetsDirectional.only(start: 12.0),
        middle: Text(
          _scrollOffset < 200 ? "" : "Status",
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0
          ),
        ),
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            "Privacy",
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    )
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CupertinoSearchTextField(),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24.0,
                        backgroundImage: NetworkImage(
                            currentUser.profilePhoto
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.add,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "My Status",
                          style: TextStyle(
                            fontWeight: FontWeight.w600
                          )
                        ),
                        Text(
                          "Add to my status",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0
                          )
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                              CupertinoIcons.camera_fill
                          ),
                        )
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.pencil
                          ),
                        )
                      )
                    ],
                  )
                ],
              )
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "RECENT UPDATES",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0
                    )
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                children: _recentStatus,
              )
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "VIEWED UPDATES",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0
                    )
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                children: _viewedStatus,
              )
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 100.0),
          )
        ],
      ),
    );
  }
}
