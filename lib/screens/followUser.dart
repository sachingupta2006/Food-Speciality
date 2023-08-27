import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerCard.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/new_profile.dart';
import 'package:foodspeciality/screens/grivviewuser.dart';
import 'package:foodspeciality/screens/viewUser.dart';
import 'package:get/get.dart';

class followUser extends StatefulWidget {
  const followUser({super.key});

  @override
  State<followUser> createState() => _followUserState();
}

ScrollController? controller;
ScrollController? _scrollviewcontroller;

class _followUserState extends State<followUser> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF3B3F43),
            ),
          ),
          actions: [
            PopupMenuButton(
              offset: const Offset(0, 50),
              color: const Color(0xFFFFFFFF),
              tooltip: '',
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(59, 63, 67, 0.49),
                  ),
                  // height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                        child: Text(
                      "Links",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14.sm,
                      ),
                    )),
                  ),
                ),
              ),
              onSelected: (value) {
                if (value == '/logout') {
                } else if (value == "/myProfile") {
                  Get.toNamed('/myprofile');
                }
              },
              itemBuilder: (BuildContext bc) {
                return [
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/website-ui-web-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Website",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/instagram-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Instagram",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/twitter-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Twitter",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/pinterest-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Pintrest",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/facebook-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Facebook",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ];
              },
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  "Notifications",
                  "Notification turned on",
                );
              },
              child: const Icon(
                Icons.notifications_none_outlined,
                color: Color(0xFF3B3F43),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            PopupMenuButton(
              offset: const Offset(0, 50),
              color: const Color(0xFFFFFFFF),
              tooltip: '',
              child: const Icon(
                Icons.more_vert,
                color: Color(0xFF3B3F43),
              ),
              onSelected: (value) {
                if (value == 'share') {
                  share();
                } else if (value == "Report") {
                  Get.toNamed('/Report');
                } else if (value == "block") {
                  showDialog(
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.all(15.w),
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        insetPadding: const EdgeInsets.symmetric(vertical: 10),
                        title: Text(
                          "Block User",
                          style: TextStyle(
                              fontFamily: 'Studio Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: const Color(0xff3B3F43)),
                        ),
                        content: SizedBox(
                          // margin: EdgeInsets.symmetric(horizontal: 10.w),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Are you sure you want to Block @priyujoshi?",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.sp,
                                color: const Color(0xff54595F)),
                          ),
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
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/blocklistfull");
                              // Get.back();

                              // _canPop = true;
                            },
                            child: Text(
                              "Block User",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0xffB90101)),
                            ),
                          ),
                          sizedBoxWidth(15.sp),
                        ],
                      ),
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext bc) {
                return [
                  PopupMenuItem(
                    value: 'share',
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/share-svgrepo-com.svg",
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Share",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Report',
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/question-circle-svgrepo-com.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              "Report",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'block',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/block-svgrepo-com.svg",
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          "Block",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
            SizedBox(
              width: 13.w,
            ),
          ],
        ),
        body: NestedScrollView(
          controller: _scrollviewcontroller,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (context, index) => Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: CircleAvatar(
                                      radius: 51.r,
                                      backgroundColor: Colors.grey,
                                      child: const Image(
                                        image: AssetImage(
                                            "assets/Mask Group 86.png"),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0.h,
                                      left: 100.w,
                                      child: SvgPicture.asset(
                                          "assets/rating-svgrepo-com.svg")),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "Priyanka Joshi",
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
                                "@priyujoshi",
                                style: TextStyle(
                                    fontFamily: "StudioProR",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(59, 63, 67, 0.49)),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "I love Cooking. Here to learn and share!",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF54595F),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 150.w,
                                      height: 40.h,
                                      child: OutlinedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                side: const BorderSide(
                                                  width: 3,
                                                  color: Color(0xFF3B3F43),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Following",
                                            style: TextStyle(
                                                fontFamily: "StudioProR",
                                                fontSize: 18.sm,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF3B3F43)),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      height: 40.h,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          // ignore: deprecated_member_use
                                          primary: const Color(0xFF3B3F43),
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Color(0xFF707070)),
                                            borderRadius:
                                                BorderRadius.circular(8.h),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/messages.svg"),
                                            SizedBox(
                                              width: 10.h,
                                            ),
                                            Text(
                                              "Message",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sm,
                                                fontFamily: 'StudioProR',
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Get.toNamed("/chatdetail");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                            ],
                          ))),
            ];
          },
          body: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              TabBar(
                  indicatorColor: const Color(0xFF3B3F43),
                  unselectedLabelStyle:
                      const TextStyle(color: Color(0xFF6B6B6B)),
                  tabs: [
                    Tab(
                      height: 70.h,
                      child: Column(
                        children: [
                          Text(
                            '169',
                            style: TextStyle(
                                fontFamily: "StudioProR",
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff000000),
                                fontSize: 20.sp),
                          ),
                          Text(
                            'Recipes',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff54595F),
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      height: 70.h,
                      child: Column(
                        children: [
                          Text(
                            '520',
                            style: TextStyle(
                                fontFamily: "StudioProR",
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff000000),
                                fontSize: 20.sp),
                          ),
                          Text(
                            'Saved',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff54595F),
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      height: 70.h,
                      child: Column(
                        children: [
                          Text(
                            '4.1k',
                            style: TextStyle(
                                fontFamily: "StudioProR",
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff000000),
                                fontSize: 20.sp),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff54595F),
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      height: 70.h,
                      child: Column(
                        children: [
                          Text(
                            '8.6k',
                            style: TextStyle(
                                fontFamily: "StudioProR",
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff000000),
                                fontSize: 20.sp),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff54595F),
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ]),
              Expanded(
                child: TabBarView(children: [
                  SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        children: [
                          const Gridview(),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      )),
                  SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        children: [
                          const Gridview(),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      )),
                  const myFollowingCard(),
                  const myFollowingCard(),
                ]),
              ),
            ],
          ),
        ),
      ),

      //  Scaffold(
      //   backgroundColor: Colors.white,
      //   body: Column(
      //     children: [
      //       AppBar(
      //         backgroundColor: Color(0xFFFFFFFF),
      //         leading: GestureDetector(
      //           onTap: () {
      //             Get.back();
      //           },
      //           child: Icon(
      //             Icons.arrow_back,
      //             color: Color(0xFF3B3F43),
      //           ),
      //         ),
      //         actions: [
      //           PopupMenuButton(
      //             offset: const Offset(0, 50),
      //             color: const Color(0xFFFFFFFF),
      //             tooltip: '',
      //             child: Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 15.0),
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(20),
      //                   color: Color.fromRGBO(59, 63, 67, 0.49),
      //                 ),
      //                 // height: 30,
      //                 child: Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //                   child: Center(
      //                       child: Text(
      //                     "Links",
      //                     style: TextStyle(
      //                       fontFamily: "Roboto",
      //                       fontSize: 14.sm,
      //                     ),
      //                   )),
      //                 ),
      //               ),
      //             ),
      //             onSelected: (value) {
      //               if (value == '/logout') {
      //               } else if (value == "/myProfile") {
      //                 Get.toNamed('/myprofile');
      //               }
      //             },
      //             itemBuilder: (BuildContext bc) {
      //               return [
      //                 PopupMenuItem(
      //                   value: '',
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         "assets/website-ui-web-svgrepo-com.svg",
      //                         height: 25,
      //                         width: 25,
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         "Website",
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 PopupMenuItem(
      //                   value: '',
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         "assets/instagram-svgrepo-com.svg",
      //                         height: 25,
      //                         width: 25,
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         "Instagram",
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 PopupMenuItem(
      //                   value: '',
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         "assets/twitter-svgrepo-com.svg",
      //                         height: 25,
      //                         width: 25,
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         "Twitter",
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 PopupMenuItem(
      //                   value: '',
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         "assets/pinterest-svgrepo-com.svg",
      //                         height: 25,
      //                         width: 25,
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         "Pintrest",
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 PopupMenuItem(
      //                   value: '',
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         "assets/facebook-svgrepo-com.svg",
      //                         height: 25,
      //                         width: 25,
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Text(
      //                         "Facebook",
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               ];
      //             },
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Icon(
      //             Icons.notifications_none_outlined,
      //             color: Color(0xFF3B3F43),
      //           ),
      //           SizedBox(
      //             width: 15.w,
      //           ),
      //           PopupMenuButton(
      //             offset: const Offset(0, 50),
      //             color: const Color(0xFFFFFFFF),
      //             tooltip: '',
      //             child: Icon(
      //               Icons.more_vert,
      //               color: Color(0xFF3B3F43),
      //             ),
      //             onSelected: (value) {
      //               if (value == 'share') {
      //                 share();
      //               } else if (value == "Report") {
      //                 Get.toNamed('/Report');
      //               } else if (value == "block") {
      //                 showDialog(
      //                   context: context,
      //                   builder: (context) => Padding(
      //                     padding: EdgeInsets.all(15.w),
      //                     child: AlertDialog(
      //                       shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(10.r)),
      //                       insetPadding:
      //                           const EdgeInsets.symmetric(vertical: 10),
      //                       title: Text(
      //                         "Block User",
      //                         style: TextStyle(
      //                             fontFamily: 'Studio Pro',
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 18.sp,
      //                             color: const Color(0xff3B3F43)),
      //                       ),
      //                       content: SizedBox(
      //                         // margin: EdgeInsets.symmetric(horizontal: 10.w),
      //                         width: MediaQuery.of(context).size.width,
      //                         child: Text(
      //                           "Are you sure you want to Block @priyujoshi?",
      //                           style: TextStyle(
      //                               fontFamily: 'Roboto',
      //                               fontSize: 16.sp,
      //                               color: const Color(0xff54595F)),
      //                         ),
      //                       ),
      //                       actions: [
      //                         InkWell(
      //                           onTap: () {
      //                             Get.back();
      //                           },
      //                           child: Text(
      //                             "Cancel",
      //                             style: TextStyle(
      //                                 fontFamily: "Roboto",
      //                                 fontWeight: FontWeight.w500,
      //                                 fontSize: 16.sp,
      //                                 color: const Color(0xff000000)),
      //                           ),
      //                         ),
      //                         sizedBoxWidth(15.sp),
      //                         GestureDetector(
      //                           onTap: () {
      //                             Get.toNamed("/blocklistfull");
      //                             // Get.back();

      //                             // _canPop = true;
      //                           },
      //                           child: Text(
      //                             "Block User",
      //                             style: TextStyle(
      //                                 fontFamily: "Roboto",
      //                                 fontWeight: FontWeight.w500,
      //                                 fontSize: 16.sp,
      //                                 color: const Color(0xffB90101)),
      //                           ),
      //                         ),
      //                         sizedBoxWidth(15.sp),
      //                       ],
      //                     ),
      //                   ),
      //                 );
      //               }
      //             },
      //             itemBuilder: (BuildContext bc) {
      //               return [
      //                 PopupMenuItem(
      //                   value: 'share',
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         children: [
      //                           SvgPicture.asset(
      //                             "assets/share-svgrepo-com.svg",
      //                             height: 20,
      //                             width: 20,
      //                           ),
      //                           SizedBox(
      //                             width: 15,
      //                           ),
      //                           Text(
      //                             "Share",
      //                             style: TextStyle(
      //                                 color: Colors.black,
      //                                 fontFamily: "Roboto",
      //                                 fontSize: 16),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 PopupMenuItem(
      //                   value: 'Report',
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         children: [
      //                           SvgPicture.asset(
      //                             "assets/question-circle-svgrepo-com.svg",
      //                             height: 20.h,
      //                             width: 20.w,
      //                           ),
      //                           SizedBox(
      //                             width: 15.w,
      //                           ),
      //                           Text(
      //                             "Report",
      //                             style: TextStyle(
      //                                 color: Colors.black,
      //                                 fontFamily: "Roboto",
      //                                 fontSize: 16.sp),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 PopupMenuItem(
      //                   value: 'block',
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         "assets/block-svgrepo-com.svg",
      //                         height: 20.h,
      //                         width: 20.w,
      //                       ),
      //                       SizedBox(
      //                         width: 15.w,
      //                       ),
      //                       Text(
      //                         "Block",
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontFamily: "Roboto",
      //                             fontSize: 16.sp),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ];
      //             },
      //           ),
      //           SizedBox(
      //             width: 13.w,
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 10.h,
      //       ),
      //       Stack(
      //         children: [
      //           SizedBox(
      //             width: 150,
      //             child: CircleAvatar(
      //               radius: 51.r,
      //               backgroundColor: Colors.grey,
      //               child: const Image(
      //                 image: AssetImage("assets/Mask Group 86.png"),
      //               ),
      //             ),
      //           ),
      //           Positioned(
      //               bottom: 0.h,
      //               left: 100.w,
      //               child: SvgPicture.asset("assets/rating-svgrepo-com.svg")),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 15.h,
      //       ),
      //       Text(
      //         "Priyanka Joshi",
      //         style: TextStyle(
      //             fontFamily: "StudioProR",
      //             fontSize: 18.sp,
      //             fontWeight: FontWeight.bold,
      //             color: Color(0xFF54595F)),
      //       ),
      //       SizedBox(
      //         height: 5.h,
      //       ),
      //       Text(
      //         "@priyujoshi",
      //         style: TextStyle(
      //             fontFamily: "StudioProR",
      //             fontSize: 14.sp,
      //             fontWeight: FontWeight.w500,
      //             color: Color.fromRGBO(59, 63, 67, 0.49)),
      //       ),
      //       SizedBox(
      //         height: 15.h,
      //       ),
      //       Text(
      //         "I love Cooking. Here to learn and share!",
      //         style: TextStyle(
      //           fontFamily: "Roboto",
      //           fontSize: 16.sp,
      //           fontWeight: FontWeight.w500,
      //           color: Color(0xFF54595F),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20.h,
      //       ),
      //       // Padding(
      //       //   padding: const EdgeInsets.symmetric(horizontal: 103.0),
      //       //   child: CustomNextButton(text: "Follow"),
      //       // ),      Padding(

      //       SizedBox(
      //         height: 40.h,
      //       ),

      //       TabBar(
      //           indicatorColor: const Color(0xFF3B3F43),
      //           unselectedLabelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
      //           tabs: [
      //             Tab(
      //               height: 70.h,
      //               child: Column(
      //                 children: [
      //                   Text(
      //                     '1',
      //                     style: TextStyle(
      //                         fontFamily: "StudioProR",
      //                         fontWeight: FontWeight.w700,
      //                         color: const Color(0xff000000),
      //                         fontSize: 20.sp),
      //                   ),
      //                   Text(
      //                     'Recipes',
      //                     style: TextStyle(
      //                         fontFamily: "Roboto",
      //                         fontWeight: FontWeight.w500,
      //                         color: const Color(0xff54595F),
      //                         fontSize: 16.sp),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Tab(
      //               height: 70.h,
      //               child: Column(
      //                 children: [
      //                   Text(
      //                     '0',
      //                     style: TextStyle(
      //                         fontFamily: "StudioProR",
      //                         fontWeight: FontWeight.w700,
      //                         color: const Color(0xff000000),
      //                         fontSize: 20.sp),
      //                   ),
      //                   Text(
      //                     'Saved',
      //                     style: TextStyle(
      //                         fontFamily: "Roboto",
      //                         fontWeight: FontWeight.w500,
      //                         color: const Color(0xff54595F),
      //                         fontSize: 16.sp),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Tab(
      //               height: 70.h,
      //               child: Column(
      //                 children: [
      //                   Text(
      //                     '5',
      //                     style: TextStyle(
      //                         fontFamily: "StudioProR",
      //                         fontWeight: FontWeight.w700,
      //                         color: const Color(0xff000000),
      //                         fontSize: 20.sp),
      //                   ),
      //                   Text(
      //                     'Following',
      //                     style: TextStyle(
      //                         fontFamily: "Roboto",
      //                         fontWeight: FontWeight.w500,
      //                         color: const Color(0xff54595F),
      //                         fontSize: 16.sp),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Tab(
      //               height: 70.h,
      //               child: Column(
      //                 children: [
      //                   Text(
      //                     '6',
      //                     style: TextStyle(
      //                         fontFamily: "StudioProR",
      //                         fontWeight: FontWeight.w700,
      //                         color: const Color(0xff000000),
      //                         fontSize: 20.sp),
      //                   ),
      //                   Text(
      //                     'Followers',
      //                     style: TextStyle(
      //                         fontFamily: "Roboto",
      //                         fontWeight: FontWeight.w500,
      //                         color: const Color(0xff54595F),
      //                         fontSize: 16.sp),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ]),
      //       Expanded(
      //         child: TabBarView(children: [
      //           SingleChildScrollView(
      //               controller: controller,
      //               child: Column(
      //                 children: [
      //                   const Gridview(),
      //                   SizedBox(
      //                     height: 20.h,
      //                   )
      //                 ],
      //               )),
      //            mySaved(),
      //           const myFollowingCard(),
      //           const myFollowerCard()
      //         ]),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
