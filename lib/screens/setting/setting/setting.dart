import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/login.dart';
import 'package:foodspeciality/screens/setting/setting/about.dart';
import 'package:foodspeciality/screens/setting/setting/blog_news_article.dart';
import 'package:foodspeciality/screens/setting/setting/privacypolicy.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommunityGuidelines.dart';
import 'Notificationscreen.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List text = [
    {"title": "Notification", "image": "assets/setting svg/notification.svg"},
    {"title": "Privacy Policy", "image": "assets/setting svg/lock.svg"},
    {"title": "Blocked List", "image": "assets/setting svg/block.svg"},
    {
      "title": "Frequently Asked Questions",
      "image": "assets/setting svg/frequently.svg"
    },
    {
      "title": "Food Specialities Community Guidelines",
      "image": "assets/setting svg/community.svg"
    },
    {
      "title": "About Food Specialities",
      "image": "assets/setting svg/question.svg"
    },
    {"title": "Blog/News/Articles", "image": "assets/setting svg/article.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(titleTxt: "Settings"),
        body: Column(
          children: [
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(const Notificationscreen());

                          break;
                        case 1:
                          Get.to(PrivacyPolicy());
                          break;
                        case 2:
                          Get.toNamed("/blocklistfull");
                          break;
                        case 3:
                          Get.toNamed("/faq");
                          break;
                        case 4:
                          Get.to(CommunityGuidelines());
                          break;
                        case 5:
                          Get.to(AboutFoodSpeciality());
                          break;
                        default:
                          Get.to(const BlogsNewsArticles());
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(20.w),
                      padding: EdgeInsets.only(left: 15.w, right: 18.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(text[index]['image']),
                              sizedBoxWidth(20.w),
                              Text(
                                text[index]['title'],
                                style: TextStyle(
                                    fontFamily: "Roboto", fontSize: 14.sp),
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.sp,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: Color(0xff979797),
                      height: 1,
                      thickness: 0.2,
                    ),
                  );
                },
                itemCount: text.length),
            Container(
              margin: EdgeInsets.all(20.w),
              padding: EdgeInsets.only(left: 5.w, right: 18.w),
              child: Row(
                children: [
                  sizedBoxWidth(10.w),
                  SvgPicture.asset("assets/setting svg/signout.svg"),
                  sizedBoxWidth(16.w),
                  GestureDetector(
                    onTap: () {
                      dialoBox();
                    },
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16.sp,
                          color: const Color(0xffC60000)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  dialoBox() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        insetPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text(
          "Sign Out",
          style: TextStyle(
              fontFamily: 'Studio Pro',
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: const Color(0xff3B3F43)),
        ),
        content: Text(
          "Are you sure you want to sign out?                   ",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              color: const Color(0xff54595F)),
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
              SharedPreferences prefs = await SharedPreferences.getInstance();
              // print("token " + jsonResp["data"]["accessToken"]);
              await prefs.setString('accessToken', "");
              await prefs.setString('refreshToken', "");
              await prefs.setString('userId', "");
              await prefs.setString('myImage', "");
              // myImage

              Get.offAll(Login());
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
          sizedBoxWidth(15.sp),
        ],
      ),
    );
  }

  // buildSubscriptionPlan() {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         AlertDialog(
  //           insetPadding: const EdgeInsets.symmetric(horizontal: 16),
  //           contentPadding: const EdgeInsets.fromLTRB(24, 18, 24, 19),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10.sp)),
  //             side: BorderSide(color: Colors.white),
  //           ),
  //           content: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 40),
  //                 child: Text(
  //                   "Sign Out",
  //                   style: TextStyle(
  //                       fontFamily: 'Studio Pro',
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 18.sp,
  //                       color: const Color(0xff3B3F43)),
  //                 ),
  //               ),
  //               Text(
  //                 "Are you sure you want to sign out?                ",
  //                 style: TextStyle(
  //                     fontFamily: 'Roboto',
  //                     fontSize: 16.sp,
  //                     color: const Color(0xff54595F)),
  //               ),
  //               // SizedBox(height: 40.h),
  //               Center(
  //                 child: SizedBox(
  //                   child: Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 40),
  //                     child: Text.rich(
  //                       textAlign: TextAlign.center,
  //                       const TextSpan(children: [
  //                         // TextSpan(
  //                         //     text:
  //                         //         "Get started by booking 1st Consultation with your\n PI @ ₹ 199/-",
  //                         //     style: TextStyle()),
  //                         TextSpan(
  //                             text: "FREE",
  //                             style: TextStyle(color: Colors.red)),
  //                       ]),
  //                       style: TextStyle(
  //                           fontSize: 20.sm,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.black),
  //                     ),
  //                     // Text(
  //                     //   textAlign: TextAlign.center,
  //                     //   "Start Investing Like A \nPro @ Just ₹999",
  //                     //   style: blackStyle(context).copyWith(
  //                     //       //fontWeight: FontWeight.bold,
  //                     //       fontSize: 20),
  //                     // ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 22.h,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Text(
  //                     "Cancel",
  //                     style: TextStyle(
  //                         fontFamily: "Roboto",
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 16.sp,
  //                         color: const Color(0xff000000)),
  //                   ),
  //                   sizedBoxWidth(15.sp),
  //                   Text(
  //                     "Sign out",
  //                     style: TextStyle(
  //                         fontFamily: "Roboto",
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 16.sp,
  //                         color: const Color(0xffB90101)),
  //                   ),
  //                   sizedBoxWidth(15.sp),
  //                 ],
  //               ),
  //               // SizedBox(
  //               //     // height: 20.h,
  //               //     ),
  //               // GestureDetector(
  //               //   onTap: () {},
  //               //   child: Text(
  //               //     "Will do it later",
  //               //     // style: blackStyle(context).copyWith(
  //               //     //   fontSize: 15.sm,
  //               //     //   //fontWeight: FontWeight.bold,
  //               //     //   color: Get.isDarkMode ? Colors.white : Colors.black,
  //               //     //   decoration: TextDecoration.underline,
  //               //     // ),
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
