// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
// import 'package:foodspeciality/common%20files/sized_box.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/explore/controller/explore_cont.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
// import 'package:foodspeciality/utils/colors.dart';
// import 'package:foodspeciality/utils/texts.dart';
// import 'package:get/get.dart';

// HomeController controllerHome = HomeController();
// // ExploreController controllerExplore = ExploreController();

// Future<T?> commentbottomSheet<T>() {
//   final tecComment = TextEditingController();

//     return Get.bottomSheet(
//       Container(
//           height: 375.h,
//           // color: AppColors.white,
//           decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.h),
//                   topRight: Radius.circular(20.h))),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),

//             // padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 // tileForlist()
//                 Expanded(child: 
//                 GetBuilder<HomeController>(builder: (_) {
//                   return
//                    ListView.builder(
//                     // physics: const NeverScrollableScrollPhysics(),
//                     // shrinkWrap: true,
//                     itemCount: controllerHome.commentLike.length,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           tileForlist(
//                               controllerHome.commentLike[index]["comment"],
//                               controllerHome.commentLike[index]["like"],
//                               index),
//                           sizedBoxHeight(13.h)
//                         ],
//                       );
//                     },
//                   );
//                 })
//                     // ListView.builder(
//                     //   // physics: const NeverScrollableScrollPhysics(),
//                     //   // shrinkWrap: true,
//                     //   itemCount: 5,
//                     //   itemBuilder: (context, index) {
//                     //     return Column(
//                     //       children: [
//                     //         tileForlist(
//                     //             controllerHome.commentLike[index]["comment"],
//                     //             controllerHome.commentLike[index]["like"],
//                     //             index),
//                     //         sizedBoxHeight(13.h)
//                     //       ],
//                     //     );
//                     //   },
//                     // ),

//                     ),

//                 sizedBoxHeight(15.h),

//                 CustomSearchTextFormField(
//                   textEditingController: tecComment,
//                   autofocus: false,
//                   hintText: "Add a comment",
//                   validatorText: '',
//                   suffixIcon: Padding(
//                     padding: EdgeInsets.only(right: 15.w),
//                     child: SizedBox(
//                         height: 50.h,
//                         width: 40.w,
//                         child: Center(child: InkWell(
//                           onTap: (){
//                             if (tecComment.text.isNotEmpty) {
//                               // print(tecComment.text);
//                               controllerHome.commentMethod(tecComment.text);
//                               tecComment.clear();
//                             }
//                           },
//                           child: textgreyM14Sp("Send")))),
//                   ))
//               ],
//             ),
//           )),
//       // barrierColor: Colors.red[50],
//       // isDismissible: false,
//     );
//   }


// Widget tileForlist(String comment, int like, int index) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 35.h,
//           height: 35.h,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25.h),
//               image: const DecorationImage(
//                   image: AssetImage("assets/home/profile.png"),
//                   fit: BoxFit.fill)),
//         ),
//         sizedBoxWidth(10.w),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // textWhite17w500("George Smith"),
//             // e=
//             textBlack16SP("Chaitali tatkare"),

//             sizedBoxHeight(5.h),

//             // textgreyD12Robo("2 Days ago")
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.h),
//                   color: AppColors.greyLtEBEBEB),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
//                 child: textgreyD10Robo("11:36"),
//               ),
//             ),

//             sizedBoxHeight(5.h),

//             Row(
//               children: [
//                 SizedBox(
//                     // hei
//                     width: 290.w,
//                     child: textBlack15Robo(comment
//                         // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//                         )),
//                 sizedBoxWidth(10.w),
//                 Column(
//                   children: [
//                     // /
//                     InkWell(
//                       onTap: () {
//                         controllerHome.likeMethod(index, like);
//                         // sets
//                         // like = !like;
//                         // setState(() {
//                         //   commentLike[index]["like"] = like == 0 ? 1 : 0;
//                         //   // sdf
//                         // });
//                         // controllerHome.commentLike
//                       },
//                       child: like == 0
//                           ? Image.asset(
//                               "assets/icons/like.png",
//                               width: 20.w,
//                               height: 18.h,
//                             )
//                           : Image.asset(
//                               "assets/icons/like_filled.png",
//                               width: 20.w,
//                               height: 18.h,
//                             ),
//                     ),

//                     sizedBoxHeight(2.h),

//                     textgreyL12Robo("20")
//                   ],
//                 )
//               ],
//             ),

//             sizedBoxHeight(5.h),

//             textgreyM14Sp("Reply")

//             // textGrey15W500("21 Jan, 2022, 10:41 am")
//           ],
//         )
//       ],
//     );
//   }
