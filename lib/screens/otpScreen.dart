import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/services/auth_service.dart';
import 'package:get/get.dart';

class otpVerification extends StatefulWidget {
  const otpVerification({super.key});

  @override
  State<otpVerification> createState() => _otpVerificationState();
}

class _otpVerificationState extends State<otpVerification> {

  String? id;
  String? email;
  
  // String strPin = "";
  // AuthService authService = AuthService();

  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<String> list = Get.arguments;
    id = list[0];
    email = list[1];
    print(id);
    print(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: OtpScreen(id: id!,email: email!,),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  String id;
  String email;
  OtpScreen({Key? key, required this.id, required this.email}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String strPin = "";

  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: const Color(0xFF707070), width: 1.w),
  );

  int pinIndex = 0;

  AuthService authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildExitButton(),
              buildSecurityText(),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "A verification code has been send to your Email. \nEnter it below.",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.5),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                buildPinRow(),
              ],
            ),
          ),
          SizedBox(
            height: 130.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),

            // padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  if (pinFourController.text == null || pinFourController.text.isEmpty) {
                    Get.snackbar("Error", "Please enter 4 digit pin");
                  } else {
                    // print("currentPin $currentPin");
                    strPin = "";
                    currentPin.forEach((e) {
                      strPin += e;
                    });
                    print(strPin);

                    // AuthService authService = AuthService();
                    authService.verifyOtp(otp: strPin, id: widget.id);
                  }
                  // print(currentPin);
                  // Get.toNamed("/resetPass");

                  // Get.toNamed("/otpverification");
                  // Get.toNamed('/signUpProfile');
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
                  'Verify',
                  style: TextStyle(fontSize: 18.sp, fontFamily: "StudioProR"),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: InkWell(
          //     onTap: () {
          //       Get.toNamed("/resetPass");
          //     },
          //     child: Container(
          //       height: 50.h,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //           color: Color(0xFF54595F),
          //           borderRadius: BorderRadius.circular(8)),
          //       child: Center(
          //         child: Text(
          //           "Verify",
          //           style: TextStyle(
          //               fontFamily: "StudioProR",
          //               fontSize: 18,
          //               color: Colors.white),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive code?",
                style: TextStyle(fontFamily: "Roboto", fontSize: 16.sp),
              ),
              InkWell(
                onTap: () {
                  // AuthService 
                  authService.resendOtp(email: widget.email);
                },
                child: Text(
                  " Resend code",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16.sp,
                      color: const Color(0xFFCB0A0A)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 80.h,
          ),
          buildNumberPad(),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
      child: Container(
        color: const Color(0xFFEBEBEB),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 32.h, right: 10.w, left: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  keyboardNumber(
                      n: 1,
                      onPressed: () {
                        pinIndexSetup("1");
                      }),
                  keyboardNumber(
                      n: 2,
                      onPressed: () {
                        pinIndexSetup("2");
                      }),
                  keyboardNumber(
                      n: 3,
                      onPressed: () {
                        pinIndexSetup("3");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  keyboardNumber(
                      n: 4,
                      onPressed: () {
                        pinIndexSetup("4");
                      }),
                  keyboardNumber(
                      n: 5,
                      onPressed: () {
                        pinIndexSetup("5");
                      }),
                  keyboardNumber(
                      n: 6,
                      onPressed: () {
                        pinIndexSetup("6");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  keyboardNumber(
                      n: 7,
                      onPressed: () {
                        pinIndexSetup("7");
                      }),
                  keyboardNumber(
                      n: 8,
                      onPressed: () {
                        pinIndexSetup("8");
                      }),
                  keyboardNumber(
                      n: 9,
                      onPressed: () {
                        pinIndexSetup("9");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 130.w,
                    child: const MaterialButton(
                      onPressed: null,
                      child: SizedBox(),
                    ),
                  ),
                  keyboardNumber(
                      n: 0,
                      onPressed: () {
                        pinIndexSetup("0");
                      }),
                  SizedBox(
                    width: 130.w,
                    child: MaterialButton(
                      height: 65.h,
                      onPressed: () {
                        clearPin();
                      },
                      child: Icon(
                        Icons.backspace_outlined,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[(pinIndex - 1)] = text;
    // strPin = "";
    // currentPin.forEach((e) {
    //   strPin += e;
    // });
    // if (pinIndex == 4) print(strPin);
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinOneController),
        PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinTwoController),
        PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinThreeController),
        PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFourController),
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Enter 4 digit code",
      style: TextStyle(
        color: const Color(0xFF54595F),
        fontFamily: "StudioProR",
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: MaterialButton(
            onPressed: () {
              Get.back();
            },
            height: 50.h,
            minWidth: 50.w,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(
              Icons.arrow_back,
              size: 24.sp,
              color: const Color(0xFF54595F),
            ),
          ),
        ),
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  PINNumber(
      {required this.textEditingController, required this.outlineInputBorder});
  final OutlineInputBorder outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.w,
      height: 65.h,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.sp),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white30,
        ),
        style: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500,
          fontSize: 21.sp,
        ),
      ),
    );
  }
}

class keyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  keyboardNumber({
    required this.n,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 65.h,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.sp),
        onPressed: onPressed,
        // shape: RoundedRectangleBorder(
        //     // borderRadius: BorderRadius.circular(60.0),
        //     ),
        height: 90.h,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24.sp * MediaQuery.of(context).textScaleFactor,
              fontFamily: "Roboto",
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
