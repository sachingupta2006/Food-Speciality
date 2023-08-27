import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';

import 'package:foodspeciality/services/auth_service.dart';
import 'package:foodspeciality/utils/texts.dart';

import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // bool v1 = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final tecEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        titleTxt: 'Forgot Password',
        bottomtext: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter your email address. You will receive a verification code on your register email",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: const Color.fromRGBO(112, 112, 112, 1),
                      fontSize: 17.sp,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Enter Your Email",
                    //   style: textformstyle(""),
                    // ),
                    Text(
                      "Enter Your Email",
                      style: TextStyle(
                        color: const Color.fromRGBO(112, 112, 112, 1),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  textEditingController: tecEmail,
                  hintText: "Email Address",
                  validator: (value) {
                    if (value == value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    // v1 = true;
                    return null;
                  },
                  validatorText: "",
                  suffixIcon: Image.asset(
                    "assets/style=linear.png",
                    height: 20.h,
                    width: 17.w,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 198.h,
                ),

                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // v1
                      //     ? Get.toNamed("/otpverification")
                      //     : ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             backgroundColor: Colors.grey,
                      //             content:
                      //                 Center(child: Text('Enter Valid Email'))));
                      // // Get.toNamed('/signUpProfile');
                      final FormState? form = _formKey.currentState;
                      if (form != null && form.validate()) {
                        form.save();
                        AuthService authService = AuthService();
                        authService.forgotPassword(email: tecEmail.text);
                        // authService.forgotPassword(tecEmail.text);
                        // Get.toNamed("/otpverification");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // side: BorderSide(color: Colors.white, width: 1.w),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Next',
                      style:
                          TextStyle(fontSize: 18.sp, fontFamily: "StudioProR"),
                    ),
                  ),
                ),

                // CustomNextButton(
                //   ontap: () {
                //     Get.toNamed("/otpverification");
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (context) => ResetPasswordScreen(),
                //     //     ));
                //   },
                //   text: 'Next',
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
