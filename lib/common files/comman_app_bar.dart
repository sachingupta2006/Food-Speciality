import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

Widget commanAppBar(String text) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
            color: AppColors.greyLtEBEBEB,
            blurRadius: 2.h,
            spreadRadius: 1.h,
            offset: Offset(0, 2.h)),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/back_arrow.svg",
              height: 18.h,
              width: 27.w,
              color: AppColors.greyD3B3F43,
            ),
          ),
          sizedBoxWidth(20.w),
          textgreyM18SpM(text)
        ],
      ),
    ),
  );
}
