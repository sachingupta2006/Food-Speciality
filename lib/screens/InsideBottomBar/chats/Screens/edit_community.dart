import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/edit_community_service.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../common files/customtextformfield.dart';

class EditCommunity extends StatefulWidget {
  const EditCommunity({super.key});

  @override
  State<EditCommunity> createState() => _EditCommunityState();
}

class _EditCommunityState extends State<EditCommunity> {
  final communityId = Get.arguments["communityId"];
  final communityProfileImage = Get.arguments["communityProfileImage"];

  TextEditingController tecSubject = TextEditingController();
  TextEditingController tecDescription = TextEditingController();

  File? _image;

  @override
  void initState() {
    tecSubject.text = Get.arguments["communityName"] ?? "";
    tecDescription.text = Get.arguments["communityDescription"] ?? "";
    super.initState();
  }

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
                        children: const [
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
                        Get.back();
                      },
                      child: Column(
                        children: const [
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

  void _handleEditButton(communityId, name, description, image) async {
    try {
      var resp = await EditCommunityService.editCommunity(
          communityId, name ?? "", description ?? "", image);
      if (resp) {
        Get.snackbar("Successful", "Community Details Changed successfully");
      }
    } catch (e) {
      // Handle error here
      print('Error Editing Community: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 35.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            "assets/icons/back_arrow.svg",
                            height: 25.h,
                            color: AppColors.greyD3B3F43,
                          ),
                        ),
                      ],
                    ),

                    sizedBoxHeight(10.h),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _image != null
                            ? Image.file(
                                _image!,
                                width: 150.w,
                                height: 150.h,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 120.h,
                                height: 120.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.white,
                                      width: 3.h,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        // offset: Offset(0, 3), // changes the position of the shadow
                                      ),
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage(
                                            '$communityProfileImage'),
                                        fit: BoxFit.cover)),

                                // child: YourChildWidget(),
                              ),
                        sizedBoxWidth(20.w),
                        SizedBox(
                          height: 40.h,
                          width: 130.w,
                          child: ElevatedButton(
                            onPressed: () {
                              builduploadprofile();
                            },
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
                              'Change Photo',
                              style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.h,
                                  fontFamily: "StudioProR"),
                            ),
                          ),
                        ),
                      ],
                    ),

                    sizedBoxHeight(40.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(
                        //   "Enter Your Email",
                        //   style: textformstyle(""),
                        // ),
                        // Text(
                        //   "Enter Your Email",
                        //   style: TextStyle(
                        //     color: const Color.fromRGBO(112, 112, 112, 1),
                        //     fontSize: 14.sp,
                        //   ),
                        // ),
                        textBlack18bold("Community Name")
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      textEditingController: tecSubject,
                      hintText: "Enter Community Name",
                      withOutPrefix: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Community Name';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter a valid name';
                        }
                        // v1 = true;
                        return null;
                      },
                      validatorText: "",
                      // suffixIcon: Image.asset(
                      //   "assets/style=linear.png",
                      //   height: 20.h,
                      //   width: 17.w,
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                    sizedBoxHeight(25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(
                        //   "Enter Your Email",
                        //   style: textformstyle(""),
                        // ),
                        // Text(
                        //   "Enter Your Email",
                        //   style: TextStyle(
                        //     color: const Color.fromRGBO(112, 112, 112, 1),
                        //     fontSize: 14.sp,
                        //   ),
                        // ),
                        textBlack18bold("Community Description")
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: tecDescription,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                      cursorColor: const Color(0xFFFFB600),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.sp),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: const Color(0xFF979797), width: 0.5.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: const Color(0xFF979797), width: 0.5.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: const Color(0xFF979797), width: 0.5.w),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(color: Colors.red, width: 1.w),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(color: Colors.red, width: 1.w),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "StudioProR",
                            color: const Color(0x80000000),
                            fontSize: 17.sp),
                        hintText: "Community Description",
                      ),
                      minLines: 4,
                      maxLines: null,
                    ),
                    sizedBoxHeight(60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width / 2 - 30.w,
                          child: ElevatedButton(
                            onPressed: () {
                              _handleEditButton(communityId, tecSubject.text,
                                  tecDescription.text, _image);
                            },
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
                        ),
                        SizedBox(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width / 2 - 30.w,
                          child: ElevatedButton(
                            onPressed: () {
                              //Get.toNamed("/discoveryRecipes");
                              // Get.to(BottomBar(),
                              //     duration: Duration(milliseconds: 500),
                              //     transition: Transition.rightToLeft);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side:
                                    BorderSide(color: Colors.grey, width: 1.w),
                              ),
                              elevation: 0,
                              primary: Colors.transparent,
                              onPrimary: Colors.grey,
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.h,
                                  fontFamily: "StudioProR"),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   child: Container(
                    //     // height: 100.0,
                    //     margin: const EdgeInsets.only(top: 6.0),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                    //       color: Colors.white,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey,
                    //           offset: Offset(0.0, 1.0), //(x,y)
                    //           blurRadius: 5.0,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // Container(
                    //   // height: 375.h,
                    //   // color: AppColors.white,
                    //   decoration: BoxDecoration(
                    //       color: AppColors.white,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: AppColors.greyLtEBEBEB,
                    //           blurRadius: 1.h,
                    //           spreadRadius: 1.h,
                    //           offset: Offset(0, -5.h)
                    //         ),
                    //       ],

                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(20.h),
                    //         topRight: Radius.circular(20.h)
                    //       )
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget participantsList(String name) {
    return Row(
      children: [
        Container(
          width: 60.h,
          height: 60.h,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/home/profile.png"),
                  fit: BoxFit.cover)),
        ),

        sizedBoxWidth(10.w),

        textBlack18bold(name),

        // sizedBoxHeight(20.h)
      ],
    );
  }
}
