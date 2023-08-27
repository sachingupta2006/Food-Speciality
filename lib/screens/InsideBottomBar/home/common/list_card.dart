import 'package:flutter_share/flutter_share.dart';

// var commentLike = [
//   {
//     "like": 0,
//     "comment":
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//   },
//   {"like": 0, "comment": "Lorem Ipsum is simply dummy text of the printing"},
//   {
//     "like": 0,
//     "comment":
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//   },
//   {
//     "like": 0,
//     "comment":
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//   },
//   {
//     "like": 0,
//     "comment":
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//   },
//   {
//     "like": 0,
//     "comment":
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//   },
//   {
//     "like": 0,
//     "comment":
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//   },
// ];

Future<void> share() async {
  await FlutterShare.share(
    title: 'Example share',
    // text: 'Example share text',
    linkUrl: 'https://flutter.dev/',
    // chooserTitle: 'Example Chooser Title'
  );
}

// Widget tileForlist(String comment, int like) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         width: 35.h,
//         height: 35.h,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25.h),
//             image: const DecorationImage(
//                 image: AssetImage("assets/home/profile.png"),
//                 fit: BoxFit.fill)),
//       ),
//       sizedBoxWidth(10.w),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // textWhite17w500("George Smith"),
//           // e=
//           textBlack16SP("Chaitali tatkare"),

//           sizedBoxHeight(5.h),

//           // textgreyD12Robo("2 Days ago")
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.h),
//                 color: AppColors.greyLtEBEBEB),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
//               child: textgreyD10Robo("11:36"),
//             ),
//           ),

//           sizedBoxHeight(5.h),

//           Row(
//             children: [
//               SizedBox(
//                   // hei
//                   width: 290.w,
//                   child: textBlack15Robo(comment
//                       // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
//                       )),
//               sizedBoxWidth(10.w),
//               Column(
//                 children: [
//                   // /
//                   InkWell(
//                 // onTap: () {
//                 //         // sets
//                 //         // like = !like;
//                 //         setState(() {
//                 //           listCardData[index]["like"] = like == 0 ? 1 : 0;
//                 //           // sdf
//                 //         });
//                 //       },
//                     child: like == 0 
//                     ? Image.asset(
//                       "assets/icons/like.png",
//                       width: 20.w,
//                       height: 18.h,
//                     )
//                     : Image.asset(
//                       "assets/icons/like_filled.png",
//                       width: 20.w,
//                       height: 18.h,
//                     ),
//                   ),

//                   sizedBoxHeight(2.h),

//                   textgreyL12Robo("20")
//                 ],
//               )
//             ],
//           ),

//           sizedBoxHeight(5.h),

//           textgreyM14Sp("Reply")

//           // textGrey15W500("21 Jan, 2022, 10:41 am")
//         ],
//       )
//     ],
//   );
// }

// Future<T?> commentbottomSheet<T>() {
//   return Get.bottomSheet(
//     Container(
//         height: 375.h,
//         // color: AppColors.white,
//         decoration: BoxDecoration(
//             color: AppColors.white,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20.h),
//                 topRight: Radius.circular(20.h))),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),

//           // padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               // tileForlist()
//               Expanded(
//                 child: ListView.builder(
//                   // physics: const NeverScrollableScrollPhysics(),
//                   // shrinkWrap: true,
//                   itemCount: 5,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         tileForlist(commentLike[index]["comment"],
//                             commentLike[index]["like"]),
//                         sizedBoxHeight(13.h)
//                       ],
//                     );
//                   },
//                 ),
//               ),

//               sizedBoxHeight(15.h),

//               CustomSearchTextFormField(
//                   autofocus: false,
//                   hintText: "Add a comment",
//                   validatorText: '',
//                   suffixIcon: Padding(
//                     padding: EdgeInsets.only(right: 15.w),
//                     child: SizedBox(
//                         height: 50.h,
//                         width: 40.w,
//                         child: Center(child: textgreyM14Sp("Send"))),
//                   ))
//             ],
//           ),
//         )),
//     // barrierColor: Colors.red[50],
//     // isDismissible: false,
//   );
// }

// Widget listCard(int like, int save, int index) {
//   // bool like = false;
//   return Container(
//       // height: 425.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.h),
//         color: AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.greyL979797,
//             blurRadius: 2.h,
//             spreadRadius: 1.h,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 9.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         width: 50.h,
//                         height: 50.h,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25.h),
//                             image: const DecorationImage(
//                                 image: AssetImage("assets/home/profile.png"),
//                                 fit: BoxFit.fill)),
//                       ),
//                       sizedBoxWidth(10.w),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // textWhite17w500("George Smith"),
//                           // e=
//                           GestureDetector(
//                               onTap: () {
//                                 Get.toNamed("/viewuser");
//                               },
//                               child: textgreyD16BoldSP("Priyanka Joshi")),

//                           sizedBoxHeight(5.h),

//                           textgreyD12Robo("2 Days ago")

//                           // textGrey15W500("21 Jan, 2022, 10:41 am")
//                         ],
//                       )
//                     ],
//                   ),

//                   followButton("Follow", onPressed: () {})

//                   // customButtonWithBorder(
//                   //   "text",
//                   //   onPressed: onPressed
//                   // )
//                 ],
//               ),
//             ),

//             sizedBoxHeight(14.h),

//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   height: 180.h,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.h),
//                       image: DecorationImage(
//                           image: AssetImage("assets/home/food.png"),
//                           fit: BoxFit.fill)),
//                 ),
//                 Container(
//                   height: 180.h,
//                   child: Padding(
//                     padding: EdgeInsets.all(9.h),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             // Get.toNamed("/networkplayerwidget");
//                             Get.to(AssetPlayerWidget());
//                           },
//                           child: Container(
//                             width: 80.w,
//                             height: 30.h,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5.h),
//                                 color: AppColors.white.withOpacity(0.5)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   "assets/icons/video.png",
//                                   height: 10.h,
//                                   width: 15.w,
//                                 ),
//                                 sizedBoxWidth(2.w),
//                                 textgreyD12Robo("Video")
//                               ],

//                               // Image.asset("assets/icons/video.png"),
//                             ),
//                           ),
//                         ),

//                         // Spacer(),

//                         SizedBox(
//                           height: 27.h,
//                           child: ListView.separated(
//                             separatorBuilder: (context, index) {
//                               return SizedBox(width: 5.w);
//                             },
//                             scrollDirection: Axis.horizontal,
//                             physics: const BouncingScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: 8,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15.h),
//                                     color: index == 0
//                                         ? AppColors.white.withOpacity(0.7)
//                                         : AppColors.greyD3B3F43
//                                             .withOpacity(0.7)),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 7.w, vertical: 5.h),
//                                   child: index == 0
//                                       ? textgreyD12Robo("Video")
//                                       : textWhite12Robo("video"),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),

//                         // Container(
//                         //   decoration: BoxDecoration(
//                         //     borderRadius: BorderRadius.circular(15.h),
//                         //     color: AppColors.white.withOpacity(0.5)
//                         //   ),
//                         //   child: Padding(
//                         //     padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
//                         //     child: textgreyD12Robo("Video"),
//                         //   ),
//                         // )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),

//             sizedBoxHeight(13.h),

//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           // sets
//                           // like = !like;
                          
//                           listCardData[index]["like"] = like == 0 ? 1 : 0;
//                         },
//                         child: Image.asset(
//                           "assets/icons/like.png",
//                           width: 20.w,
//                           height: 18.h,
//                           color: like == 0 ? AppColors.red:AppColors.black,
//                           // color: like ?AppColors.white : null ,
//                         ),
//                       ),
//                       sizedBoxWidth(25.w),
//                       InkWell(
//                         onTap: () {
//                           commentbottomSheet();
//                         },
//                         child: Image.asset(
//                           "assets/icons/comment.png",
//                           width: 20.w,
//                           height: 18.h,
//                         ),
//                       ),
//                       sizedBoxWidth(25.w),
//                       InkWell(
//                         onTap: share,
//                         // (){
//                         //   shar
//                         //   // Share.share('https://www.google.co.in/');
//                         // },
//                         child: Image.asset(
//                           "assets/icons/share.png",
//                           width: 20.w,
//                           height: 18.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Image.asset(
//                     "assets/icons/save.png",
//                     width: 20.w,
//                     height: 18.h,
//                   ),
//                 ],
//               ),
//             ),

//             sizedBoxHeight(10.h),

//             Padding(
//               padding: EdgeInsets.fromLTRB(11.w, 0.w, 0.w, 10.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   textgreyD12Robo("1,320 Likes"),
//                   textgreyD20BoldSP("Carrot Tzatzik"),
//                   textgreyL12Robo("View all 30 comments"),
//                   SizedBox(height: 5.w),
//                 ],
//               ),
//             ),

//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 11.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         width: 27.h,
//                         height: 27.h,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(14.h),
//                             image: const DecorationImage(
//                                 image: AssetImage("assets/home/profile.png"),
//                                 fit: BoxFit.fill)),
//                       ),
//                       sizedBoxWidth(5.w),
//                       InkWell(
//                           onTap: () {
//                             commentbottomSheet();
//                           },
//                           child: textgreyL12Robo("Add a comment"))
//                     ],
//                   ),

//                   InkWell(
//                       onTap: () {
//                         Get.toNamed("/InspirationRecipeComment");
//                       },
//                       child: textgreyD12Robo("View Recipe >"))

//                   // followButton("Follow",
//                   //   onPressed: (){

//                   //   }
//                   // )

//                   // customButtonWithBorder(
//                   //   "text",
//                   //   onPressed: onPressed
//                   // )
//                 ],
//               ),
//             ),

//             // Image.asset(
//             //   sliderImage,
//             //   fit: BoxFit.fill,
//             // ),
//           ],
//         ),
//       ));
// }
