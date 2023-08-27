import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'discovery_recipe.dart';

class SignupProfile extends StatefulWidget {
 final int? nextDoneRoute;
  final void Function()? onTapChallengeDone;
  const SignupProfile({super.key, this.nextDoneRoute, this.onTapChallengeDone});

  @override
  State<SignupProfile> createState() => _SignupProfileState();
}

class _SignupProfileState extends State<SignupProfile> {
  bool isSwitched = false;
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(imagePath).copy(imagePath);
  }

  builduploadprofile() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.camera);
                        Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Set Up Your Profile",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontWeight: FontWeight.bold,
                      fontSize: 22.h,
                      color: Color(0xFF54595F)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      builduploadprofile();
                    },
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                                size: Size.fromRadius(50.h),
                                child: _image != null
                                    ? Image.file(
                                        _image!,
                                        width: 150.h,
                                        height: 150.h,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/Mask Group 40.png',
                                        width: 150.h,
                                        height: 150.h,
                                        fit: BoxFit.cover,
                                      )),
                          ),
                          Positioned(
                            // bottom: .h,
                            top: 10.h,
                            right: 0.w,
                            child: Image.asset(
                              "assets/Group 57623.png",
                              height: 24.h,
                              width: 24.h,
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Namrata Burondkar",
                  style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
                Text(
                  "@Namrata07",
                  style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14.sp),
                  maxLength: 100,
                  maxLines: 5,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(fontSize: 14.sp),
                    hintText: 'Bio',
                    hintStyle: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                      borderSide:
                          const BorderSide(color: Color(0xFF707070), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                      borderSide:
                          const BorderSide(color: Color(0xFF707070), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                      borderSide:
                          const BorderSide(color: Color(0xFF707070), width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyle(
                          color: Color(0xFF3B3F43),
                          fontSize: 18.h,
                          fontFamily: "StudioProR",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(image: AssetImage("assets/Page-1.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 340.w,
                      height: 25.h,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 0.48),
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                          hintText: "South Africa,Western Cape",
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Social/Website Links",
                      style: TextStyle(
                          color: Color(0xFF3B3F43),
                          fontSize: 18.h,
                          fontFamily: "StudioProR",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/website-ui-web-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 340.w,
                      height: 25.h,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 0.48),
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                          hintText: "https://foodspecialities.com",
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/instagram-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 340.w,
                      height: 25.h,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 0.48),
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                          hintText: "https://foodspecialities.com",
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image:
                                  AssetImage("assets/twitter-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 340.w,
                      height: 25.h,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 0.48),
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                          hintText: "https://food_specialities/twitter.com",
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/pinterest-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 340.w,
                      height: 25.h,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 0.48),
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                          hintText: "https://foodspecialities/pinterest.com",
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/facebook-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 340.w,
                      height: 25.h,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 0.48),
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                          hintText: "https://foodspeciality/facebook.com",
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                widget.nextDoneRoute == 1
                    ? SizedBox(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width / 2 - 30.w,
                        child: ElevatedButton(
                          onPressed:widget.onTapChallengeDone,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              side: BorderSide(
                                  color: const Color(0xFF54595F), width: 1.w),
                            ),
                            elevation: 0,
                            primary: const Color(0xFF54595F),
                            onPrimary: Colors.grey,
                          ),
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w500,
                                fontSize: 18.h,
                                fontFamily: "StudioProR"),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width / 2 - 30.w,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(DiscoveryRecipesScreen(),
                                    duration: Duration(milliseconds: 500),
                                    transition: Transition.rightToLeft);
                                //Get.toNamed("/discoveryRecipes");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: BorderSide(
                                      color: Color(0xFF54595F), width: 1.w),
                                ),
                                elevation: 0,
                                primary: Color(0xFF54595F),
                                onPrimary: Colors.grey,
                              ),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.h,
                                    fontFamily: "StudioProR"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width / 2 - 30.w,
                            child: ElevatedButton(
                              onPressed: () {
                                //Get.toNamed("/discoveryRecipes");
                                Get.to(BottomBar(),
                                    duration: Duration(milliseconds: 500),
                                    transition: Transition.rightToLeft);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: BorderSide(
                                      color: Colors.grey, width: 1.w),
                                ),
                                elevation: 0,
                                primary: Colors.transparent,
                                onPrimary: Colors.grey,
                              ),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.h,
                                    fontFamily: "StudioProR"),
                              ),
                            ),
                          ),
                        ],
                      ),
                sizedBoxHeight(20.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
