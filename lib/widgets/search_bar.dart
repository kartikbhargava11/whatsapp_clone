import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chats",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            )
          ),
          const SizedBox(
            height: 5.0,
          ),

          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: const [
              Text(
                "Broadcast Lists",
                style: TextStyle(
                  color: Colors.blue,
                )
              ),
              Spacer(),
              Text(
                "New Group",
                style: TextStyle(
                  color: Colors.blue,
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
