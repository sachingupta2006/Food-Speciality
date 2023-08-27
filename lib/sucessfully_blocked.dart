import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/unblock_service.dart';
import 'package:get/get.dart';

class SucessfullyBlocked extends StatefulWidget {
  const SucessfullyBlocked({super.key});

  @override
  State<SucessfullyBlocked> createState() => _SucessfullyBlockedState();
}

class _SucessfullyBlockedState extends State<SucessfullyBlocked> {
  final userid = Get.arguments["userid"];

  void _handleUnblockButton(userid) async {
    try {
      var resp = await UnblockService.unblockRecipe(userid ?? "");
      if (resp) {
        Get.toNamed("/bottomBar");
        Get.snackbar("Successful", "Unbloced successfully");
      }
    } catch (e) {
      // Handle error here
      print('Error unblocking user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: ""),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SvgPicture.asset('assets/blocked.svg'),
                sizedBoxHeight(40.h),
                Text(
                  'You have successfully blocked',
                  style: TextStyle(
                      fontFamily: 'StudioProR',
                      fontSize: 20.sp,
                      color: const Color(0xff3B3F43)),
                ),
                sizedBoxHeight(4.h),
                GestureDetector(
                  onTap: () {
                    dialoBox();
                  },
                  child: Text(
                    '@${Get.arguments["userName"]}',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20.sp,
                        color: const Color(0xff000000)),
                  ),
                ),
                sizedBoxHeight(40.h),
                Text(
                  'You will no longer see their profile, posts, comments, or any other information regarding their account going forward.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff000000)),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'If you would like to unblock their account at any time, you may do so in settings.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff000000)),
                ),
                sizedBoxHeight(56.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/blocklistfull");
                      },
                      child: Text(
                        'View Blocked',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'StudioProM',
                          fontSize: 18.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 184.w,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleUnblockButton(userid);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            // side: BorderSide(color: Colors.white, width: 1.w),
                          ),
                          elevation: 0,
                          primary: const Color(0xff54595F),
                        ),
                        child: Text(
                          'Unblock',
                          style: TextStyle(
                              fontFamily: 'StudioProM',
                              color: Colors.white,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight(50.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dialoBox() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        insetPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text(
          "Block User",
          style: TextStyle(
              fontFamily: 'Studio Pro',
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: const Color(0xff3B3F43)),
        ),
        content: Text(
          "Are you sure you want to block @priyujoshi?         ",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              color: const Color(0xff54595F)),
        ),
        actions: [
          Text(
            "Cancel",
            style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: const Color(0xff000000)),
          ),
          sizedBoxWidth(15.sp),
          Text(
            "Block User",
            style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: const Color(0xffB90101)),
          ),
          sizedBoxWidth(15.sp),
        ],
      ),
    );
  }
}
