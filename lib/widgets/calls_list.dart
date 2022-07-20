import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../data/data.dart';

import '../models/call.dart';

class CallsList extends StatelessWidget {
  final ScrollController scrollController;
  const CallsList({
    required this.scrollController,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 12.0),
      itemCount: calls.length + 1,
      separatorBuilder: ((ctx, index) {
        return Divider(
          color: Colors.grey.shade300,
          thickness: 1.0,
          indent: 50.0,
        );
      }),
      itemBuilder: ((ctx, index) {
        if (index == 0) {
          return const _SearchBar();
        }
        final caller = calls[index - 1];
        return _CallerCard(
          caller: caller
        );
      }),
    );
  }
}

class _CallerCard extends StatelessWidget {
  final Call caller;
  const _CallerCard({
    required this.caller,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              caller.user.profilePhoto
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "${caller.user.contactName} ${caller.numberOfCalls > 1 ?  '(${caller.numberOfCalls})' : ''}",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: caller.isMissed ? Colors.red : Colors.black
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Icon(
                      caller.isAudioCall ? Icons.phone : Icons.videocam,
                      size: 14.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      caller.isMissed ? 'Missed' : caller.isIncomingCall ? 'Incoming' : 'Outgoing',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey
                      )
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
                caller.timestamp,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                )
            ),
            const SizedBox(
              width: 4.0,
            ),
            const Icon(
              Icons.info_outline,
              size: 18.0,
            )
          ],
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Calls",
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
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
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
      ],
    );
  }
}


