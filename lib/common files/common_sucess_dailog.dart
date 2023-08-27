import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

commonSucessDailog({required String msg, required void Function()? onPressed}){
    Get.defaultDialog(
      titleStyle: TextStyle(
        fontSize: 0
      ),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(10.h),
      title: "",
      barrierDismissible: false,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [

                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       Get.back();
                  //     },
                  //     child: Icon(Icons.close,
                  //       color: AppColors.grey54595F,
                  //       // ColorConstants.kPrimaryColor,
                  //       size: 25.h,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 30),

                  // LottieBuilder.network("https://assets3.lottiefiles.com/packages/lf20_jbrw3hcz.json",
                  //   // height: ,
                  //   height: 200.h,
                  //   width: 250.w,
                  // ),
                  LottieBuilder.asset("assets/sucess_lottie.json",
                    height: 200.h,
                    width: 250.w,
                  ),


                  Text("Congratulations",
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColors.greyD3B3F43,
                      // ColorConstants.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text(
                    msg,
                    // "Account Created Successfully",
                    // HomeApiController().setMoodResponse,
                    // homeApiController.setMoodResponse.progressBar!,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.greyD3B3F43,
                    ),
                  ),

                  sizedBoxHeight(30.h),

                  SizedBox(
                    height: 50.h,
                    width: 170.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        // ignore: deprecated_member_use
                        primary: const Color(0xFF3B3F43),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF707070)),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: 'StudioProR',
                        ),
                      ),
                      onPressed: onPressed
                    ),
                  ),
               

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
        )

    );
  }
