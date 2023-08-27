import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/controllers/auth_controller.dart';

import 'package:foodspeciality/screens/create_account.dart';
import 'package:foodspeciality/screens/forgot_password.dart';

import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common files/common_sucess_dailog.dart';

class AuthService {
  AuthController authController = Get.put(AuthController());

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      print("calling signInUser");
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiUrls.login));
      request.body = json.encode({"email": email, "password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      print(resp);
      var jsonResp = jsonDecode(resp);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print("token " + jsonResp["data"]["accessToken"]);
        await prefs.setString('accessToken', jsonResp["data"]["accessToken"]);

        await prefs.setString('refreshToken', jsonResp["data"]["refreshToken"]);
        await prefs.setString('userId', jsonResp["data"]["user"]["id"]);
        await prefs.setString('myImage', jsonResp["data"]["user"]["profile_image"]??"");
        

        accessToken = jsonResp["data"]["accessToken"];
        myUserId = jsonResp["data"]["user"]["id"];
        myImage = jsonResp["data"]["user"]["profile_image"];
        // print(await response.stream.bytesToString());

        Get.offAndToNamed("/bottomBar");

      } else if(response.statusCode == 400) {

        Get.snackbar("Error", jsonResp["message"]);
      } else {
        Get.snackbar("Error", response.reasonPhrase!);

        // print(response.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }


  Future<bool> signUpUser({
    required String username,
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required String confirm_password,
    required String phone,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiUrls.signUp));
      request.body = json.encode({
        "username": username,
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "password": password,
        "confirm_password": confirm_password,
        "phone": phone
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      print(resp);
      var jsonResp = jsonDecode(resp);
      if (response.statusCode == 200) {
        authController.changeDailogBool(true);
        return true;
      } else if (response.statusCode == 400) {
        Get.snackbar("Error", jsonResp["message"]);
        return false;
      } else {
        Get.snackbar("Error", response.reasonPhrase!);
        return false;
        // print(response.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return false;
    }
  }


  Future<void> forgotPassword({
    required String email,
    // required String password,
  }) async {
    try {
      print("calling signInUser");
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.forgotPassword));
      request.body = json.encode({
        "email_address": email
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      


      var resp = await response.stream.bytesToString();
      print(resp);
      var jsonResp = jsonDecode(resp);
      if (response.statusCode == 200) {
        var id = jsonResp["id"];
        Get.toNamed("/otpverification",
          arguments: <String>[id,email]
        );
        // Get.offAll("bh");
        
      } else if(response.statusCode == 404) {
        Get.snackbar("Error", jsonResp["message"]);
      }
      else {
        Get.snackbar("Error", response.reasonPhrase!);

        // print(response.reasonPhrase);
      }

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> verifyOtp({
    required String otp,
    required String id,
  }) async {
    try {
      // print("calling signInUser");
      var headers = {
        'Content-Type': 'application/json'
      };
      // var url = ApiUrls.verifyOtp + "/"  + id;
      print(otp);
      // print(url);
      var request = http.Request('POST', Uri.parse(ApiUrls.verifyOtp));
      request.body = json.encode({
        "otp": otp,
        "id": id
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }


      


      var resp = await response.stream.bytesToString();
      print(response.statusCode);
      print(resp);
      var jsonResp = jsonDecode(resp);
      if (response.statusCode == 200) {
        Get.toNamed("/resetPass",
          arguments: id
        );
        // var id = jsonResp["id"];
        // Get.toNamed("/otpverification",
        //   arguments: id
        // );
        
      } else if(response.statusCode == 400) {
        Get.snackbar("Error", jsonResp["message"]);
      }
      else {
        Get.snackbar("Error", response.reasonPhrase!);

        // print(response.reasonPhrase);
      }

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  
  Future<void> resendOtp({
    required String email,
    // required String password,
  }) async {
    try {
      print("calling signInUser");
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.resendOtp));
      request.body = json.encode({
        "email_address": email
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      


      var resp = await response.stream.bytesToString();
      print(resp);
      var jsonResp = jsonDecode(resp);
      if (response.statusCode == 200) {
        Get.snackbar("Otp resend", jsonResp["message"]);

        // var id = jsonResp["id"];
        // Get.toNamed("/otpverification",
        //   arguments: id
        // );
        
      } else if(response.statusCode == 404) {
        Get.snackbar("Error", jsonResp["message"]);
      }
      else {
        Get.snackbar("Error", response.reasonPhrase!);

        // print(response.reasonPhrase);
      }

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> setNewPassword({
    required String password,
    required String confirmPassword,
    required String id,
  }) async {
    try {
      // print("calling signInUser");
      var headers = {
        'Content-Type': 'application/json'
      };
      // var url = ApiUrls.setNewPassword + "/"  + id;
      // print(otp);
      // print(url);
      var request = http.Request('POST', Uri.parse(ApiUrls.setNewPassword));
      request.body = json.encode({
        "new_password": password,
        "confirm_password": confirmPassword,
        "id": id
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }


      


      var resp = await response.stream.bytesToString();
      print(response.statusCode);
      print(resp);
      var jsonResp = jsonDecode(resp);
      if (response.statusCode == 200) {
        commonSucessDailog(
          msg: "Password changed Successfully", 
          onPressed: (){
            Get.offAllNamed("/login");
            // Get.back();
          }
        );
        // Get.toNamed("/resetPass",
        //   arguments: id
        // );
        // // var id = jsonResp["id"];
        // // Get.toNamed("/otpverification",
        // //   arguments: id
        // // );
        
      } else if(response.statusCode == 400) {
        Get.snackbar("Error", jsonResp["message"]);
      }
      else {
        Get.snackbar("Error", response.reasonPhrase!);

        // print(response.reasonPhrase);
      }

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  

}

// class NewDailog extends StatefulWidget {
//   const NewDailog({super.key});

//   @override
//   State<NewDailog> createState() => _NewDailogState();
// }

// class _NewDailogState extends State<NewDailog> {
//   accountCreatedDialog() async {
//     print("show dailog");
//     // AppDataController appDataController = Get.find();
//     // await Future.delayed(Duration(milliseconds: 10));
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       // barrierColor: Colors.black.withOpacity(0.9),
//       // ColorConstants.kBlack.withOpacity(0.9),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 20, 20, 20),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       // Positioned(
//                       //   top: -80,
//                       //   left: 0,
//                       //   right: 0,
//                       //   child: Align(
//                       //     alignment: Alignment.center,
//                       //     child: Container(
//                       //       decoration: BoxDecoration(
//                       //         borderRadius: BorderRadius.circular(100),
//                       //       ),
//                       //       width: 100,
//                       //       height: 100,
//                       //       child: appDataController.profilePicUrl.value.isEmpty
//                       //           ? CircleAvatar(
//                       //               backgroundColor: ColorConstants.kPrimaryColor,
//                       //               child: const Icon(
//                       //                 Icons.person_rounded,
//                       //                 size: 52,
//                       //                 color: Colors.black,
//                       //               ),
//                       //             )
//                       //           : CircleAvatar(
//                       //               backgroundImage: NetworkImage(
//                       //                   appDataController.profilePicUrl.value),
//                       //             ),
//                       //     ),
//                       //   ),
//                       // ),

//                       Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Icon(
//                                 Icons.close,
//                                 color: AppColors.grey54595F,
//                                 // ColorConstants.kPrimaryColor,
//                                 size: 25,
//                               ),
//                             ),
//                           ),
//                           // const SizedBox(height: 30),

//                           LottieBuilder.network(
//                             "https://assets6.lottiefiles.com/packages/lf20_touohxv0.json",
//                             // height: ,
//                             height: 250,
//                             width: 200,
//                           ),

//                           Text(
//                             "Congratulations",
//                             style: TextStyle(
//                               fontSize: 25,
//                               color: AppColors.greyD3B3F43,
//                               // ColorConstants.kPrimaryColor,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),

//                           SizedBox(
//                             height: 10,
//                           ),

//                           Text(
//                             "bhb",
//                             // HomeApiController().setMoodResponse,
//                             // homeApiController.setMoodResponse.progressBar!,
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xffD9D9D9),
//                             ),
//                           ),

//                           // TextSpan(
//                           //         text: appDataController.name.value,
//                           //         style: TextStyle(
//                           //           fontSize: 17,
//                           //           color: ColorConstants.kPrimaryColor,
//                           //           fontWeight: FontWeight.w500,
//                           //         ),
//                           //       )

//                           // const SizedBox(height: 34),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
