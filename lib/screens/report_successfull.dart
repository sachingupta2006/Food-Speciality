import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/comman_app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/preview.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class ReportSuccess extends StatefulWidget {
  const ReportSuccess({super.key});

  @override
  State<ReportSuccess> createState() => _ReportSuccessState();
}

class _ReportSuccessState extends State<ReportSuccess> {
  // List text = [
  //   {
  //     "title": "It's spam",
  //     "image": "assets/ReportSuccess svg/notification.svg"
  //   },
  //   {
  //     "title": "Nudity or sexual activity",
  //     "image": "assets/ReportSuccess svg/lock.svg"
  //   },
  //   {
  //     "title": "Hate speech of any kind",
  //     "image": "assets/ReportSuccess svg/block.svg"
  //   },
  //   {
  //     "title": "Violent or graphic content",
  //     "image": "assets/ReportSuccess svg/frequently.svg"
  //   },
  //   {
  //     "title": "Threatening or harmful content",
  //     "image": "assets/ReportSuccess svg/community.svg"
  //   },
  //   {
  //     "title": "Bullying or harassment",
  //     "image": "assets/ReportSuccess svg/question.svg"
  //   },
  //   {
  //     "title": "It promotes self-harm or suicide",
  //     "image": "assets/ReportSuccess svg/article.svg"
  //   },
  //   {
  //     "title": "It promotes unlawful activity",
  //     "image": "assets/ReportSuccess svg/article.svg"
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: const CustomAppBar(titleTxt: "ReportSuccess"),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commanAppBar(""),
                  sizedBoxHeight(80.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/home/oktick.svg",
                          height: 130.w,
                          width: 130.w,
                          // color: AppColors.greyD3B3F43,
                        ),
                        sizedBoxHeight(40.h),
                        textBlack20SP_Bold("Thank You for reporting"),
                        sizedBoxHeight(20.h),
                        textBlack14Robo(
                            "Users who violate our guidelines disrupt the Food Specialities community. If you come across more bad behavior, we hope you'll continue to assist us by reporting it.")
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 34.w, vertical: 100.h),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Please refer to our ",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontFamily: "Roboto"),
                      children: [
                        // TextSpan("")
                        TextSpan(
                            text: "Community Guidelines",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.red,
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.w500,
                                fontFamily: "Roboto"),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // print("sf");
                              }),
                        TextSpan(
                          text:
                              " to see the content that is prohibited on our platform. ReportSuccessing is anonymous.",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontFamily: "Roboto"),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
