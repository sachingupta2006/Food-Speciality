import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/utils/colors.dart';

Widget CommanTabbar(String label1, String label2) {
  return TabBar(
    indicatorSize: TabBarIndicatorSize.label,
    indicatorWeight: 4.h,
    indicatorColor: AppColors.greyD3B3F43,
    unselectedLabelStyle: const TextStyle(color: AppColors.greyL979797),
    labelColor: AppColors.greyD3B3F43,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    ),
    tabs: [
      Tab(
        child:
            // textgrey18BoldSP(label1)
            Text(
          label1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
      Tab(
        child:
            // textgrey18BoldSP(label2)
            Text(
          label2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
    ],
  );
}

TabBar CommanTabbarTab(String label1, String label2) {
  return TabBar(
    indicatorSize: TabBarIndicatorSize.label,
    indicatorWeight: 4.h,
    indicatorColor: AppColors.greyD3B3F43,
    unselectedLabelStyle: const TextStyle(color: AppColors.greyL979797),
    labelColor: AppColors.greyD3B3F43,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    ),
    tabs: [
      Tab(
        child:
            // textgrey18BoldSP(label1)
            Text(
          label1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
      Tab(
        child:
            // textgrey18BoldSP(label2)
            Text(
          label2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
    ],
  );
}


