import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/Model/FollowesModel.dart';
import 'package:foodspeciality/common%20files/commonInviteButton.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/services/create_community_service.dart';
import 'package:foodspeciality/services/follower_following_service.dart';
import 'package:get/get.dart';

class CommunityAddParticipants extends StatefulWidget {
  const CommunityAddParticipants({Key? key}) : super(key: key);

  @override
  State<CommunityAddParticipants> createState() =>
      _CommunityAddParticipantsState();
}

class _CommunityAddParticipantsState extends State<CommunityAddParticipants> {
  final FollowerFollowing followerFollowing = FollowerFollowing();
  List<String> selectedIds = [];
  String? revname;
  String? revdesp;

  @override
  void initState() {
    revname = Get.arguments["name"];
    revdesp = Get.arguments["description"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF3B3F43),
                    ),
                  ),
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Community",
                  style: TextStyle(
                    fontFamily: "StudioProR",
                    fontSize: 18.spMin,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Add Participants",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14.spMin,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFF707070),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ]),
          Container(
            height: 670.h,
            child: FutureBuilder<Followes>(
              future: followerFollowing.getfollowfollowing(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  final followers = snapshot.data!.data!.followers;
                  return ListView.builder(
                    itemCount: followers!.length,
                    itemBuilder: (context, index) {
                      final follower = followers[index].follower;
                      return invite(
                        firstname: follower!.firstName!,
                        username: follower.username!,
                        profileimage: follower.profileImage,
                        userId: follower.id!,
                        index: index,
                        selectedIds: selectedIds,
                        onInvitePressed: (id) {
                          // Handle invite button pressed
                          print('Invite button pressed for: $id');
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load followers'));
                } else {
                  return Container();
                }
              },
            ),
        
          ),
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xFF3B3F43),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                child: Text(
                  "Create",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sm,
                    fontFamily: 'StudioProR',
                  ),
                ),
                onPressed: () {
                  print(selectedIds.toString());
                  // CreateCommunityService().createCommunity(
                  //     name: Get.parameters['name'] ?? "",
                  //     description: Get.parameters['description'] ?? "",
                  //     members: selectedIds);
                  createCommunity(
                      accessToken!, selectedIds, revname!, revdesp!);
               
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class invite extends StatelessWidget {
  final String? profileimage;
  final String username;
  final String firstname;
  final String userId;
  final int index;
  final List<String> selectedIds;
  final Function(String) onInvitePressed;

  invite({
    Key? key,
    this.profileimage,
    required this.username,
    required this.firstname,
    required this.index,
    required this.selectedIds,
    required this.onInvitePressed,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isInvited = selectedIds.contains(username);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16.w,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 50,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.grey,
                      child: Image.asset(
                        profileimage ?? "assets/Mask Group 86.png",
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 35.w,
                    child: SvgPicture.asset(
                      "assets/rating-svgrepo-com.svg",
                      height: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstname,
                    style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF54595F),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "@$username",
                    style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(59, 63, 67, 0.49),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CommonInviteButton(
                text: isInvited ? "Invited" : "Invite",
                onPressed: (text, isInvited) {
                  if (isInvited) {
                    selectedIds.remove(userId.toString());
                  } else {
                    selectedIds.add(userId.toString());
                  }
                  onInvitePressed(userId.toString());
                },
              ),
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
          const Divider(
            endIndent: 20,
            indent: 20,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
