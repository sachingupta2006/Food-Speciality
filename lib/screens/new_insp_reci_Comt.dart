// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodspeciality/common%20files/filter_bottom_sheet.dart';
// import 'package:foodspeciality/common%20files/sized_box.dart';
// import 'package:foodspeciality/utils/colors.dart';
// import 'package:foodspeciality/utils/texts.dart';
// import 'package:get/get.dart';

// class NewInspiRecipeComment extends StatefulWidget {
//   const NewInspiRecipeComment({super.key});

//   @override
//   State<NewInspiRecipeComment> createState() => _NewInspiRecipeCommentState();
// }

// class _NewInspiRecipeCommentState extends State<NewInspiRecipeComment> {

//   int selectedVideoIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           // bottom: ,
//           toolbarHeight: 258.h,
//           titleSpacing: 0,
//           title: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 258.h,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/Mask Group 14.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 16.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               sizedBoxHeight(26.h),
//                               GestureDetector(
//                                   onTap: () {
//                                     Get.back();
//                                   },
//                                   child:
//                                       SvgPicture.asset('assets/Path 39.svg',
//                                         height: 18.h,
//                                         width: 27.w,
//                                       )),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               SvgPicture.asset(
//                                   "assets/svg/media-play-circle-svgrepo-com.svg",
//                                     height: 63.h,
//                                     width: 63.h,
//                                   ),
//                               sizedBoxHeight(30.h),
//                               sizedBoxHeight(5.h),
//                               Container(
//                                 decoration: BoxDecoration(boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.9),
//                                     blurRadius: 25.0, // soften the shadow
//                                     spreadRadius: 20.0, //extend the shadow
//                                     offset: const Offset(
//                                       5.0, // Move to right 5  horizontally
//                                       5.0, // Move to bottom 5 Vertically
//                                     ),
//                                   )
//                                 ]),
//                                 height: 35.h,
//                                 width: double.infinity,
//                                 child: Text(
//                                   "Chomolia Recipe",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20.sp),
//                                 ),
//                               ),
        
//                               SizedBox(
//                                 height: 27.h,
//                                 child: ListView.separated(
//                                   separatorBuilder: (context, index) {
//                                     return SizedBox(width: 5.w);
//                                   },
//                                   scrollDirection: Axis.horizontal,
//                                   physics: const BouncingScrollPhysics(),
//                                   shrinkWrap: true,
//                                   itemCount: 10,
//                                   itemBuilder: (context, index) {
//                                     return InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           selectedVideoIndex = index;
//                                           // listCardData[index]["selectedVideoInde"] = index;
//                                         });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(15.h),
//                                             color: index == selectedVideoIndex
//                                                 ? AppColors.white.withOpacity(0.7)
//                                                 : AppColors.greyD3B3F43
//                                                     .withOpacity(0.7)),
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 7.w, vertical: 5.h),
//                                           child: selectedVideoIndex == index
//                                               ? textgreyD12Robo("Video")
//                                               : textWhite12Robo("Video"),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
        
        
//                               sizedBoxHeight(8.h),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 80.h,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(
//                             Icons.access_time,
//                             size: 14.sp,
//                             color: Colors.white,
//                           ),
//                           sizedBoxWidth(3.w),
//                           Text(
//                             "30 Min",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 fontFamily: 'StudioProM',
//                                 fontSize: 12.sp,
//                                 color: const Color(0xffFFFFFF)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
        
//               // sizedBoxHeight(22.h),
        
//             ],
//           ),
              
//               // sizedBoxHeight(22.h),
          
//         ),
      
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
//               child: NestedScrollView(
//                 headerSliverBuilder: (context, value){
//                   return [
//                     // Container()
//                     SliverToBoxAdapter(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
                          
//                           sizedBoxHeight(5.h),
                        
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // sizedBoxHeight(5.h),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // sizedBoxWidth(5.h),
//                                   Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/icons/like.png',
//                                         height: 18.h,
//                                         width: 20.w,
//                                       ),
//                                       Text(
//                                         '23k',
//                                         style: TextStyle(
//                                             color: const Color(0xff020202), fontSize: 10.sp),
//                                       )
//                                     ],
//                                   ),
//                                   sizedBoxWidth(20.w),
//                                   Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/icons/comment.png',
//                                         height: 18.h,
//                                         width: 20.w,
//                                       ),
//                                       Text(
//                                         '150',
//                                         style: TextStyle(
//                                             color: const Color(0xff020202), fontSize: 10.sp),
//                                       )
//                                     ],
//                                   ),
//                                   sizedBoxWidth(20.w),
//                                   SvgPicture.asset(
//                                     'assets/share-svgrepo-com.svg',
//                                     height: 18.h,
//                                     width: 20.w,
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/icons/save.png',
//                                         height: 18.h,
//                                         width: 20.w,
//                                       ),
//                                       Text(
//                                         '50',
//                                         style: TextStyle(
//                                             color: const Color(0xff020202), fontSize: 10.sp),
//                                       )
//                                     ],
//                                   ),
//                                   // sizedBoxWidth(16),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           sizedBoxHeight(22.h),
                                
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 32.r,
//                                     backgroundColor: Colors.grey,
//                                     child: const Image(
//                                         image: AssetImage("assets/Mask Group 40.png")),
//                                   ),
//                                   sizedBoxWidth(9.w),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Namrata Burondkar",
//                                         style: TextStyle(
//                                             fontSize: 16.h, fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         "@Namrata07",
//                                         style: TextStyle(
//                                           fontSize: 14.sp,
//                                           color: const Color(0xff979797),
//                                         ),
//                                       ),
//                                       sizedBoxHeight(5.h),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Icon(
//                                             Icons.location_on_outlined,
//                                             size: 16.sp,
//                                             color: const Color(0xff54595F),
//                                           ),
//                                           Text(
//                                             "South Africa",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 fontSize: 14.sp,
//                                                 color: const Color(0xff54595F)),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
                                
//                               Container(
//                                 width: 80.w,
//                                 // height: 30,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8.r),
//                                   border: Border.all(
//                                     color: Color(0xFF3B3F43),
//                                   ),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.all(5.h),
//                                   child: Center(
//                                     child: textgreyD14Robo("Following")
//                                     // Text(
//                                     //   "Following",
//                                     //   style: TextStyle(
//                                     //     fontFamily: "StudioProR",
//                                     //     fontSize: 14.sp,
//                                     //     fontWeight: FontWeight.w500,
//                                     //     color: Color(0xFF3B3F43),
//                                     //   ),
//                                     // ),
//                                   ),
//                                 ),
//                               ),
                                
//                             ],
//                           ),
                                
//                           sizedBoxHeight(13.h),
                                
//                           Text("Lorem Ipsum is simply dummy text of the printing and ty..",
//                             // maxLines: more ? null : 1,
//                             style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontFamily: 'Roboto',
//                                 color: const Color(0xff6B6B6B))
//                           ),
                      
//                           sizedBoxHeight(15.h),
                      
//                           const Divider(thickness: 0.3, color: Color(0xff707070)),
                        
//                           sizedBoxHeight(15.h),
                        
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset(
//                                 "assets/svg/Group 58247.svg",
//                                 height: 36.h,
//                               ),
//                               sizedBoxWidth(3.5.w),
//                               Text(
//                                 "10 Serving",
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 15.sp,
//                                     color: const Color(0xff000000)),
//                               ),
//                               sizedBoxWidth(11.5.w),
//                               SvgPicture.asset(
//                                 "assets/svg/Group 58248.svg",
//                                 height: 36.h,
//                               ),
//                               sizedBoxWidth(3.5.w),
//                               Text(
//                                 "30 Minutes",
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 15.sp,
//                                     color: const Color(0xff000000)),
//                               ),
//                             ],
//                           ),
                              
//                           sizedBoxHeight(15.h),
                          
                              
//                           TabBar(
//                                 // controller: _tabController,
//                                 indicator: UnderlineTabIndicator(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(width: 2.5.sp),
//                               // insets: EdgeInsets.symmetric(horizontal: 80.w),
//                             ),
//                             indicatorSize: TabBarIndicatorSize.tab,
//                             indicatorPadding:
//                             const EdgeInsets.symmetric(horizontal: 50),
//                             // indicatorWeight: 4,
                              
//                             indicatorColor: const Color(0xFF3B3F43),
//                             unselectedLabelStyle:
//                             const TextStyle(color: Color(0xFF6B6B6B)),
//                             labelColor: const Color.fromRGBO(59, 63, 67, 1),
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18.sp,
//                             ),
//                             tabs: [
//                               Tab(
//                                 child: Text(
//                                   "Recipe",
//                                   style: TextStyle(
//                                       fontFamily: "StudioProM", fontSize: 17.sp),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   "Comments",
//                                   style: TextStyle(
//                                       fontFamily: "StudioProM", fontSize: 17.sp),
//                                 ),
//                               ),
//                             ],
//                           ),
                              
                                
                                
//                         ],
//                       ),
                    
//                   )
//                   ];
//                 }, 
//                 body: TabBarView(
//                   // physics: NeverScrollableScrollPhysics(),
//                   children: [
//                     _recipeTabbarView(),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 22.w),
//                       child: _commentTabbarView(),
//                     )
//                   ]
//                 ),
//               ) 
            
//             ),
//           )
//         ),
//       ),
//     );
//   }

//    Widget _recipeTabbarView() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           sizedBoxHeight(22.h),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Ingredients",
//                 style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
//               ),
//               sizedBoxHeight(11.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "chomolia, finely chopped",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                   Text(
//                     "1 Bunch",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 height: 1,
//                 thickness: 0.5,
//               ),
//               sizedBoxHeight(15.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Onion, finely chopped",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                   Text(
//                     "1",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 height: 1,
//                 thickness: 0.5,
//               ),
//               sizedBoxHeight(15.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Yellow pepper, finely chopped",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                   Text(
//                     "1",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 height: 1,
//                 thickness: 0.5,
//               ),
//               sizedBoxHeight(15.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Olive oil",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                   Text(
//                     "2 TBS",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 height: 1,
//                 thickness: 0.5,
//               ),
//               sizedBoxHeight(15.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Benny spice",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                   Text(
//                     "To Taste",
//                     style: TextStyle(
//                         fontSize: 14.sp, color: const Color(0xff414141)),
//                   ),
//                 ],
//               ),
//               const Divider(
//                 height: 1,
//                 thickness: 0.5,
//               ),
//             ],
//           ),
//           sizedBoxHeight(30.h),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Instructions",
//                 style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
//               ),
//               sizedBoxHeight(15.h),
//               Container(
//                 height: 80.h,
//                 decoration: ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: Color(0xff7070705E)),
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 12.h),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       sizedBoxWidth(6.w),
//                       CircleAvatar(
//                         radius: 11.sp,
//                         backgroundColor: const Color(0xff6B6B6B),
//                         child: Text(
//                           "1",
//                           style:
//                               TextStyle(fontSize: 14.sp, color: Colors.white),
//                         ),
//                       ),
//                       sizedBoxWidth(7.w),
//                       Text(
//                         "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           color: const Color(0xff707070),
//                           fontSize: 15.spMin,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(14.h),
//               Container(
//                 height: 80.h,
//                 decoration: ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: Color(0xff7070705E)),
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 12.h),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       sizedBoxWidth(6.w),
//                       CircleAvatar(
//                         radius: 11.sp,
//                         backgroundColor: const Color(0xff6B6B6B),
//                         child: Text(
//                           "2",
//                           style:
//                               TextStyle(fontSize: 14.sp, color: Colors.white),
//                         ),
//                       ),
//                       sizedBoxWidth(7.w),
//                       Text(
//                         "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           color: const Color(0xff707070),
//                           fontSize: 15.spMin,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(14.h),
//               Container(
//                 // height: 80.h,
//                 decoration: ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: Color(0xff7070705E)),
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 12.h),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           sizedBoxWidth(6.w),
//                           CircleAvatar(
//                             radius: 11.sp,
//                             backgroundColor: const Color(0xff6B6B6B),
//                             child: Text(
//                               "3",
//                               style: TextStyle(
//                                   fontSize: 14.sp, color: Colors.white),
//                             ),
//                           ),
//                           sizedBoxWidth(7.w),
//                           Text(
//                             "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                               color: const Color(0xff707070),
//                               fontSize: 15.spMin,
//                             ),
//                           ),
//                         ],
//                       ),
//                       sizedBoxHeight(6.h),
//                       Image.asset("assets/Mask Group 24.png",
//                         height: 173.h,
//                         width: double.infinity,
//                         fit: BoxFit.fill,
//                       )
//                       // Image(
//                       //   height: 173.h,
//                       //   // fit: 
//                       //   // ,
//                       //   width: double.infinity,
//                       //   image: AssetImage("assets/Mask Group 24.png",
//                       //     // heigh
//                       //   ))
//                     ],
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(14.h),
//               Container(
//                 // height: 285.h,
//                 decoration: ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: Color(0xff7070705E)),
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 12.h),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           sizedBoxWidth(6.w),
//                           CircleAvatar(
//                             radius: 11.sp,
//                             backgroundColor: const Color(0xff6B6B6B),
//                             child: Text(
//                               "4",
//                               style: TextStyle(
//                                   fontSize: 14.sp, color: Colors.white),
//                             ),
//                           ),
//                           sizedBoxWidth(7.w),
//                           Text(
//                             "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                               color: const Color(0xff707070),
//                               fontSize: 15.spMin,
//                             ),
//                           ),
//                         ],
//                       ),

//                       sizedBoxHeight(6.h),
//                       Image.asset("assets/Mask Group 25.png",
//                         height: 173.h,
//                         width: double.infinity,
//                         fit: BoxFit.fill,
//                       )
//                       // const Image(
//                       //     image: AssetImage("assets/Mask Group 25.png")),
//                     ],
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(42.h),
//             ],
//           ),
//           const Divider(
//             height: 0,
//           ),
//           sizedBoxHeight(20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: Text(
//                   'Other Recipes By @Priyujoshi',
//                   style: TextStyle(fontSize: 17.sp, fontFamily: 'StudioProM'),
//                 ),
//               ),
//             ],
//           ),
//           sizedBoxHeight(20.h),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16),
//                   child: SizedBox(
//                     height: 155.h,
//                     child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return OtherRecipeCard();
//                         },
//                         separatorBuilder: (context, index) {
//                           return SizedBox(
//                             width: 11.3.w,
//                           );
//                         },
//                         itemCount: 5),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           sizedBoxHeight(20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: Text(
//                   'Similar Recipes',
//                   style: TextStyle(fontSize: 17.sp, fontFamily: 'StudioProM'),
//                 ),
//               ),
//             ],
//           ),
//           sizedBoxHeight(20.h),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16),
//                   child: SizedBox(
//                     height: 150.h,
//                     child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 93.h,
//                                 width: 115.w,
//                                 decoration: BoxDecoration(
//                                     image: const DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                             'assets/Chocolate 2.png')),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(9.r),
//                                         topRight: Radius.circular(9.r))),
//                                 // child: Image.asset(
//                                 //   'assets/Chocolate 2.png',
//                                 //   fit: BoxFit.cover,
//                                 // ),
//                               ),
//                               Material(
//                                 borderRadius: BorderRadius.circular(9.sp),
//                                 elevation: 1.2,
//                                 child: Container(
//                                   height: 49.h,
//                                   width: 115.w,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(9.r),
//                                           bottomRight: Radius.circular(9.r))),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       sizedBoxHeight(3.5.h),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 7.4.w),
//                                         child: Text(
//                                           'Slappappoffer Recipe',
//                                           style: TextStyle(
//                                               fontSize: 8.sp,
//                                               fontFamily: 'Roboto'),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 7.4.w),
//                                         child: Text(
//                                           '@Priyujoshi',
//                                           style: TextStyle(
//                                               color: const Color(0xff6B6B6B),
//                                               fontSize: 5.sp,
//                                               fontFamily: 'Roboto'),
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           sizedBoxWidth(8.w),
//                                           Image.asset(
//                                             'assets/like-svgrepo-com.png',
//                                             height: 10.h,
//                                             width: 11.8.w,
//                                           ),
//                                           Text(
//                                             '23k',
//                                             style: TextStyle(
//                                                 fontFamily: 'Roboto',
//                                                 fontSize: 6.sp),
//                                           ),
//                                           sizedBoxWidth(16.w),
//                                           Image.asset(
//                                             'assets/comment-blank-svgrepo-com.png',
//                                             height: 9.7.h,
//                                             width: 10.18.w,
//                                           ),
//                                           Text(
//                                             '150',
//                                             style: TextStyle(
//                                                 fontFamily: 'Roboto',
//                                                 fontSize: 6.sp),
//                                           ),
//                                           sizedBoxWidth(16.w),
//                                           Image.asset(
//                                             'assets/bookmark-svgrepo-com.png',
//                                             height: 9.h,
//                                             width: 6.8.w,
//                                           ),
//                                           Text(
//                                             '50',
//                                             style: TextStyle(
//                                                 fontFamily: 'Roboto',
//                                                 fontSize: 6.sp),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return SizedBox(
//                             width: 11.3.w,
//                           );
//                         },
//                         itemCount: 5),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _commentTabbarView() {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 8.w),
//           height: 200,
//           child: ListView.builder(
//             itemCount: 3,
//             itemBuilder: (BuildContext context, int index) {
//               return Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CircleAvatar(
//                             radius: 14.r,
//                             child: const Image(
//                                 image:
//                                     AssetImage("assets/Mask Group 40.png")),
//                           ),
//                           sizedBoxWidth(9.w),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Chaitali tatkare",
//                                 style: TextStyle(
//                                     fontSize: 14.h, fontFamily: 'StudioProR'),
//                               ),
//                               Container(
//                                 width: 32.w,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xffEEEEEE),
//                                   borderRadius: BorderRadius.circular(6.0),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     '11:36',
//                                     style: TextStyle(
//                                         fontFamily: 'Roboto',
//                                         fontSize: 7.sp,
//                                         color: const Color(0xff434343)),
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry..",
//                                 style: TextStyle(
//                                     fontSize: 12.h, fontFamily: 'Roboto'),
//                               ),
//                               Text(
//                                 'Reply',
//                                 style: TextStyle(
//                                     fontFamily: 'StudioProB',
//                                     fontSize: 10.sp,
//                                     color: const Color(0xff54595F)),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           sizedBoxHeight(25.h),
//                           Image.asset(
//                             'assets/like-svgrepo-com.png',
//                             height: 17.h,
//                           ),
//                           Text(
//                             '20',
//                             style: TextStyle(
//                                 color: const Color(0xff020202),
//                                 fontSize: 10.sp),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   sizedBoxHeight(16.h),
//                 ],
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           height: 50.h,
//           child: TextFormField(
//             decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.r),
//                   borderSide: const BorderSide(color: Color(0xff707070)),
//                 ),
//                 border: const OutlineInputBorder(),
//                 hintText: "Add a comment",
//                 hintStyle: TextStyle(
//                     color: const Color(0xff6B6B6B),
//                     fontFamily: 'Roboto',
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w500),
//                 filled: true,
//                 fillColor: Colors.white,
//                 suffixIcon: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Send',
//                       style: TextStyle(
//                           color: const Color(0xff6B6B6B),
//                           fontFamily: 'Roboto',
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 )),
//           ),
//         ),

//       ],
//     );
//   }

//   Widget OtherRecipeCard(){
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 93.h,
//           width: 115.w,
//           decoration: BoxDecoration(
//               image: const DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage(
//                       'assets/Chocolate 2.png')),
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(9.r),
//                   topRight: Radius.circular(9.r))),
//         ),
//         Material(
//           borderRadius: BorderRadius.circular(9.sp),
//           elevation: 1.2,
//           child: Container(
//             height: 49.h,
//             width: 115.w,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(9.r),
//                     bottomRight: Radius.circular(9.r))),
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,
//               children: [
//                 sizedBoxHeight(3.5.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 7.4.w),
//                   child: Text(
//                     'Slappappoffer Recipe',
//                     style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 10.sp),
//                   ),
//                   // sizedBoxWidth(16.w),
//                   // Image.asset(
//                   //   'assets/icons/save.png',
//                   //   height: 9.h,
//                   //   width: 6.8.w,

//                   // ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 7.4.w),
//                   child: Text(
//                     '@Priyujoshi',
//                     style: TextStyle(
//                         color: const Color(0xff6B6B6B),
//                         fontSize: 8.sp,
//                         fontFamily: 'Roboto'),
//                   ),
//                 ),
//                 sizedBoxHeight(5.h),
//                 Row(
//                   children: [
//                     sizedBoxWidth(8.w),
//                     Image.asset(
//                       'assets/like-svgrepo-com.png',
//                       height: 10.h,
//                       width: 11.8.w,
//                     ),
//                     Text(
//                       '23k',
//                       style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 6.sp),
//                     ),
//                     sizedBoxWidth(16.w),
//                     Image.asset(
//                       'assets/comment-blank-svgrepo-com.png',
//                       height: 9.7.h,
//                       width: 10.18.w,
//                     ),
//                     Text(
//                       '150',
//                       style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 6.sp),
//                     ),
//                     sizedBoxWidth(16.w),
//                     Image.asset(
//                       'assets/bookmark-svgrepo-com.png',
//                       height: 9.h,
//                       width: 6.8.w,
//                     ),
//                     Text(
//                       '50',
//                       style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 6.sp),
//                     ),
//                   ],
//                 ),
//                 // sizedBoxHeight(5.h)
//               ],
//             ),
//           ),
//         ),
//       ],
//     );

//   }


// }