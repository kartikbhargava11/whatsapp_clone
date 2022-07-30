import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



import '../models/call.dart';

class CallsList extends StatelessWidget {
  final List<Call> calls;
  final ScrollController scrollController;
  const CallsList({
    required this.calls,
    required this.scrollController,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIos = Platform.isIOS;
    return ListView.separated(
      padding: isIos ? const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 100.0) : const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      itemCount: isIos ? calls.length + 1 : calls.length,
      separatorBuilder: ((ctx, index) {
        return isIos
          ?
        Divider(
          color: Colors.grey.shade300,
          thickness: 1.0,
          indent: 50.0,
        )
          :
        const Divider(
          color: Colors.transparent,
          thickness: 0
        );
      }),
      itemBuilder: ((ctx, index) {
        if (index == 0 && isIos) {
          return const _SearchBar();
        }
        final caller = calls[isIos ? index - 1 : index];
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
    final isIos = Platform.isIOS;
    final isAndroid = Platform.isAndroid;
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
                child: isIos
                  ?
                Text(
                  "${caller.user.contactName} ${caller.numberOfCalls > 1 ?  '(${caller.numberOfCalls})' : ''}",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: caller.isMissed ? Colors.red : Colors.black
                  )
                )
                  :
                Text(
                  caller.user.contactName,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )
                )
              ),
              if(isIos)
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
              if(isAndroid)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Icon(
                        caller.isIncomingCall ? Icons.call_received : Icons.call_made,
                        size: 14.0,
                        color: caller.isMissed ? Colors.red : Colors.green,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        caller.timestamp,
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
        if (isIos)
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
        if (isAndroid)
          Icon(
            caller.isAudioCall ? Icons.phone : Icons.videocam,
            color: Colors.green,
          )
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
      children: const [
        Text(
          "Calls",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          )
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoSearchTextField(),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}


