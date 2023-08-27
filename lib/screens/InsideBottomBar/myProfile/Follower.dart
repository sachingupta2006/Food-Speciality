import 'package:flutter/material.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerCard.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';

class Follower extends StatefulWidget {
  const Follower({super.key});

  @override
  State<Follower> createState() => _FollowingState();
}

ScrollController? followingcontroller;

class _FollowingState extends State<Follower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Followers"),
      body: SingleChildScrollView(
        controller: followingcontroller,
        child: Column(
          children: [
            myFollowingCard(),
            // MyfollowingCardNew()
          ],
        ),
      ),
    );
  }
}
