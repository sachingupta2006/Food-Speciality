import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/comman_app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/report_service.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final recipeId = Get.arguments["recipeid"];

  void _handleSaveButton(id, description) async {
    try {
      var resp = await ReportService.reportRecipe(id ?? "", description);
      if (resp) {
        Get.toNamed("/ReportSuccess");
      }
    } catch (e) {
      // Handle error here
      print('Error reporting recipe: $e');
    }
  }

  List text = [
    {"title": "It's spam", "image": "assets/Report svg/notification.svg"},
    {
      "title": "Nudity or sexual activity",
      "image": "assets/Report svg/lock.svg"
    },
    {
      "title": "Hate speech of any kind",
      "image": "assets/Report svg/block.svg"
    },
    {
      "title": "Violent or graphic content",
      "image": "assets/Report svg/frequently.svg"
    },
    {
      "title": "Threatening or harmful content",
      "image": "assets/Report svg/community.svg"
    },
    {
      "title": "Bullying or harassment",
      "image": "assets/Report svg/question.svg"
    },
    {
      "title": "It promotes self-harm or suicide",
      "image": "assets/Report svg/article.svg"
    },
    {
      "title": "It promotes unlawful activity",
      "image": "assets/Report svg/article.svg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: const CustomAppBar(titleTxt: "Report"),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commanAppBar("Report"),
                  sizedBoxHeight(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textBlack18SP_Bold("Why are you reporting this post?"),
                        sizedBoxHeight(20.h),
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    _handleSaveButton(
                                        recipeId, text[index]["title"]);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.h),
                                    child: Row(
                                      children: [
                                        textgreyM16Robo(
                                          text[index]['title'],
                                        ),
                                      ],
                                    ),
                                  )
                                  // Text(
                                  //   text[index]['title'],
                                  //   style: TextStyle(
                                  //       fontFamily: "Roboto", fontSize: 14.sp),
                                  // ),
                                  );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Color(0xff979797),
                                // height: 1,
                                thickness: 0.2.h,
                              );
                            },
                            itemCount: text.length),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 34.w,
                ),
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
                              " to see the content that is prohibited on our platform. Reporting is anonymous.",
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
