// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodspeciality/Model/Replies.dart';
// import 'package:foodspeciality/Model/comments_model.dart';
// import 'package:foodspeciality/common%20files/buttons.dart';
// import 'package:foodspeciality/common%20files/comman_tabbar.dart';
// import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
// import 'package:foodspeciality/common%20files/search_noti.dart';
// import 'package:foodspeciality/common%20files/sized_box.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
// import 'package:foodspeciality/services/block_service.dart';
// import 'package:foodspeciality/services/follow_service.dart';
// import 'package:foodspeciality/services/get_comments.dart';
// import 'package:foodspeciality/services/get_recipe_service.dart';
// import 'package:foodspeciality/services/like_service.dart';
// import 'package:foodspeciality/services/save_recipe.dart';
// import 'package:foodspeciality/utils/colors.dart';
// import 'package:foodspeciality/utils/texts.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import '../../../Model/RecipeModel.dart';

// class Home extends StatefulWidget {
//   Home({
//     super.key,
//   });

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // GetCommentsController commentsContoller = Get.put(GetCommentsController());

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           // extendBody: true,
//           backgroundColor: Colors.white,
//           body: Column(
//             children: [
//               Column(
//                 children: [
//                   searchNotification(),
//                   CommanTabbar("My Community", "Inspiration"),
//                 ],
//               ),
//               Expanded(
//                 child: Container(
//                   color: AppColors.greyLtEBEBEB,
//                   // color: Colors.red,

//                   child: TabBarView(children: [tabbarView1(), Ingridents()]),
//                 ),
//               )
//             ],
//           )),
//     );
//   }

//   Widget tabbarView1() {
//     return Column(
//       children: [
//         Container(
//           height: 10.h,
//           color: AppColors.white,
//         ),
//         Expanded(
//           child: Stack(
//             children: [
//               Image.asset(
//                 "assets/home/tab1_image.jpeg",
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // sizedBoxHeight(500.h),

//                   textgrey22BoldSP("Let's Build Your Community."),

//                   sizedBoxHeight(7.h),

//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 38.w),
//                     child: textL_grey14Robo(
//                         "Create your community and connect with your friends, family, chefs and other aspiring cooks."),
//                   ),

//                   sizedBoxHeight(50.h),

//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 22.w),
//                     child: customButtonWithBorder("Build Your Community",
//                         onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (context) => addCommunityDailog());
//                     }),
//                   ),

//                   sizedBoxHeight(100.h),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// Widget addCommunityDailog() {
//   final _createcommunitykey = GlobalKey<FormState>();
//   TextEditingController communityName = TextEditingController();
//   TextEditingController description = TextEditingController();

//   return Dialog(
//     elevation: 0,
//     backgroundColor: Colors.transparent,
//     insetPadding: EdgeInsets.all(16.w),
//     child: Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.h),
//             color: AppColors.white,
//           ),
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 25.h),
//             child: Form(
//               key: _createcommunitykey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Icon(
//                           Icons.close,
//                           size: 30.h,
//                           color: AppColors.greyM707070,
//                         ),
//                       ),
//                     ],
//                   ),
//                   sizedBoxHeight(45.h),
//                   SizedBox(
//                     width: 200.w,
//                     height: 27.h,
//                     child: TextFormField(
//                       controller: communityName,
//                       style: TextStyle(
//                           color: const Color(0xFF979797),
//                           fontSize: 20.sp,
//                           fontFamily: "StudioProR"),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintStyle: TextStyle(
//                             color: const Color(0xFF979797),
//                             fontSize: 20.sp,
//                             fontFamily: "StudioProR"),
//                         hintText: "Community Name",
//                       ),
//                       textAlign: TextAlign.center,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a community name';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   sizedBoxHeight(15.h),
//                   TextFormField(
//                     controller: description,
//                     style: TextStyle(
//                         color: const Color(0xFF979797),
//                         fontSize: 20.sp,
//                         fontFamily: "StudioProR"),
//                     cursorColor: const Color(0xFFFFB600),
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(14.sp),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(
//                             color: const Color(0xFF979797), width: 0.5.w),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(
//                             color: const Color(0xFF979797), width: 0.5.w),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(
//                             color: const Color(0xFF979797), width: 0.5.w),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide: BorderSide(color: Colors.red, width: 1.w),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide: BorderSide(color: Colors.red, width: 1.w),
//                       ),
//                       hintStyle: TextStyle(
//                           fontFamily: "StudioProR",
//                           color: const Color(0x80000000),
//                           fontSize: 17.sp),
//                       hintText: "Community Description",
//                     ),
//                     minLines: 4,
//                     maxLines: null,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a community description';
//                       }
//                       return null;
//                     },
//                   ),
//                   sizedBoxHeight(15.h),
//                   SizedBox(
//                     height: 50.h,
//                     width: 170.w,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         // ignore: deprecated_member_use
//                         primary: const Color(0xFF3B3F43),
//                         shape: RoundedRectangleBorder(
//                           side: const BorderSide(color: Color(0xFF707070)),
//                           borderRadius: BorderRadius.circular(8.h),
//                         ),
//                       ),
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18.sp,
//                           fontFamily: 'StudioProR',
//                         ),
//                       ),
//                       // onPressed: () {
//                       //   final FormState? form =
//                       //       _createcommunitykey.currentState;
//                       //   if (form != null && form.validate()) {
//                       //     // apiForLogin();

//                       //     Get.toNamed("/communityaddparticipants", arguments: {
//                       //       "name": communityName.text,
//                       //       "description": description.text
//                       //     });
//                       //   }
//                       // },
//                       onPressed: () {
//                         final FormState? form =
//                             _createcommunitykey.currentState;
//                         if (form != null && form.validate()) {
//                           // Validated successfully
//                           Get.toNamed(
//                             "/communityaddparticipants",
//                             arguments: {
//                               "name": communityName.text,
//                               "description": description.text,
//                             },
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned.fill(
//           top: -50.h,
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                       blurRadius: 5.w,
//                       color: AppColors.greyL979797,
//                       spreadRadius: 2.w)
//                 ],
//               ),
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 50.h,
//                 child: SvgPicture.asset("assets/community.svg"),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// class Ingridents extends StatefulWidget {
//   const Ingridents({super.key});

//   @override
//   State<Ingridents> createState() => _IngridentsState();
// }

// class _IngridentsState extends State<Ingridents> {
//   late Future<RecipeModel> myfuture;
//   bool? isLiked;
//   bool? isFollow;
//   bool? isSaved;
//   int selectedVideoIndex = 0;
//   final tecComment = TextEditingController();
//   HomeController controllerHome = Get.put(HomeController());
//   GetCommentsController commentsContoller = Get.put(GetCommentsController());

//   Future<T?> commentbottomSheet<T>(String recipeId) {
//     // GetCommentsController commentsContoller = Get.put(GetCommentsController());
//     commentsContoller.emptyComments();
//     commentsContoller.getCommentsData(recipeId);
// // <<<<<<< shams10_8
    
// //     return Get.bottomSheet(
// //       // commentsContoller.getCommentsData(recipeId);
// //       GetBuilder<GetCommentsController>(builder: (context){
// //         return Container(
// //           // height: 375.h,
// //           // height: 425.h,
// // =======
// // >>>>>>> main

//     return Get.bottomSheet(
//         // commentsContoller.getCommentsData(recipeId);
//         GetBuilder<GetCommentsController>(builder: (context) {
//       return Container(
//         // height: 375.h,
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
//               Expanded(child: GetBuilder<HomeController>(builder: (_) {
//                 return commentsContoller.comments == null
//                     ? Center(child: CircularProgressIndicator())
//                     : commentsContoller.comments!.data.isEmpty
//                         ? Center(child: textBlack14Robo("No comments"))
//                         : ListView.builder(
//                             // physics: const NeverScrollableScrollPhysics(),
//                             // shrinkWrap: true,
//                             // itemCount: controllerHome.commentLike.length,
//                             itemCount: commentsContoller.comments!.data.length,

//                             itemBuilder: (context, index) {
//                               final commentData =
//                                   commentsContoller.comments!.data[index];
//                               String originalDate = commentData.createdAt;
//                               DateTime parsedDate =
//                                   DateTime.parse(originalDate);
//                               String formattedDate =
//                                   DateFormat('dd/mm/yyyy').format(parsedDate);
//                               return Column(
//                                 children: [
//                                   tileForlist(
//                                       profileImage:
//                                           commentData.user.profileImage,
//                                       userName: commentData.user.firstName +
//                                           " " +
//                                           commentData.user.lastName,
//                                       comment: commentData.comment,
//                                       likedStatus: commentData.liked,
//                                       likeNo: commentData.likedComments.length,
//                                       commentId: commentData.id,
//                                       recipeId: recipeId,
//                                       numReplies: commentData.repliesLength,
//                                       dateTime: formattedDate),
//                                   // tileForlist(
//                                   //     // controllerHome.commentLike[index]["comment"],
//                                   //     commentData.comment,
//                                   //     // commentData.likedComments.length,
//                                   //     controllerHome.commentLike[index]["like"],
//                                   //     ),
//                                   sizedBoxHeight(13.h)
//                                 ],
//                               );
//                             },
//                           );
//               })
//                   // ListView.builder(
//                   //   // physics: const NeverScrollableScrollPhysics(),
//                   //   // shrinkWrap: true,
//                   //   itemCount: 5,
//                   //   itemBuilder: (context, index) {
//                   //     return Column(
//                   //       children: [
//                   //         tileForlist(
//                   //             controllerHome.commentLike[index]["comment"],
//                   //             controllerHome.commentLike[index]["like"],
//                   //             index),
//                   //         sizedBoxHeight(13.h)
//                   //       ],
//                   //     );
//                   //   },
//                   // ),

//                   ),

//               sizedBoxHeight(15.h),

//               CustomSearchTextFormField(
//                   textEditingController: tecComment,
//                   autofocus: false,
//                   hintText: "Add a comment",
//                   validatorText: '',
//                   suffixIcon: Padding(
//                     padding: EdgeInsets.only(right: 15.w),
//                     child: SizedBox(
//                         height: 50.h,
//                         width: 40.w,
//                         child: Center(
//                             child: InkWell(
//                                 onTap: () {
//                                   if (tecComment.text.isNotEmpty) {
//                                     // print(tecComment.text);
//                                     // controllerHome
//                                     //     .commentMethod(tecComment.text);
//                                     commentsContoller.addCommentApi(
//                                         commment: tecComment.text,
//                                         recipeId: recipeId);
//                                     tecComment.clear();
//                                   }
//                                 },
//                                 child: textgreyM14Sp("Send")))),
//                   ))
//             ],
//           ),
//         ),
//       );
//     }));
//   }

//   Widget tileForlist(
//       {required String userName,
//       required String comment,
//       String? profileImage,
//       required bool likedStatus,
//       required int likeNo,
//       required String commentId,
//       required String recipeId,
//       required String dateTime,
//       required int numReplies

//       // required String date
//       }) {
//     var viewReply = false.obs;
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
//             // textBlack16SP("Chaitali tatkare"),
//             textBlack16SP(userName),

//             sizedBoxHeight(5.h),

//             // textgreyD12Robo("2 Days ago")
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.h),
//                   color: AppColors.greyLtEBEBEB),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
//                 // child: textgreyD10Robo("11:36"),
//                 child: textgreyD10Robo(dateTime),
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
//                         commentsContoller.likeCommentApi(
//                             commentId: commentId, recipeId: recipeId);
//                       },
//                       child: !likedStatus
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

//                     // textgreyL12Robo("20")
//                     textgreyL12Robo(likeNo > 0 ? likeNo.toString() : "")
//                   ],
//                 )
//               ],
//             ),

//             sizedBoxHeight(5.h),

//             textgreyM14Sp("Reply"),

//             sizedBoxHeight(4.h),

//             Obx(() {
//               Replies? replies;

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Visibility(

//                     //one
//                   visible: viewReply.value,
//                   child: 
//                   viewReply.value ? 
//                   // GetBuilder(builder: (context){
//                   //   return SizedBox();
//                   // })
//                   FutureBuilder<Replies>(
//                     future: commentsContoller.getReplies(commentId: commentId),
//                     builder: (BuildContext context, AsyncSnapshot snapshot){
//                       // print()
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
//                         // print(" main wid");
//                         final data = snapshot.data;
//                         final repliesData = data;
//                         // return Icon(Icons.safety_check);
//                         // return ListView()
//                         return SizedBox(
//                           height: 200.h,
//                           child: ListView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: repliesData.length,
//                             itemBuilder: (context, index) {
//                               print("sdf" + repliesData.length.toString());
//                               final reply = repliesData[index];
                                      
//                               String originalDate = reply.createdAt;
//                               DateTime parsedDate = DateTime.parse(originalDate);
//                               String formattedDateReply = DateFormat('dd/MM/yyyy').format(parsedDate);
                          
//                               return Icon(Icons.sd);
                          
//                               // return Row(
//                               //   crossAxisAlignment: CrossAxisAlignment.start,
//                               //   children: [
//                               //     Container(
//                               //       width: 30.h,
//                               //       height: 30.h,
//                               //       decoration: BoxDecoration(
//                               //           borderRadius: BorderRadius.circular(15.h),
//                               //           image: const DecorationImage(
//                               //               image: AssetImage("assets/home/profile.png"),
//                               //               fit: BoxFit.fill)),
//                               //     ),
//                               //     sizedBoxWidth(10.w),
//                               //     Column(
//                               //       crossAxisAlignment: CrossAxisAlignment.start,
//                               //       mainAxisAlignment: MainAxisAlignment.center,
//                               //       children: [
//                               //         // textWhite17w500("George Smith"),
//                               //         // e=
//                               //         // textBlack16SP("Chaitali tatkare"),
//                               //         textBlack16SP(reply.user.firstName + " " + reply.user.lastName),
                                              
                                              
//                               //         sizedBoxHeight(5.h),
                                              
//                               //         // textgreyD12Robo("2 Days ago")
//                               //         Container(
//                               //           decoration: BoxDecoration(
//                               //               borderRadius: BorderRadius.circular(15.h),
//                               //               color: AppColors.greyLtEBEBEB),
//                               //           child: Padding(
//                               //             padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
//                               //             // child: textgreyD10Robo("11:36"),
//                               //             child: textgreyD10Robo(formattedDateReply),
                                          
//                               //           ),
//                               //         ),
                                              
//                               //         sizedBoxHeight(5.h),
                                              
//                               //         textBlack15Robo(reply.comment),
//                               //       ],
//                               //     )
//                               //   ],
//                               // );
                                            
//                               // final follower = followers[index].follower;
//                               // return invite(
//                               //   firstname: follower!.firstName!,
//                               //   username: follower.username!,
//                               //   profileimage: follower.profileImage,
//                               //   userId: follower.id!,
//                               //   index: index,
//                               //   selectedIds: selectedIds,
//                               //   onInvitePressed: (id) {
//                               //     // Handle invite button pressed
//                               //     print('Invite button pressed for: $id');
//                               //   },
//                               // );
//                             },
//                           ),
//                         );
                     
//                       } else if (snapshot.hasError) {
//                         return const Center(child: Text('Failed to load replies'));
//                       } else {
                        
//                         return Container();
//                       }
//                     }) 
//                     : SizedBox()
//                   // Row(
//                   //   crossAxisAlignment: CrossAxisAlignment.start,
//                   //   children: [
//                   //     Container(
//                   //       width: 30.h,
//                   //       height: 30.h,
//                   //       decoration: BoxDecoration(
//                   //           borderRadius: BorderRadius.circular(15.h),
//                   //           image: const DecorationImage(
//                   //               image: AssetImage("assets/home/profile.png"),
//                   //               fit: BoxFit.fill)),
//                   //     ),
//                   //     sizedBoxWidth(10.w),
//                   //     Column(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       mainAxisAlignment: MainAxisAlignment.center,
//                   //       children: [
//                   //         // textWhite17w500("George Smith"),
//                   //         // e=
//                   //         // textBlack16SP("Chaitali tatkare"),
//                   //         textBlack16SP(userName),
                        
                        
//                   //         sizedBoxHeight(5.h),
                        
//                   //         // textgreyD12Robo("2 Days ago")
//                   //         Container(
//                   //           decoration: BoxDecoration(
//                   //               borderRadius: BorderRadius.circular(15.h),
//                   //               color: AppColors.greyLtEBEBEB),
//                   //           child: Padding(
//                   //             padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
//                   //             // child: textgreyD10Robo("11:36"),
//                   //             child: textgreyD10Robo(dateTime),
                              
//                   //           ),
//                   //         ),
                        
//                   //         sizedBoxHeight(5.h),
                        
//                   //         textBlack15Robo(comment),
//                   //       ],
//                   //     )
//                   //   ],
//                   // ),
                    
//                         ),
              

//                   //two
//                       // visible: viewReply.value,
//                       // child: viewReply.value
//                       //     ? FutureBuilder<Replies>(
//                       //         future: commentsContoller.getReplies(
//                       //             commentId: commentId),
//                       //         builder: (context, snapshot) {
//                       //           // print()
//                       //           if (snapshot.connectionState ==
//                       //               ConnectionState.waiting) {
//                       //             return const Center(
//                       //                 child: CircularProgressIndicator());
//                       //           } else if (snapshot.hasData) {
//                       //             // print(" main wid");
//                       //             final repliesData = snapshot.data!.data;
//                       //             // return Icon(Icons.safety_check);
//                       //             // return ListView()
//                       //             return SizedBox(
//                       //               height: 200.h,
//                       //               child: ListView.builder(
//                       //                 physics:
//                       //                     const NeverScrollableScrollPhysics(),
//                       //                 shrinkWrap: true,
//                       //                 itemCount: repliesData.length,
//                       //                 itemBuilder: (context, index) {
//                       //                   print("sdf" +
//                       //                       repliesData.length.toString());
//                       //                   final reply = repliesData[index];

//                       //                   String originalDate = reply.createdAt;
//                       //                   DateTime parsedDate =
//                       //                       DateTime.parse(originalDate);
//                       //                   String formattedDateReply =
//                       //                       DateFormat('dd/MM/yyyy')
//                       //                           .format(parsedDate);

//                       //                   return Icon(Icons.sd);

//                       //                   // return Row(
//                       //                   //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //                   //   children: [
//                       //                   //     Container(
//                       //                   //       width: 30.h,
//                       //                   //       height: 30.h,
//                       //                   //       decoration: BoxDecoration(
//                       //                   //           borderRadius: BorderRadius.circular(15.h),
//                       //                   //           image: const DecorationImage(
//                       //                   //               image: AssetImage("assets/home/profile.png"),
//                       //                   //               fit: BoxFit.fill)),
//                       //                   //     ),
//                       //                   //     sizedBoxWidth(10.w),
//                       //                   //     Column(
//                       //                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                       //                   //       mainAxisAlignment: MainAxisAlignment.center,
//                       //                   //       children: [
//                       //                   //         // textWhite17w500("George Smith"),
//                       //                   //         // e=
//                       //                   //         // textBlack16SP("Chaitali tatkare"),
//                       //                   //         textBlack16SP(reply.user.firstName + " " + reply.user.lastName),

//                       //                   //         sizedBoxHeight(5.h),

//                       //                   //         // textgreyD12Robo("2 Days ago")
//                       //                   //         Container(
//                       //                   //           decoration: BoxDecoration(
//                       //                   //               borderRadius: BorderRadius.circular(15.h),
//                       //                   //               color: AppColors.greyLtEBEBEB),
//                       //                   //           child: Padding(
//                       //                   //             padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
//                       //                   //             // child: textgreyD10Robo("11:36"),
//                       //                   //             child: textgreyD10Robo(formattedDateReply),

//                       //                   //           ),
//                       //                   //         ),

//                       //                   //         sizedBoxHeight(5.h),

//                       //                   //         textBlack15Robo(reply.comment),
//                       //                   //       ],
//                       //                   //     )
//                       //                   //   ],
//                       //                   // );

//                       //                   // final follower = followers[index].follower;
//                       //                   // return invite(
//                       //                   //   firstname: follower!.firstName!,
//                       //                   //   username: follower.username!,
//                       //                   //   profileimage: follower.profileImage,
//                       //                   //   userId: follower.id!,
//                       //                   //   index: index,
//                       //                   //   selectedIds: selectedIds,
//                       //                   //   onInvitePressed: (id) {
//                       //                   //     // Handle invite button pressed
//                       //                   //     print('Invite button pressed for: $id');
//                       //                   //   },
//                       //                   // );
//                       //                 },
//                       //               ),
//                       //             );
//                       //           } else if (snapshot.hasError) {
//                       //             return const Center(
//                       //                 child: Text('Failed to load followers'));
//                       //           } else {
//                       //             return Container();
//                       //           }
//                       //         })
//                       //     : SizedBox()
//                       // // Row(
//                       // //   crossAxisAlignment: CrossAxisAlignment.start,
//                       // //   children: [
//                       // //     Container(
//                       // //       width: 30.h,
//                       // //       height: 30.h,
//                       // //       decoration: BoxDecoration(
//                       // //           borderRadius: BorderRadius.circular(15.h),
//                       // //           image: const DecorationImage(
//                       // //               image: AssetImage("assets/home/profile.png"),
//                       // //               fit: BoxFit.fill)),
//                       // //     ),
//                       // //     sizedBoxWidth(10.w),
//                       // //     Column(
//                       // //       crossAxisAlignment: CrossAxisAlignment.start,
//                       // //       mainAxisAlignment: MainAxisAlignment.center,
//                       // //       children: [
//                       // //         // textWhite17w500("George Smith"),
//                       // //         // e=
//                       // //         // textBlack16SP("Chaitali tatkare"),
//                       // //         textBlack16SP(userName),

//                       // //         sizedBoxHeight(5.h),

//                       // //         // textgreyD12Robo("2 Days ago")
//                       // //         Container(
//                       // //           decoration: BoxDecoration(
//                       // //               borderRadius: BorderRadius.circular(15.h),
//                       // //               color: AppColors.greyLtEBEBEB),
//                       // //           child: Padding(
//                       // //             padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
//                       // //             // child: textgreyD10Robo("11:36"),
//                       // //             child: textgreyD10Robo(dateTime),

//                       // //           ),
//                       // //         ),

//                       // //         sizedBoxHeight(5.h),

//                       // //         textBlack15Robo(comment),
//                       // //       ],
//                       // //     )
//                       // //   ],
//                       // // ),

//                       // ),

//                   //three
//                   sizedBoxHeight(5.h),
//                   numReplies > 0
//                       ? InkWell(
//                           onTap: () {
//                             viewReply.value = !viewReply.value;
//                           },
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 20.w,
//                                 child: Divider(
//                                   thickness: 0.5.h,
//                                   color: AppColors.grey54595F,
//                                 ),
//                               ),
//                               sizedBoxWidth(5.w),
//                               textgreyD12Robo(viewReply.value
//                                   ? "Hide reply"
//                                   : "View ${numReplies.toString()} reply")
//                             ],
//                           ),
//                         )
//                       : SizedBox(),
//                 ],
//               );
//             })

//             // textGrey15W500("21 Jan, 2022, 10:41 am")
//           ],
//         )
//       ],
//     );
//   }

//   void _handleLikeButton(id) async {
//     try {
//       var resp = await LikeService.likeRecipe(id ?? "");
//       if (resp) {
//         setState(() {
//           isLiked = !isLiked!;
//         });
//       }
//     } catch (e) {
//       // Handle error here
//       print('Error liking recipe: $e');
//     }
//   }

//   void _handleSaveButton(id) async {
//     try {
//       var resp = await SaveService.saveRecipe(id ?? "");
//       if (resp) {
//         setState(() {
//           isSaved = !isSaved!;
//         });
//       }
//     } catch (e) {
//       // Handle error here
//       print('Error saving recipe: $e');
//     }
//   }

//   void _handleFollowButton(id) async {
//     try {
//       var resp = await FollowService.followRecipe(id ?? "");
//       if (resp) {
//         setState(() {
//           // isFollow = !isFollow!;
//         });
//       }
//     } catch (e) {
//       // Handle error here
//       print('Error Following user: $e');
//     }
//   }

//   void _handleBlockButton(userid, userName) async {
//     try {
//       var resp = await BlockService.blockRecipe(userid ?? "");
//       if (resp) {
//         setState(() {});
//         Get.toNamed("/sucessfullyblocked",
//             arguments: {"userid": userid, "userName": userName});
//       }
//     } catch (e) {
//       // Handle error here
//       print('Error blocking user: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<RecipeModel>(
//         future: GetRecipeService().getRecipeData(),
//         builder: (ctx, snapshot) {
//           if (snapshot.data == null) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [CircularProgressIndicator()],
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(
//                   '${snapshot.error} occured',
//                   style: TextStyle(fontSize: 18.sm),
//                 ),
//               );
//             }
//           }
//           return ListView.builder(
//             itemCount: receipeModelvar!.data?.length ?? 0,
//             itemBuilder: (context, index) {
//               final recipeData = receipeModelvar!.data?[index];
//               isLiked = recipeData?.liked!;
//               isSaved = recipeData?.saved!;
//               isFollow = recipeData?.following!;
//               final tags =
//                   recipeData?.tags?.map((tag) => tag.tag?.name ?? '') ?? [];
//               String originalDate = recipeData!.createdAt!;
//               DateTime parsedDate = DateTime.parse(originalDate);
//               String formattedDate =
//                   DateFormat('dd/MM/yyyy').format(parsedDate);
//               return Padding(
//                 padding: EdgeInsets.fromLTRB(16.w, 9.h, 16.w, 0),
//                 // padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 9.h),
//                 child: Column(
//                   children: [
//                     Container(
//                         // height: 425.h,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25.h),
//                           color: AppColors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: AppColors.greyL979797,
//                               blurRadius: 2.h,
//                               spreadRadius: 1.h,
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 16.h, horizontal: 9.w),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Stack(
//                                           clipBehavior: Clip.none,
//                                           children: [
//                                             Container(
//                                               width: 50.h,
//                                               height: 50.h,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           25.h),
//                                                   image: DecorationImage(
//                                                       image: NetworkImage(
//                                                           "http://77.68.102.23:8000/${recipeData.user?.profileImage}"),
//                                                       fit: BoxFit.fill)),
//                                             ),
//                                             Positioned(
//                                               bottom: -10.h,
//                                               right: 2.h,
//                                               child: Image.asset(
//                                                 "assets/svg/rankTag.png",
//                                                 height: 45.h,
//                                                 width: 25.h,
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         sizedBoxWidth(10.w),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             // textWhite17w500("George Smith"),
//                                             // e=
//                                             GestureDetector(
//                                               onTap: () {
//                                                 Get.toNamed("/viewuser");
//                                               },
//                                               child: textgreyD16BoldSP(
//                                                   recipeData?.user?.username ??
//                                                       ''),
//                                             ),

//                                             sizedBoxHeight(5.h),

//                                             textgreyD12Robo(formattedDate)

//                                             // textGrey15W500("21 Jan, 2022, 10:41 am")
//                                           ],
//                                         )
//                                       ],
//                                     ),

//                                     Row(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             print("pressed");
//                                             _handleFollowButton(
//                                                 recipeData.user!.id!);
//                                           },
//                                           child: recipeData!.following!
//                                               ? Container(
//                                                   //     width: 60.w,
//                                                   // height: 30,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.r),
//                                                     border: Border.all(
//                                                       color: const Color(
//                                                           0xFF3B3F43),
//                                                     ),
//                                                   ),
//                                                   child: Padding(
//                                                     padding:
//                                                         EdgeInsets.all(5.h),
//                                                     child: Center(
//                                                       child: textgreyD14Robo(
//                                                           "Following"),
//                                                     ),
//                                                   ),
//                                                 )
//                                               : Container(
//                                                   //  width: 80.w,
//                                                   decoration: BoxDecoration(
//                                                     color:
//                                                         AppColors.greyD3B3F43,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.r),
//                                                     border: Border.all(
//                                                         color: Colors
//                                                             .grey.shade700),
//                                                   ),
//                                                   child: Padding(
//                                                     padding:
//                                                         EdgeInsets.all(5.h),
//                                                     child: Center(
//                                                       child: textWhite14Robo(
//                                                           "Follow"),
//                                                     ),
//                                                   ),
//                                                 ),
//                                         ),
                                    
//                                         Container(
//                                           child: recipeData.following!
//                                               ? PopupMenuButton(
//                                                   offset: const Offset(0, 50),
//                                                   color:
//                                                       const Color(0xFFFFFFFF),
//                                                   tooltip: '',
//                                                   child: const Icon(
//                                                     Icons.more_vert,
//                                                     color: Color(0xFF3B3F43),
//                                                   ),
//                                                   onSelected: (value) {
//                                                     if (value == "Report") {
//                                                       Get.toNamed('/Report',
//                                                           arguments: {
//                                                             "recipeid":
//                                                                 recipeData.id
//                                                           });
//                                                     } else if (value ==
//                                                         "block") {
//                                                       showDialog(
//                                                         context: context,
//                                                         builder: (context) =>
//                                                             Padding(
//                                                           padding:
//                                                               EdgeInsets.all(
//                                                                   15.w),
//                                                           child: AlertDialog(
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10.r)),
//                                                             insetPadding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     vertical:
//                                                                         10),
//                                                             title: Text(
//                                                               "Block User",
//                                                               style: TextStyle(
//                                                                   fontFamily:
//                                                                       'Studio Pro',
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   fontSize:
//                                                                       18.sp,
//                                                                   color: const Color(
//                                                                       0xff3B3F43)),
//                                                             ),
//                                                             content: SizedBox(
//                                                               // margin: EdgeInsets.symmetric(horizontal: 10.w),
//                                                               width:
//                                                                   MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                               child: Text(
//                                                                 "Are you sure you want to Block @${recipeData.user!.username}?",
//                                                                 style: TextStyle(
//                                                                     fontFamily:
//                                                                         'Roboto',
//                                                                     fontSize:
//                                                                         16.sp,
//                                                                     color: const Color(
//                                                                         0xff54595F)),
//                                                               ),
//                                                             ),
//                                                             actions: [
//                                                               InkWell(
//                                                                 onTap: () {
//                                                                   Get.back();
//                                                                 },
//                                                                 child: Text(
//                                                                   "Cancel",
//                                                                   style: TextStyle(
//                                                                       fontFamily:
//                                                                           "Roboto",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                       fontSize:
//                                                                           16.sp,
//                                                                       color: const Color(
//                                                                           0xff000000)),
//                                                                 ),
//                                                               ),
//                                                               sizedBoxWidth(
//                                                                   15.sp),
//                                                               GestureDetector(
//                                                                 onTap: () {
//                                                                   Get.back();
//                                                                   _handleBlockButton(
//                                                                       recipeData
//                                                                           .userId,
//                                                                       recipeData
//                                                                           .user!
//                                                                           .username);
//                                                                 },
//                                                                 child: Text(
//                                                                   "Block User",
//                                                                   style: TextStyle(
//                                                                       fontFamily:
//                                                                           "Roboto",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500,
//                                                                       fontSize:
//                                                                           16.sp,
//                                                                       color: const Color(
//                                                                           0xffB90101)),
//                                                                 ),
//                                                               ),
//                                                               sizedBoxWidth(
//                                                                   15.sp),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       );
//                                                     }
//                                                   },
//                                                   itemBuilder:
//                                                       (BuildContext bc) {
//                                                     return [
//                                                       PopupMenuItem(
//                                                         value: 'Report',
//                                                         child: Column(
//                                                           children: [
//                                                             Row(
//                                                               children: [
//                                                                 SvgPicture
//                                                                     .asset(
//                                                                   "assets/question-circle-svgrepo-com.svg",
//                                                                   height: 20.h,
//                                                                   width: 20.w,
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 15.w,
//                                                                 ),
//                                                                 Text(
//                                                                   "Report",
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontFamily:
//                                                                           "Roboto",
//                                                                       fontSize:
//                                                                           16.sp),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       PopupMenuItem(
//                                                         value: 'block',
//                                                         child: Row(
//                                                           children: [
//                                                             SvgPicture.asset(
//                                                               "assets/block-svgrepo-com.svg",
//                                                               height: 20.h,
//                                                               width: 20.w,
//                                                             ),
//                                                             SizedBox(
//                                                               width: 15.w,
//                                                             ),
//                                                             Text(
//                                                               "Block",
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontFamily:
//                                                                       "Roboto",
//                                                                   fontSize:
//                                                                       16.sp),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ];
//                                                   },
//                                                 )
//                                               : const SizedBox(),
//                                         ),
//                                       ],
//                                     ),

//                                     // customButtonWithBorder(
//                                     //   "text",
//                                     //   onPressed: onPressed
//                                     // )
//                                   ],
//                                 ),
//                               ),
//                               sizedBoxHeight(14.h),
//                               Stack(
//                                 clipBehavior: Clip.none,
//                                 children: [
//                                   recipeData.coverImage != null
//                                       ? Container(
//                                           height: 180.h,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20.h),
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     "http://77.68.102.23:8000/${recipeData.coverImage}"),
//                                                 fit: BoxFit.fill),
//                                           ),
//                                         )
//                                       : Container(
//                                           height: 180.h,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(20.h),
//                                               image: DecorationImage(
//                                                   image: NetworkImage(''),
//                                                   fit: BoxFit.fill)),
//                                         ),
//                                   Container(
//                                     height: 180.h,
//                                     child: Padding(
//                                       padding: EdgeInsets.all(9.h),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           InkWell(
//                                             onTap: () {
//                                               Get.toNamed("/assetplayerwidget",
//                                                   arguments: {
//                                                     "videourl": recipeData.video
//                                                   });
//                                             },
//                                             child: Container(
//                                               width: 80.w,
//                                               height: 30.h,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           5.h),
//                                                   color: AppColors.white
//                                                       .withOpacity(0.5)),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Image.asset(
//                                                     "assets/icons/video.png",
//                                                     height: 10.h,
//                                                     width: 15.w,
//                                                   ),
//                                                   sizedBoxWidth(2.w),
//                                                   textgreyD12Robo("Video")
//                                                 ],

//                                                 // Image.asset("assets/icons/video.png"),
//                                               ),
//                                             ),
//                                           ),

//                                           // Spacer(),

//                                           SizedBox(
//                                             height: 27.h,
//                                             child: ListView.separated(
//                                               separatorBuilder:
//                                                   (context, index) {
//                                                 return SizedBox(width: 5.w);
//                                               },
//                                               scrollDirection: Axis.horizontal,
//                                               physics:
//                                                   const BouncingScrollPhysics(),
//                                               shrinkWrap: true,
//                                               itemCount: tags.length,
//                                               itemBuilder: (context, index) {
//                                                 return InkWell(
//                                                   onTap: () {
//                                                     setState(() {
//                                                       selectedVideoIndex =
//                                                           index;
//                                                       // listCardData[index]["selectedVideoInde"] = index;
//                                                     });
//                                                   },
//                                                   child: Container(
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(15.h),
//                                                         color: index ==
//                                                                 selectedVideoIndex
//                                                             ? AppColors.white
//                                                                 .withOpacity(
//                                                                     0.7)
//                                                             : AppColors
//                                                                 .greyD3B3F43
//                                                                 .withOpacity(
//                                                                     0.7)),
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsets.symmetric(
//                                                               horizontal: 7.w,
//                                                               vertical: 5.h),
//                                                       child: selectedVideoIndex ==
//                                                               index
//                                                           ? textgreyD12Robo(tags
//                                                               .elementAt(index))
//                                                           : textWhite12Robo(
//                                                               tags.elementAt(
//                                                                   index)),
//                                                     ),
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ),

//                                           // Container(
//                                           //   decoration: BoxDecoration(
//                                           //     borderRadius: BorderRadius.circular(15.h),
//                                           //     color: AppColors.white.withOpacity(0.5)
//                                           //   ),
//                                           //   child: Padding(
//                                           //     padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
//                                           //     child: textgreyD12Robo("Video"),
//                                           //   ),
//                                           // )
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               sizedBoxHeight(13.h),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             _handleLikeButton(recipeData.id!);
//                                           },
//                                           child: isLiked!
//                                               ? Image.asset(
//                                                   "assets/icons/like_filled.png",
//                                                   width: 20.w,
//                                                   height: 18.h,
//                                                   // color: like == 0 ? AppColors.red:AppColors.black,
//                                                   // color: like ?AppColors.white : null ,
//                                                 )
//                                               : Image.asset(
//                                                   "assets/icons/like.png",
//                                                   width: 20.w,
//                                                   height: 18.h,
//                                                   // color: like == 0 ? AppColors.red:AppColors.black,
//                                                   // color: like ?AppColors.white : null ,
//                                                 ),
//                                         ),
//                                         sizedBoxWidth(25.w),
//                                         InkWell(
//                                           onTap: () {
//                                             commentbottomSheet(recipeData.id!);
//                                           },
//                                           child: Image.asset(
//                                             "assets/icons/comment.png",
//                                             width: 20.w,
//                                             height: 18.h,
//                                           ),
//                                         ),
//                                         sizedBoxWidth(25.w),
//                                         InkWell(
//                                           onTap: share,
//                                           // (){
//                                           //   shar
//                                           //   // Share.share('https://www.google.co.in/');
//                                           // },
//                                           child: Image.asset(
//                                             "assets/icons/share.png",
//                                             width: 20.w,
//                                             height: 18.h,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         _handleSaveButton(recipeData.id!);
//                                         // setState(() {
//                                         //   listCardData[index]
//                                         //           ["save"] =
//                                         //       save == 0 ? 1 : 0;
//                                         // });
//                                       },
//                                       child: recipeData.saved!
//                                           ? Image.asset(
//                                               "assets/icons/save_filled.png",
//                                               width: 20.w,
//                                               height: 18.h,
//                                             )
//                                           : Image.asset(
//                                               "assets/icons/save.png",
//                                               width: 20.w,
//                                               height: 18.h,
//                                             ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               sizedBoxHeight(10.h),
//                               Padding(
//                                 padding:
//                                     EdgeInsets.fromLTRB(11.w, 0.w, 0.w, 10.w),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     recipeData.likes == 0
//                                         ? textgreyD12Robo("")
//                                         : textgreyD12Robo(
//                                             "${recipeData.likes.toString()} likes"),
//                                     textgreyD20BoldSP(recipeData.name!),
//                                     textgreyL12Robo(
//                                         "View all ${recipeData.comments} comments"),
//                                     SizedBox(height: 5.w),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 11.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Container(
//                                           width: 27.h,
//                                           height: 27.h,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(14.h),
//                                               image: const DecorationImage(
//                                                   image: AssetImage(
//                                                       "assets/home/profile.png"),
//                                                   fit: BoxFit.fill)),
//                                         ),
//                                         sizedBoxWidth(5.w),
//                                         InkWell(
//                                             onTap: () {
//                                               commentbottomSheet(
//                                                   recipeData.id!);
//                                             },
//                                             child: textgreyL12Robo(
//                                                 "Add a comment"))
//                                       ],
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           print(recipeData.id);
//                                           Get.toNamed("/InspirationRecipeComment",
//                                             arguments:recipeData.id
//                                           );
//                                         },
//                                         child: textgreyD12Robo("View Recipe >"))
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )),

//                     // listCard(
//                     //     listCardData[index]["like"],
//                     //     listCardData[index]["save"],
//                     //     index,
//                     //     listCardData[index]["isFollowedByMe"]),
//                     sizedBoxHeight(13.h)
//                   ],
//                 ),
//               )
//                   // Card(
//                   //   child: Column(
//                   //     crossAxisAlignment: CrossAxisAlignment.start,
//                   //     children: [
//                   //       ListTile(
//                   //         leading: CircleAvatar(
//                   //           backgroundImage: NetworkImage(
//                   //               recipe.user?.profileImage ?? ''),
//                   //         ),
//                   //         title: Text(recipe.user?.username ?? ''),
//                   //         subtitle: Text(recipe.name ?? ''),
//                   //         //    trailing: Text('Likes: ${recipe.likes ?? 0}'),
//                   //       ),
//                   //       Padding(
//                   //         padding: const EdgeInsets.all(8.0),
//                   //         child: Text('Tags: ${tags.join(', ')}'),
//                   //       ),
//                   //       Image.network(recipe.coverImage ?? ''),
//                   //       Divider(),
//                   //     ],
//                   //   ),
//                   // )
//                   ;
//             },
//           );
//         },
//       ),
//     );
//   }
// }
