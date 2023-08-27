import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingContent.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

import '../../../../Model/FollowesModel.dart';
import '../../../../common files/global.dart';
import '../../../../common files/sized_box.dart';
import '../../../../services/follower_following_service.dart';

class myFollowingCard extends StatefulWidget {
  const myFollowingCard({
    super.key,
  });

  @override
  State<myFollowingCard> createState() => _myFollowingState();
}

class _myFollowingState extends State<myFollowingCard> {
  int currentIndex = 0;

  var futureData;
  List<Followers>? followers;
  final FollowerFollowing followerFollowing = FollowerFollowing();

  // List<>? followings;



  // int index = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
    futureData = followerFollowing.getfollowfollowing();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            FutureBuilder<Followes>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  followers = snapshot.data!.data!.followers;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: followers!.length,
                    itemBuilder: (context, index) {
                      final follower = followers![index].follower;
                      return followinglistCard(
                        profileImage: follower!.profileImage,
                        name: follower.firstName! + " " + follower.lastName!,
                        userName: follower.username!, 
                        userId: follower.id!, 
                        index: index, 
                        isFollower: follower.isFollowing
                      );
                      // return followinglistCard(
                      //   // followingData[index]["recipeimage"],
                      //   // follower.profileImage,
                      //   // followingData[index]["title"],
                      //   // followingData[index]["name"],
                      //   // index,
                      //   // followingData[index]["isFollowedByMe"],
                      // );

                      // return followerlistCard(
                      //   // followerData[index]["recipeimage"],
                      //   following.profileImage,

                      //   // followerData[index]["title"],
                      //   following.firstName! + " " + following.lastName!,
                      //   // followerData[index]["name"],
                      //   following.username,
                      //   index,
                      //   isFollowing: following.isFollowing,
                      //   userId: following.id!

                      //   // followerData[index]["isFollowedByMe"],
                      // );
                      // final follower = followers[index].follower;
                      // return invite(
                      //   firstname: follower!.firstName!,
                      //   username: follower.username!,
                      //   profileimage: follower.profileImage,
                      //   userId: follower.id!,
                      //   index: index,
                      //   selectedIds: selectedIds,
                      //   onInvitePressed: (id) {
                      //     // Handle invite button pressed
                      //     print('Invite button pressed for: $id');
                      //   },
                      // );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load followers'));
                } else {
                  return Container();
                }
              },
            ),


            // ListView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: followingData.length,
            //     itemBuilder: (context, index) {
            //       return Column(
            //         children: [
            //           followinglistCard(
            //             followingData[index]["recipeimage"],
            //             followingData[index]["title"],
            //             followingData[index]["name"],
            //             index,
            //             followingData[index]["isFollowedByMe"],
            //           )
            //         ],
            //       );
            //     })
       
          ],
        ),
      ),
    );
  }

  Widget followinglistCard({
    String? profileImage,
    required String name,
    required String userName,
    required String userId,

    // dynamic title, 
    // dynamic name,
    required int index, 
    required bool isFollower,
    }
    ) {
    // bool like = false;

    return Column(
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
                Container(
                  width: 50.h,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.h),
                    image: profileImage == null 
                      ? DecorationImage(
                        image: AssetImage("assets/default_profile.webp"),
                        fit: BoxFit.fill
                      )
                      : DecorationImage(
                        image: NetworkImage(
                          ApiUrls.base + "${profileImage}"
                        ),
                        fit: BoxFit.fill
                      )
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: 35.w,
                  child: SvgPicture.asset(
                    "assets/rating-svgrepo-com.svg",
                    height: 22.h,
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
                  // title,
                  name,
                  // "Priyanka Joshi",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF54595F)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  // name,
                  "@$userName",
                  //    "@priyujoshi",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(59, 63, 67, 0.49)),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // removeDailog(
                //   // userName: userNamepub,

                // );
                // removeDailog( 
                  
                // );
              },
              child: Container(
                width: 80.w,
                decoration: BoxDecoration(
                  color: AppColors.greyD3B3F43,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey.shade700),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.h),
                  child: Center(
                    child: textWhite14Robo("Remove"),
                  ),
                ),
              )
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
        Divider(
          endIndent: 20.w,
          indent: 20.w,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  removeDailog({String? profileImage,
    required String userName
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        insetPadding: const EdgeInsets.symmetric(vertical: 10),
        // title: Text(
        //   "Sign Out",
        //   style: TextStyle(
        //       fontFamily: 'Studio Pro',
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18.sp,
        //       color: const Color(0xff3B3F43)),
        // ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50.h,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.h),
                image: profileImage == null 
                  ? DecorationImage(
                    image: AssetImage("assets/default_profile.webp"),
                    fit: BoxFit.fill
                  )
                  : DecorationImage(
                    image: NetworkImage(
                      ApiUrls.base + "${profileImage}"
                    ),
                    fit: BoxFit.fill
                  )
              ),
            ),

            sizedBoxWidth(10.w),
             
            Text(
              "Are you sure you want to remove @$userName",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: const Color(0xff54595F)),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xff000000)),
            ),
          ),
          sizedBoxWidth(15.sp),
          InkWell(
            onTap: () async {
            },
            child: Text(
              "Sign out",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xffB90101)),
            ),
          ),
          sizedBoxWidth(15.w),
        ],
      ),
    );
  }

}
