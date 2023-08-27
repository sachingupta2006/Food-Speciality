// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class ViewCommunity extends StatefulWidget {
  const ViewCommunity({super.key});

  @override
  State<ViewCommunity> createState() => _ViewCommunityState();
}

class _ViewCommunityState extends State<ViewCommunity> {
  final communityId = Get.arguments["communityId"];
  final communityProfileImage = Get.arguments["communityProfileImage"];
  final communityName = Get.arguments["communityName"];
  final communitymembers = Get.arguments["communitymembers"];
  final communityDescription = Get.arguments["communityDescription"];
  final membersName = Get.arguments["membersName"];
  final membersProfileImage = Get.arguments["membersProfileImage"];
  final membersId = Get.arguments["membersId"];
  final memberFirstname = Get.arguments["memberFirstname"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 35.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          "assets/icons/back_arrow.svg",
                          height: 25.h,
                          // width: 40.w,
                          color: AppColors.greyD3B3F43,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/EditCommunity", arguments: {
                            "communityId": communityId,
                            "communityProfileImage": communityProfileImage,
                            "communityName": communityName,
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 30.h,
                        ),
                      ),
                    ],
                  ),

                  sizedBoxHeight(10.h),

                  Container(
                    width: 120.h,
                    height: 120.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 3.h,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            // offset: Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://77.68.102.23:8000/${communityProfileImage}"),
                            fit: BoxFit.cover)),
                    // child: YourChildWidget(),
                  ),

                  sizedBoxHeight(10.h),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        communityName ?? "",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "$communitymembers Participants",
                        style: TextStyle(
                            color: const Color(0xFF3B3F43), fontSize: 13.sp),
                      ),
                      sizedBoxHeight(16.h),
                      Text(
                        communityDescription ?? "",
                        style: TextStyle(
                            color: const Color(0xFF3B3F43), fontSize: 13.sp),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(10.0),
                  //   child: Container(
                  //     // height: 100.0,
                  //     margin: const EdgeInsets.only(top: 6.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                  //       color: Colors.white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey,
                  //           offset: Offset(0.0, 1.0), //(x,y)
                  //           blurRadius: 5.0,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   // height: 375.h,
                  //   // color: AppColors.white,
                  //   decoration: BoxDecoration(
                  //       color: AppColors.white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: AppColors.greyLtEBEBEB,
                  //           blurRadius: 1.h,
                  //           spreadRadius: 1.h,
                  //           offset: Offset(0, -5.h)
                  //         ),
                  //       ],

                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(20.h),
                  //         topRight: Radius.circular(20.h)
                  //       )
                  //   ),
                  // )
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.h),
                child: Container(
                  // height: 100.0,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 6.h),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/addparticipantsexistingcommunity",
                                arguments: {
                                  "communityId": communityId,
                                  "membersName": membersName,
                                  "membersProfileImage": membersProfileImage,
                                  "membersId": membersId,
                                  "memberFirstname": memberFirstname
                                });
                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 32.r,
                                    backgroundColor: AppColors.grey54595F,
                                    // color: Color(0xFF54595F),
                                  ),
                                  const Positioned.fill(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/icons/Vector.png")),
                                  )
                                ],
                              ),
                              sizedBoxWidth(10.w),
                              textgreyD16BoldSP("Add participants"),
                            ],
                          ),
                        ),
                        sizedBoxHeight(30.h),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: int.parse(communitymembers),
                          separatorBuilder: (context, index) {
                            return sizedBoxHeight(20.h);
                          },
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: 60.h,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: NetworkImage(
                                          // "http://77.68.102.23:8000/${membersProfileImage[index] ?? ""}"),
                                          ""), fit: BoxFit.cover)),
                                ),
                                sizedBoxWidth(10.w),
                                textBlack18bold(membersName[index]),
                              ],
                            );
                          },
                        ),
                        sizedBoxHeight(40.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/exit_grp.svg",
                              height: 40.h,
                            ),
                            sizedBoxWidth(10.w),
                            textgreyD16BoldSP("Exit group"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
