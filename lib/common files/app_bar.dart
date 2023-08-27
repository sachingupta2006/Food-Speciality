// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const CustomAppBar(
      {Key? key,
      required this.titleTxt,
      this.bottomtext,
      this.customProfileNavigation = false,
      this.navigateToTaxPlanning = false,
      this.showLeading = true})
      : super(key: key);

  final String titleTxt;
  final bool? bottomtext;
  final bool? customProfileNavigation;
  final bool? showLeading;
  final bool navigateToTaxPlanning;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // primary: false,
      // foregroundColor: AppColors.red,
      // flexibleSpace: Container(
      //   height: 50,
      //   decoration: const BoxDecoration(),
      // ),
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,

      titleSpacing: 0,
      // centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                "assets/icons/back_arrow.png",
                height: 20.h,
                width: 30.w,
                color: AppColors.greyD3B3F43,

                // color: ,
              ),
            ),
            sizedBoxWidth(10.w),
            Text(
              titleTxt,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                  //  fontFamily: 'Helvetica',
                  fontSize: 20.sp,
                  fontFamily: "StudioProR",
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(84, 89, 95, 1)),
            ),
          ],
        ),
      ),
      // leadingWidth: 27.w,
      // automaticallyImplyLeading:

      // leading:
      // Image.asset("assets/icons/back_arrow.png",
      //   height: 18.h,
      //   width: 27.w,
      //   color: AppColors.greyD3B3F43,

      //   // color: ,
      // )
      // SvgPicture.asset("assets/icons/back_arrow.svg",
      //   // height: 10.h,
      //   // width: 10.w,
      //   color: AppColors.greyD3B3F43,
      //   // colorFilter: AppColors.greyD3B3F43,
      // ),
      // IconButton(
      //   onPressed: () {
      //     Get.back();
      //   },
      //   icon: Icon(
      //     Icons.arrow_back,
      //   ),
      //   iconSize: 22.sp,
      //   color: Color.fromRGBO(84, 89, 95, 1),
      // ),
    );
  }
}
