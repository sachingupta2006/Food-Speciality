import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class Redeem extends StatefulWidget {
  const Redeem({super.key});

  @override
  State<Redeem> createState() => _RedeemState();
}

class _RedeemState extends State<Redeem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(101.h),
        child: Column(
          children: [
            Container(
              color: AppColors.grey54595F,
              // .withOpacity(0.84),
              child: Column(
                children: [
                  sizedBoxHeight(40.w),
                  Container(
                    color: AppColors.grey54595F,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Column(
                                  children: [
                                    sizedBoxHeight(20.h),
                                    Image.asset(
                                      "assets/icons/back_arrow.png",
                                      height: 15.h,
                                      width: 30.w,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                              sizedBoxWidth(10.w),
                              Column(
                                children: [
                                  sizedBoxHeight(20.h),
                                  Text(
                                    "Redeem",
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: "StudioProR",
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          sizedBoxHeight(80.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            sizedBoxHeight(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  mainContainer(),
                  mainContainer(),
                  mainContainer(),
                  mainContainer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mainContainer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [catContainer(), catContainer()],
        ),
        sizedBoxHeight(25.h)
      ],
    );
  }

  Widget catContainer() {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ], color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
      width: MediaQuery.of(context).size.width / 2 - 30.w,
      // height: 205.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: SvgPicture.asset('assets/svg/gift.svg')),
          sizedBoxHeight(5.h),
          Text(
            'Voucher',
            style: TextStyle(
                color: AppColors.grey54595F,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp),
          ),
          sizedBoxHeight(5.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/svg/Coin.png', width: 15.sp),
              sizedBoxWidth(5.w),
              Text(
                '1000 coins need to\nredeem!',
                style: TextStyle(fontSize: 14.sp, fontFamily: 'Roboto'),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.lock_outline,
                size: 17.h,
              ),
              sizedBoxWidth(8.w),
              Container(
                height: 7.h,
                width: 120.w,
                decoration: BoxDecoration(
                    color: AppColors.grey54595F,
                    borderRadius: BorderRadius.circular(12)),
              )
            ],
          ),
          sizedBoxHeight(5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sizedBoxWidth(15.w),
              Container(
                height: 22.h,
                width: 82.w,
                decoration: BoxDecoration(
                    color: AppColors.grey54595F,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Reedem',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
