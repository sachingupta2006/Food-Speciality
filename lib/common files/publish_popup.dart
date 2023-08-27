import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:get/get.dart';

class PublishPopup extends StatefulWidget {
  const PublishPopup({super.key});

  @override
  State<PublishPopup> createState() => _PublishPopupState();
}

class _PublishPopupState extends State<PublishPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(0),
      content: Stack(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.15),
                        BlendMode.srcOver,
                      ),
                      child: Image.asset(
                        "assets/hooray.png",
                        // height: 364.h/
                      )),
                  Positioned(
                    // top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0, height: 247.h,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      // height: 247.h,
                      child: Column(
                        children: [
                          sizedBoxHeight(83.h),
                          Text(
                            "Hooray!",
                            style: TextStyle(
                                color: const Color(0xff3B3F43),
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.bold,
                                fontSize: 26.sp),
                          ),
                          sizedBoxHeight(16.h),
                          Text(
                            "Your post will be published shortly.",
                            style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp),
                          ),
                          sizedBoxHeight(38.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You have received 10 Coins",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.sp),
                              ),
                              sizedBoxWidth(11.h),
                              CircleAvatar(
                                radius: 8.r,
                                backgroundColor: const Color(0xffEFC75E),
                                child: Padding(
                                  padding: EdgeInsets.all(2.sp),
                                  child: const Image(
                                      image:
                                          AssetImage("assets/hooray_coin.png")),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 100,
                    child: Image.asset(
                      "assets/hooray_circle.png",
                      scale: 1.2,
                      fit: BoxFit.none,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 19.h, right: 17.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(BottomBar());
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff3B3F43),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
