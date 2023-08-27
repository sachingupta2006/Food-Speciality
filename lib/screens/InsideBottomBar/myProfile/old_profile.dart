// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodspeciality/common%20files/buttons.dart';
// import 'package:foodspeciality/common%20files/sized_box.dart';
// import 'package:foodspeciality/controllers/user_data_controller.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerCard.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';
// import 'package:foodspeciality/screens/bottom_bar.dart';
// import 'package:foodspeciality/screens/edit_profile.dart';
// import 'package:foodspeciality/screens/grivviewuser.dart';
// import 'package:foodspeciality/screens/setting/setting/setting.dart';
// import 'package:foodspeciality/utils/colors.dart';
// import 'package:foodspeciality/utils/texts.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class NewProfile extends StatefulWidget {
//   const NewProfile({super.key});

//   @override
//   State<NewProfile> createState() => _NewProfileState();
// }

// ScrollController? controller;
// ScrollController? _scrollviewcontroller;

// class _NewProfileState extends State<NewProfile> {
//   double? profileCompleted = 0.7;
//   UserDataController userDataController = Get.put(UserDataController());


//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     userDataController.getUserProfile();
//     print("gt");

//   }  

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: NestedScrollView(
//           controller: _scrollviewcontroller,
//           headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
//             return <Widget>[
//               SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                       childCount: 1,
//                       (context, index) => Column(
//                             children: [
//                               AppBar(
//                                 elevation: 0,
//                                 backgroundColor: const Color(0xFFFFFFFF),
//                                 centerTitle: true,
//                                 title: Text(
//                                   "Complete Your Profile",
//                                   style: TextStyle(
//                                       fontFamily: "StudioProR",
//                                       fontSize: 16.sp,
//                                       color: Colors.black),
//                                 ),
//                                 actions: [
//                                   InkWell(
//                                     onTap: () {
//                                       // Get.to(EditProfile());
//                                       // Get.toNamed("/EditProfile");
//                                       Get.to(EditProfile(),
//                                           duration:
//                                               const Duration(milliseconds: 500),
//                                           transition: Transition.downToUp);
//                                     },
//                                     child: Icon(
//                                       Icons.edit,
//                                       color: Colors.black,
//                                       size: 30.h,
//                                     ),
//                                   ),
//                                   sizedBoxWidth(20.w),
//                                   GestureDetector(
//                                     onTap: () {
//                                       // Get.toNamed("/setting");
//                                       Get.to(const Setting(),
//                                           duration:
//                                               const Duration(milliseconds: 500),
//                                           transition: Transition.downToUp);
//                                     },
//                                     child: Icon(
//                                       Icons.settings_outlined,
//                                       color: Colors.black,
//                                       size: 30.h,
//                                     ),
//                                   ),
//                                   sizedBoxWidth(18.w)
//                                 ],
//                               ),
//                               // Padding(
//                               //   padding: const EdgeInsets.all(0.0),
//                               //   child: CircularPercentIndicator(
//                               //     startAngle: 110,
//                               //     radius: 55.0,
//                               //     lineWidth: 7.0,
//                               //     animation: true,
//                               //     percent: 0.70,
//                               //     circularStrokeCap: CircularStrokeCap.round,
//                               //     progressColor: Colors.black,
//                               //     backgroundColor: Colors.grey,
//                               //     center: CircleAvatar(
//                               //       backgroundColor: Colors.blue,
//                               //       radius: 40.r,
//                               //       backgroundImage: AssetImage(
//                               //         'assets/profile.png',
//                               //       ),
//                               //     ),
//                               //   ),
//                               // ),
//                               //  ] ),

//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                                 child: Row(
//                                   children: [
//                                     // SizedBox(
//                                     //   // height: 200.w,
//                                     //   // width: 200.w,
//                                     //   child: CircularProgressIndicator(
//                                     //     value: 0.42,
//                                     //     strokeWidth: 5.w,
//                                     //     // semanticsValue: "df",
//                                     //     // color: AppColors.redFA5658,
//                                     //     backgroundColor: AppColors.lightBlueF2F2F2,
//                                     //     valueColor: AlwaysStoppedAnimation(Colors.red),
//                                     //   ),
//                                     // ),

//                                     sizedBoxWidth(10.w),

//                                     Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Container(
//                                           width: 80.h,
//                                           height: 80.h,
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               border: Border.all(
//                                                 color: AppColors.white,
//                                                 width: 3.h,
//                                               ),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.5),
//                                                   spreadRadius: 2,
//                                                   blurRadius: 5,
//                                                   // offset: Offset(0, 3), // changes the position of the shadow
//                                                 ),
//                                               ],
//                                               image: const DecorationImage(
//                                                   image: AssetImage(
//                                                       "assets/profile.png"),
//                                                   fit: BoxFit.cover)),
//                                           // child: YourChildWidget(),
//                                         ),
//                                         SizedBox(
//                                           height: 75.h,
//                                           width: 75.h,
//                                           child: CircularProgressIndicator(
//                                             value: 0.7,
//                                             strokeWidth: 4.w,
//                                             // semanticsValue: "df",
//                                             // color: AppColors.redFA5658,
//                                             backgroundColor:
//                                                 AppColors.lightBlueF2F2F2,
//                                             valueColor:
//                                                 const AlwaysStoppedAnimation(
//                                                     AppColors.grey54595F),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     sizedBoxWidth(5.w),

//                                     textgreyM14Robo((profileCompleted! * 100)
//                                             .toStringAsFixed(0) +
//                                         " %"),

//                                     sizedBoxWidth(10.w),

//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         //   Text(
//                                         //   "Namrata Burondkar",
//                                         //   style: TextStyle(
//                                         //       fontFamily: "Roboto",
//                                         //       fontSize: 18.sp,
//                                         //       fontWeight: FontWeight.w500,
//                                         //       color: const Color(0xFF54595F)),
//                                         // ),
//                                         textBlack18bold("Namrata Burondkar"),

//                                         SizedBox(
//                                           height: 5.h,
//                                         ),
//                                         Text(
//                                           "@Namrata07",
//                                           style: TextStyle(
//                                               fontFamily: "Roboto",
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w500,
//                                               color: const Color.fromRGBO(
//                                                   59, 63, 67, 0.49)),
//                                         ),
//                                       ],
//                                     ),

//                                     const Spacer(),

//                                     Container(
//                                       padding: EdgeInsets.fromLTRB(
//                                           20.w, 7.h, 20.w, 0),
//                                       decoration: BoxDecoration(
//                                           color: AppColors.lightBlueF2F2F2,
//                                           borderRadius:
//                                               BorderRadius.circular(8.r)),
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           Image.asset('assets/svg/Coin.png'),
//                                           Column(
//                                             children: [
//                                               textgreyM16Robo("500"),
//                                               // Obx(
//                                               //   () => Text(
//                                               //     totalCoins.string,
//                                               //     style: TextStyle(
//                                               //         fontSize: 17.sp,
//                                               //         fontWeight: FontWeight.w600),
//                                               //   ),
//                                               // ),
//                                               sizedBoxHeight(5.h)
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               SizedBox(
//                                 height: 15.h,
//                               ),
//                               SizedBox(
//                                 height: 15.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container(
//                                     height: 108.h,
//                                     width: 183.w,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFF2F2F2),
//                                       borderRadius: BorderRadius.circular(16.r),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey.withOpacity(0.29),
//                                           blurRadius: 3.0, // soften the shadow
//                                           spreadRadius: 0.2, //extend the shadow
//                                           offset: const Offset(
//                                             3.0, // Move to right 5  horizontally
//                                             3.0, // Move to bottom 5 Vertically
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         // SvgPicture.asset(
//                                         //     "assets/bookmark (2).svg"),
//                                         // Image.asset("assets/svg/rankTag.png",
//                                         //   height: 100.h,
//                                         //   width: 70.h,
//                                         // ),
//                                         Container(
//                                           height: 50.h,
//                                           width: 40.h,
//                                           child: Image.asset(
//                                             "assets/svg/rankTag.png",
//                                             // height: 70.h,
//                                             // width: 60.h,
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                         Text(
//                                           "Level : Bronze",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "StudioProR",
//                                               fontWeight: FontWeight.w500),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 108.h,
//                                     width: 183.w,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFF2F2F2),
//                                       borderRadius: BorderRadius.circular(16.r),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey.withOpacity(0.29),
//                                           blurRadius: 3.0, // soften the shadow
//                                           spreadRadius: 0.2, //extend the shadow
//                                           offset: const Offset(
//                                             3.0, // Move to right 5  horizontally
//                                             3.0, // Move to bottom 5 Vertically
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         SvgPicture.asset(
//                                           "assets/coin.svg",
//                                           height: 50.h,
//                                           width: 40.h,
//                                         ),
//                                         Text(
//                                           "Total Coins : 500",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "StudioProR",
//                                               fontWeight: FontWeight.w500),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ))),
//             ];
//           },
//           body: Column(
//             children: [
//               SizedBox(
//                 height: 20.h,
//               ),
//               TabBar(
//                   indicatorColor: const Color(0xFF3B3F43),
//                   unselectedLabelStyle:
//                       const TextStyle(color: Color(0xFF6B6B6B)),
//                   tabs: [
//                     Tab(
//                       height: 70.h,
//                       child: Column(
//                         children: [
//                           Text(
//                             '1',
//                             style: TextStyle(
//                                 fontFamily: "StudioProR",
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xff000000),
//                                 fontSize: 20.sp),
//                           ),
//                           Text(
//                             'Recipes',
//                             style: TextStyle(
//                                 fontFamily: "Roboto",
//                                 fontWeight: FontWeight.w500,
//                                 color: const Color(0xff54595F),
//                                 fontSize: 15.sp),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Tab(
//                       height: 70.h,
//                       child: Column(
//                         children: [
//                           Text(
//                             '0',
//                             style: TextStyle(
//                                 fontFamily: "StudioProR",
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xff000000),
//                                 fontSize: 20.sp),
//                           ),
//                           Text(
//                             'Saved',
//                             style: TextStyle(
//                                 fontFamily: "Roboto",
//                                 fontWeight: FontWeight.w500,
//                                 color: const Color(0xff54595F),
//                                 fontSize: 15.sp),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Tab(
//                       height: 70.h,
//                       child: Column(
//                         children: [
//                           Text(
//                             '5',
//                             style: TextStyle(
//                                 fontFamily: "StudioProR",
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xff000000),
//                                 fontSize: 20.sp),
//                           ),
//                           Text(
//                             'Following',
//                             style: TextStyle(
//                                 // overflow: TextOverflow.ellipsis,
//                                 fontFamily: "Roboto",
//                                 fontWeight: FontWeight.w500,
//                                 color: const Color(0xff54595F),
//                                 fontSize: 15.sp),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Tab(
//                       height: 70.h,
//                       child: Column(
//                         children: [
//                           Text(
//                             '6',
//                             style: TextStyle(
//                                 fontFamily: "StudioProR",
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xff000000),
//                                 fontSize: 20.sp),
//                           ),
//                           Text(
//                             'Followers',
//                             style: TextStyle(
//                                 fontFamily: "Roboto",
//                                 fontWeight: FontWeight.w500,
//                                 color: const Color(0xff54595F),
//                                 fontSize: 15.sp),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ]),
//               Expanded(
//                 child: TabBarView(children: [
//                   SingleChildScrollView(
//                       controller: controller,
//                       child: Column(
//                         children: [
//                           const Gridview(),
//                           SizedBox(
//                             height: 20.h,
//                           )
//                         ],
//                       )),
//                   const mySaved(),
//                   const myFollowingCard(),
//                   const myFollowerCard()
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class myfollowers extends StatelessWidget {
//   const myfollowers({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Column(
//       children: [
//         SizedBox(
//           height: 15.h,
//         ),
//         Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 16.w,
//               ),
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 50.w,
//                     child: CircleAvatar(
//                       radius: 25.r,
//                       backgroundColor: Colors.grey,
//                       child: Image.asset(
//                         "assets/Mask Group 86.png",
//                         height: 50.h,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 0.h,
//                       left: 35.w,
//                       child: SvgPicture.asset(
//                         "assets/rating-svgrepo-com.svg",
//                         height: 22.h,
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 width: 10.w,
//               ),
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text(
//                   "Priyanka Joshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: const Color(0xFF54595F)),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Text(
//                   "@priyujoshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromRGBO(59, 63, 67, 0.49)),
//                 ),
//                 const Spacer(),
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     height: 30.h,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF3B3F43),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Center(
//                         child: Text(
//                           "Remove",
//                           style: TextStyle(
//                             fontFamily: "StudioProR",
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w500,
//                             color: const Color(0xFFFFFFFF),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//             ]),
//         // ]
//         //     ),
//         const Divider(
//           endIndent: 20,
//           indent: 20,
//         ),
//         SizedBox(
//           height: 15.h,
//         ),
//         Container(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 16.w,
//               ),
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 50.w,
//                     child: CircleAvatar(
//                       radius: 25.r,
//                       backgroundColor: Colors.grey,
//                       child: Image.asset(
//                         "assets/Mask Group 86.png",
//                         height: 50.h,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 0,
//                       left: 35,
//                       child: SvgPicture.asset(
//                         "assets/rating-svgrepo-com.svg",
//                         height: 22,
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Text(
//                 "@priyujoshi",
//                 style: TextStyle(
//                     fontFamily: "StudioProR",
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                     color: const Color.fromRGBO(59, 63, 67, 0.49)),
//               ),

//               //   ],
//               // ),
//               const Spacer(),
//               InkWell(
//                 onTap: () {},
//                 child: Container(
//                   height: 30.h,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF3B3F43),
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     child: Center(
//                       child: Text(
//                         "Remove",
//                         style: TextStyle(
//                           fontFamily: "StudioProR",
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                           color: const Color(0xFFFFFFFF),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 width: 16.w,
//               )
//             ],
//           ),
//         ),
//         Divider(
//           endIndent: 20.w,
//           indent: 20.w,
//         ),
//         SizedBox(
//           height: 15.h,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 16.w,
//             ),
//             Stack(
//               children: [
//                 SizedBox(
//                   width: 50.w,
//                   child: CircleAvatar(
//                     radius: 25.r,
//                     backgroundColor: Colors.grey,
//                     child: Image.asset(
//                       "assets/Mask Group 86.png",
//                       height: 50.h,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     bottom: 0.h,
//                     left: 35.w,
//                     child: SvgPicture.asset(
//                       "assets/rating-svgrepo-com.svg",
//                       height: 22.h,
//                     )),
//               ],
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Priyanka Joshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: const Color(0xFF54595F)),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Text(
//                   "@priyujoshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromRGBO(59, 63, 67, 0.49)),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 30.h,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3B3F43),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   child: Center(
//                     child: Text(
//                       "Remove",
//                       style: TextStyle(
//                         fontFamily: "StudioProR",
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFFFFFFFF),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 16.w,
//             )
//           ],
//         ),
//         Divider(
//           endIndent: 20.w,
//           indent: 20.w,
//         ),
//         SizedBox(
//           height: 15.h,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 16.w,
//             ),
//             Stack(
//               children: [
//                 SizedBox(
//                   width: 50.w,
//                   child: CircleAvatar(
//                     radius: 25.r,
//                     backgroundColor: Colors.grey,
//                     child: Image.asset(
//                       "assets/Mask Group 86.png",
//                       height: 50.h,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     bottom: 0.h,
//                     left: 35.w,
//                     child: SvgPicture.asset(
//                       "assets/rating-svgrepo-com.svg",
//                       height: 22.h,
//                     )),
//               ],
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Priyanka Joshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: const Color(0xFF54595F)),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Text(
//                   "@priyujoshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromRGBO(59, 63, 67, 0.49)),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 30.h,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3B3F43),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   child: Center(
//                     child: Text(
//                       "Remove",
//                       style: TextStyle(
//                         fontFamily: "StudioProR",
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFFFFFFFF),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 16.w,
//             )
//           ],
//         ),
//         Divider(
//           endIndent: 20.w,
//           indent: 20.w,
//         ),
//       ],
//     ));
//   }
// }

// // Widget myFollowinglist() {
// //   return SingleChildScrollView(
// //     child: Column(
// //       children: [
// //         ListView.builder(
// //           physics: const NeverScrollableScrollPhysics(),
// //           shrinkWrap: true,
// //           itemCount: listCardData.length,
// //           itemBuilder: (context, index) {
// //             return Column(
// //               children: [
// //                 // followingListCard(
// //                 //     followingData[index]["like"],
// //                 //     followingData[index]["save"],
// //                 //     index,
// //                 //     followingData[index]["isFollowedByMe"]),
// //                 sizedBoxHeight(13.h)
// //               ],
// //             );
// //           },
// //         ),
// //       ],
// //     ),
// //   );
// // }

// class mySaved extends StatefulWidget {
//   const mySaved({
//     super.key,
//   });

//   @override
//   State<mySaved> createState() => _mySavedState();
// }

// class _mySavedState extends State<mySaved> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Container(
//         //   height: 0.h,
//         //   color: AppColors.white,
//         // ),
//         Expanded(
//           child: Column(
//             children: [
//               Image.asset(
//                 "assets/mySavedEmpty1.png",
//                 width: double.infinity, // height: 200.h,
//                 //  fit: BoxFit.cover,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // sizedBoxHeight(500.h),
//                   Text(
//                     "Let's Explore Recipes",
//                     style: TextStyle(
//                         fontFamily: "StudioProR",
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w500),
//                   ),

//                   sizedBoxHeight(7.h),

//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 38.w),
//                     child: textL_grey14Robo(
//                         "Connect with your friends, family, chefs and other aspiring cooks."),
//                   ),

//                   sizedBoxHeight(10.h),

//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 22.w),
//                     child: customButtonWithBorder("Explore Recipes",
//                         onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return BottomBar(selectedIndex: 1);
//                       }));
//                     }),
//                   ),

//                   sizedBoxHeight(86.h),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
