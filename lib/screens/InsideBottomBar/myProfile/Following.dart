import 'package:flutter/material.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerCard.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

ScrollController? followingcontroller;

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Following"),
      body: SingleChildScrollView(
        controller: followingcontroller,
        child: Column(
          children: [
            MyfollowingCardNew()

          ],
        ),
      ),
    );
  }
}
