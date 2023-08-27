import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/common_chip.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Future<T?> FilterBottomSheet<T>() {
  return Get.bottomSheet(
      Container(
          // height: double.infinity - 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r))),
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 35.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.w, right: 29.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'StudioProB',
                              color: const Color(0xff3B3F43)),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.filter_list_sharp),
                            Text(
                              'Filters',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'StudioProM',
                                  color: const Color(0xff6B6B6B)),
                            )
                          ],
                        ),
                        Text(
                          'Clear All',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'StudioProB',
                              color: const Color(0xff3B3F43)),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(36.h),
                  Text(
                    'Add Tags',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'StudioProM',
                        color: const Color(0xff54595F)),
                  ),
                  Column(
                    children: [
                      sizedBoxHeight(6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              color: AppColors.buttonGrey54595F,
                            ),
                            height: 27.h,
                            width: 70.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                sizedBoxWidth(6.w),
                                SvgPicture.asset(
                                  "assets/svg/add-circle-svgrepo-com.svg",
                                  // height: 15.h,
                                  // width: 15.w,
                                ),
                                Text(
                                  "  Custom",
                                  style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: "Studio Pro",
                                      fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Select Tags",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(13.h),
                      Wrap(
                        spacing: 11.w,
                        runSpacing: 7.h,
                        children: [
                          const CommonChip(text: "Savoury moments"),
                          const CommonChip(text: "Quarter to quick"),
                          const CommonChip(text: "Juicy Mondays"),
                          const CommonChip(text: "The healthy way"),
                          const CommonChip(text: "Fry-day!!"),
                          const CommonChip(text: "Simple greens"),
                          const CommonChip(text: "Flavour explosions"),
                          const CommonChip(text: "The healthy way"),
                          SizedBox(
                            height: 18.h,
                            width: double.infinity,
                          ),
                          Text(
                            "South Africa Cuisine",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                            width: double.infinity,
                          ),
                          const CommonChip(text: "Limpopo"),
                          const CommonChip(text: "Easy"),
                          const CommonChip(text: "Food"),
                          const CommonChip(text: "Carrot"),
                          const CommonChip(text: "Quick"),
                          // SizedBox(
                          //   height: 6.h,
                          //   width: double.infinity,
                          // ),
                          const CommonChip(text: "Yoghurt"),
                          const CommonChip(text: "Breakfast"),
                          const CommonChip(text: "Quick"),
                          const CommonChip(text: "Yoghurt"),
                          SizedBox(
                            height: 13.h,
                            width: double.infinity,
                          ),
                          Text(
                            "International Cuisine",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                            width: double.infinity,
                          ),
                          const CommonChip(text: "Limpopo"),
                          const CommonChip(text: "Easy"),
                          const CommonChip(text: "Food"),
                          const CommonChip(text: "Carrot"),
                          const CommonChip(text: "Quick"),
                          // SizedBox(
                          //   height: 6.h,
                          //   width: double.infinity,
                          // ),
                          const CommonChip(text: "Yoghurt"),
                          const CommonChip(text: "Breakfast"),
                          const CommonChip(text: "Quick"),
                          const CommonChip(text: "Yoghurt"),
                          SizedBox(
                            height: 13.h,
                            width: double.infinity,
                          ),
                          Text(
                            "Select Difficulty",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                            width: double.infinity,
                          ),
                          const CommonChip(text: "Easy"),
                          const CommonChip(text: "Medium"),
                          const CommonChip(text: "Hard"),
                        ],
                      ),
                      sizedBoxHeight(32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 39.h,
                            width: 113.w,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff54595F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: BorderSide.none,
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  fontFamily: "StudioProR",
                                  fontSize: 16.sp,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(23.h)
                    ],
                  ),
                ],
              ),
            ),
          )),
      isScrollControlled: true);
}
