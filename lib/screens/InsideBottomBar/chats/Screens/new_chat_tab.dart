import 'package:flutter/material.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatCommunityPage.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatPage.dart';
import 'package:foodspeciality/utils/colors.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final tecComment = TextEditingController();
  int selectedVideoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // extendBody: true,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Column(
                children: [
                  CommanTabbar("Private", "Community"),
                ],
              ),
              Expanded(
                child: Container(
                  color: AppColors.greyLtEBEBEB,
                  child: const TabBarView(children: [
                    ChatPage(),
                    ChatCommunityPage(),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
