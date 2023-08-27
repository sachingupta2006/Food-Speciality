import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'sized_box.dart';

getViewRulesDailog() {
  Get.defaultDialog(
      titleStyle: const TextStyle(fontSize: 0),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(10.h),
      title: "",
      barrierDismissible: false,
      content: Container(
        // width: 400.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  // Icon(Icons.close),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close)),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // CircleAvatar(
                      //   backgroundImage: AssetImage("assets/babotie.png"),
                      //   maxRadius: 30.r,
                      // ),
                      Icon(
                        Icons.upload_file,
                        size: 40.w,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                // widget.name,
                                "Submission Rules",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "Roboto",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text(
                                // widget.member,
                                "Do not post:",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.sp,
                                    // color: Color(0xFF54595F),
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                // widget.messageText,/
                                "- Non-relevent images and/or recipes \n- Similar images and/ or recipes with the same combination of subject background, foreground and location are not allowed. \n- Same image multiple times(cropped, angle change or tone changes)",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.sp,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    thickness: 1.h,
                    color: AppColors.grey54595F,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // CircleAvatar(
                      //   backgroundImage: AssetImage("assets/babotie.png"),
                      //   maxRadius: 30.r,
                      // ),
                      Icon(
                        Icons.description,
                        size: 40.w,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                // widget.name,
                                "Eligibility",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "Roboto",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              // Text(
                              //   // widget.member,
                              //   "Do not post:",
                              //   style: TextStyle(
                              //       fontFamily: "Roboto",
                              //       fontSize: 15.sp,
                              //       // color: Color(0xFF54595F),
                              //       color: AppColors.black,
                              //       fontWeight: FontWeight.w500),
                              // ),
                              Text(
                                // widget.messageText,/
                                "Recipes, posts, description and photos must not contain obscene, provocative, defamatory, sexually explicit or otherwise objectionable or inappropriate content. Photos deemed inappropriate will be disqualified. Challenge void where prohibited.",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.sp,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    thickness: 1.h,
                    color: AppColors.grey54595F,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // CircleAvatar(
                      //   backgroundImage: AssetImage("assets/babotie.png"),
                      //   maxRadius: 30.r,
                      // ),
                      Icon(
                        Icons.person,
                        size: 40.w,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                // widget.name,
                                "Participation",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "Roboto",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              // Text(
                              //   // widget.member,
                              //   "Do not post:",
                              //   style: TextStyle(
                              //       fontFamily: "Roboto",
                              //       fontSize: 15.sp,
                              //       // color: Color(0xFF54595F),
                              //       color: AppColors.black,
                              //       fontWeight: FontWeight.w500),
                              // ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      'By entering challenge you accept the standard',
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.sp,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal),
                                  /*defining default style is optional */
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Terms of Use',
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.sp,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  sizedBoxHeight(20.h),

                  // SizedBox(
                  //   height: 50.h,
                  //   width: 170.w,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       elevation: 0,
                  //       // ignore: deprecated_member_use
                  //       primary: const Color(0xFF3B3F43),
                  //       shape: RoundedRectangleBorder(
                  //         side: const BorderSide(color: Color(0xFF707070)),
                  //         borderRadius: BorderRadius.circular(8.h),
                  //       ),
                  //     ),
                  //     child: Text(
                  //       "Continue",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 18.sp,
                  //         fontFamily: 'StudioProR',
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Get.back();
                  //       // Get.offAllNamed("/login");
                  //       // Get.toNamed("communityaddparticipants");
                  //     },
                  //   ),
                  // ),

                  // custom

                  // TextSpan(
                  //         text: appDataController.name.value,
                  //         style: TextStyle(
                  //           fontSize: 17,
                  //           color: ColorConstants.kPrimaryColor,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       )

                  // custom

                  // const SizedBox(height: 34),
                ],
              ),
            ],
          ),
        ),
      ));
}
