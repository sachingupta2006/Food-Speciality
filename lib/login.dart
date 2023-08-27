import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'services/googleAuthService.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  // bool v1 = false;
  // bool v2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Image.asset(
                      "assets/logo.png",
                      height: 154.h,
                      width: 154.w,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontFamily: "StudoProR",
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3B3F43),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Text(
                        "Food Specialities is committed to bringing you versatile and exciting choices for your daily food and cooking experience!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xFF54595F),
                            fontSize: 15.sp,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    CustomTextFormField(
                      textEditingController: tecEmail,
                      hintText: "Email Address",
                      validatorText: "",
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
                      suffixIcon: Image.asset(
                        "assets/style=linear.png",
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // SizedBox(
                    //   height: 50.h,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8.r),
                    //           borderSide: BorderSide.none,
                    //         ),
                    //         hintText: "Email",
                    //         hintStyle: TextStyle(fontSize: 17.h),
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         suffixIcon: Image(
                    //             width: 20.h,
                    //             height: 17.h,
                    //             image:
                    //                 const AssetImage("assets/style=linear.png"))),
                    //   ),
                    // ),
                    SizedBox(height: 30.h),
                    CustomTextFormField(
                      eyeIcon: true,
                      textEditingController: tecPassword,
                      // leadingIcon: IconButton(
                      //     onPressed: () {}, icon: Icon(Icons.visibility)),
                      // suffixIcon: IconButton(
                      //     onPressed: () {}, icon: Icon(Icons.visibility_off)),
                      // leadingIcon: ,
                      hintText: "Password",
                      validator: (value) {
                        if (value == value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        // v2 = true;
                        return null;
                      },
                      validatorText: "", isInputPassword: true,
                      // suffixIcon: Padding(
                      //   padding: const EdgeInsets.only(right: 8.0),
                      //   child: Icon(
                      //     Icons.lock_outline,
                      //     color: Color(0xFF54595F),
                      //   ),
                      // ),
                    ),
                    // SizedBox(
                    //   height: 50.h,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8.r),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       hintText: "Password",
                    //       filled: true,
                    //       hintStyle: TextStyle(fontSize: 17.h),
                    //       fillColor: Colors.white,
                    //       suffixIcon: const Icon(
                    //         Icons.lock_outline,
                    //         color: Colors.black54,
                    //       ),
                    //     ),
                    //     obscureText: true,
                    //   ),
                    // ),

                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/forgetPass");
                            // Get.back();
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: const Color(0xFF3B3F43),
                              fontSize: 16.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: Form(
                        child: ElevatedButton(
                          onPressed: () {
                            final FormState? form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              // apiForLogin();
                              AuthService authService = AuthService();
                              authService.signInUser(
                                  email: tecEmail.text,
                                  password: tecPassword.text);
                              // form.save();

                              // // Do something with the user credentials, such as login to the backend
                              // // server and navigate to the home screen.
                              // Get.to(BottomBar());
                            }
                            // if (_formKey.currentState!.validate()) {
                            // Get.toNamed('/signUpProfile');
                            // }

                            // if (value) {

                            // }
                            //Get.toNamed('/signUpProfile');
                            // v1 && v2
                            // ? Get.to(SignupProfile(),
                            //     duration: const Duration(milliseconds: 500),
                            //     transition: Transition.rightToLeft)
                            // : ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         backgroundColor: Colors.grey,
                            //         content: Center(
                            //             child: Text(
                            //                 'Email or Password Wrong'))));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(84, 89, 95, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              // side: BorderSide(color: Colors.white, width: 1.w),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 18.sp, fontFamily: "StudioProR"),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(
                                color: const Color(0xFF3B3F43), width: 1.w),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          // Get.toNamed("/bottomBar");

                          googleAuthService().handleGoogleSignIn();

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/google-svgrepo-com.svg",
                              height: 28.h,
                              width: 28.w,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xFF3B3F43)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(
                                color: const Color(0xFF3B3F43), width: 1.w),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Apple-Logo.png",
                              height: 50.h,
                              width: 50.w,
                            ),
                            // SizedBox(
                            //   width: 10.w,
                            // ),
                            Text(
                              "Continue with Apple",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xFF3B3F43)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                              color: const Color(0xFF3B3F43),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/createAcc");
                          },
                          child: Text(
                            "Create account",
                            style: TextStyle(
                              color: const Color(0xFF3B3F43),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto",
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxHeight(20.h)
                    // SizedBox(
                    //   height: 50.h,
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Get.toNamed("/createAcc");
                    //       // Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //       builder: (context) => CreateAccountScreen(),
                    //       //     ));
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(25.r),
                    //         side:
                    //             BorderSide(color: Color(0xFF3B3F43), width: 1.w),
                    //       ),
                    //       elevation: 0,
                    //       primary: Colors.transparent,
                    //       onPrimary: Colors.white,
                    //     ),
                    //     child: Text(
                    //       'Create Account',
                    //       style: TextStyle(fontSize: 16.sp),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void signInUser() {}

  apiForLogin() async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://192.168.1.51:5000/auth/login'));
    request.body =
        json.encode({"email": "shams@email.com", "password": "Shams1234"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
