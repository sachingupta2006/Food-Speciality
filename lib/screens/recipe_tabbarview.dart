// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodspeciality/common%20files/sized_box.dart';
// import 'package:foodspeciality/common%20files/video_player_file.dart';
// import 'package:foodspeciality/common%20files/video_player_widget.dart';
// import 'package:foodspeciality/controllers/recipe_ingre_controller.dart';
// import 'package:foodspeciality/screens/recipe_ingredients.dart';
// // import 'package:foodspeciality/screens/videowalapage.dart';
// import 'package:foodspeciality/utils/colors.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
// import 'common_chip.dart';

// class RecipeTabbarView extends StatefulWidget {
//   const RecipeTabbarView({super.key});

//   @override
//   State<RecipeTabbarView> createState() => _RecipeTabbarViewState();
// }

// class _RecipeTabbarViewState extends State<RecipeTabbarView> {
  
//   RecipeIngreController recipeIngreController = Get.put(RecipeIngreController());
//   bool editChip = false;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final List<String> _textList = [];
//   final TextEditingController _textController = TextEditingController();

//   bool textFieldVisibile = false;
//   // XFile? file;

//   bool isSwitched = false;
//   // File? _image;
//   bool isVideo = false;

//   File? galleryFile;
//   final ImagePicker _picker = ImagePicker();

//   final picker = ImagePicker();
//   // late VideoPlayerController _videoPlayerController;
//   @override
//   void dispose() {
//     super.dispose();
//     // _videoPlayerController.dispose();
//   }

//   // late VideoPlayerController _controller;

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   videoController = VideoPlayerController.asset(galleryFile!.path)
//   //     ..addListener(() => setState(() {}))
//   //     ..setLooping(true)
//   //     ..initialize().then((_) => videoController.play());
//   // }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   videoController.dispose();
//   // }

//   Future getImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       // final imagePermanent = await saveFilePermanently(image.path);

//       // setState(() {
//       //   // this._image
//       //   recipeIngreController.image = imageTemporary;
//       // });
//       recipeIngreController.changeImageFile(imageTemporary);
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<File> saveFilePermanently(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     return File(imagePath).copy(imagePath);
//   }

//   builduploadprofile(bool uploadVideo) {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.r),
//           topRight: Radius.circular(30.r),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           height: 100.h,
//           margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         if (uploadVideo) {
//                           _onImageButtonPressed(ImageSource.camera);
//                           Get.back();
//                         } else {
//                           getImage(ImageSource.camera);
//                           Get.back();
//                         }
//                         // getImage(ImageSource.camera);
//                         // Get.back();
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.camera,
//                             size: 30.sp,
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Text(
//                             'Camera',
//                             style: TextStyle(fontSize: 15.sp),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if (uploadVideo) {
//                           _onImageButtonPressed(ImageSource.gallery);
//                           Get.back();
//                         } else {
//                           getImage(ImageSource.gallery);
//                           Get.back();
//                         }
//                         // getImage(ImageSource.gallery);
//                         // Get.back();
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.image,
//                             size: 30.sp,
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Text(
//                             'Gallery',
//                             style: TextStyle(fontSize: 15.sp),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               sizedBoxHeight(22.5.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Upload A New Recipe",
//                     style: TextStyle(
//                         fontFamily: "Studio Pro",
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold,
//                         color: const Color.fromRGBO(84, 89, 95, 1)),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(20.h),
//               GetBuilder<RecipeIngreController>(builder: (context){
//                 return recipeIngreController.file == null
//                   ? SizedBox(
//                       height: 50.h,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           elevation: 0,
//                           // ignore: deprecated_member_use
//                           primary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             side: const BorderSide(color: Color(0xff707070)),
//                             borderRadius: BorderRadius.circular(8.r),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                                 "assets/svg/add-media-svgrepo-com.svg"),
//                             SizedBox(
//                               width: 7.42.w,
//                             ),
//                             Text(
//                               "Upload Video",
//                               style: TextStyle(
//                                 fontFamily: "Studio Pro",
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 18.spMin,
//                                 color: const Color(0xFF3E3D3D),
//                               ),
//                             ),
//                           ],
//                         ),
//                         onPressed: () {
//                           // isVideo = true;
//                           // _onImageButtonPressed(ImageSource.gallery);
//                           builduploadprofile(true);

//                           // _showPicker(context: context);
//                         },
//                       ),
//                     )
//                   : Row(
//                       children: [
//                         Expanded(
//                           child: SizedBox(
//                             height: 50.h,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 0,
//                                 // ignore: deprecated_member_use
//                                 primary: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   side: const BorderSide(
//                                       color: Color(0xff707070)),
//                                   borderRadius: BorderRadius.circular(8.r),
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.play_arrow,
//                                     size: 25.h,
//                                     color: const Color(0xFF3E3D3D),
//                                   ),
//                                   // SvgPicture.asset(
//                                   //     "assets/svg/add-media-svgrepo-com.svg"),
//                                   SizedBox(
//                                     width: 7.42.w,
//                                   ),
//                                   Text(
//                                     "Preview",
//                                     style: TextStyle(
//                                       fontFamily: "Studio Pro",
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18.spMin,
//                                       color: const Color(0xFF3E3D3D),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               onPressed: () {
//                                 //Get.to(FilePlayerWidget(file: file));
//                                 Get.toNamed("/FilePlayerWidget",
//                                   arguments: recipeIngreController.file
//                                 );
//                                 // Get.to))
//                                 // isVideo = true;
//                                 // _onImageButtonPressed(ImageSource.gallery);
//                                 // builduploadprofile(true);

//                                 // _showPicker(context: context);
//                               },
//                             ),
//                           ),
//                         ),
//                         sizedBoxWidth(10.w),
//                         Expanded(
//                           child: SizedBox(
//                             height: 50.h,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 0,
//                                 // ignore: deprecated_member_use
//                                 primary: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   side: const BorderSide(
//                                       color: Color(0xff707070)),
//                                   borderRadius: BorderRadius.circular(8.r),
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.delete,
//                                     size: 22.h,
//                                     color: const Color(0xFF3E3D3D),
//                                   ),
//                                   // SvgPicture.asset(
//                                   //     "assets/svg/add-media-svgrepo-com.svg"),
//                                   SizedBox(
//                                     width: 7.42.w,
//                                   ),
//                                   Text(
//                                     "Delete",
//                                     style: TextStyle(
//                                       fontFamily: "Studio Pro",
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18.spMin,
//                                       color: const Color(0xFF3E3D3D),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               onPressed: () {
//                                 recipeIngreController.changeVideoFile(null);
//                                 // recipeIngreController.file = null;
//                                 // setState(() {});
//                                 // isVideo = true;
//                                 // _onImageButtonPressed(ImageSource.gallery);
//                                 // builduploadprofile(true);

//                                 // _showPicker(context: context);
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
              
//                 // return SizedBox();
//               }),
              
//               // Column(
//               //     children: [
//               //       Center(child: Text(galleryFile!.path)),
//               //       SizedBox(
//               //         height: 200,
//               //         child: VideoPlayer(_videoPlayerController),
//               //       ),
//               //       // video should display here
//               //     ],
//               //   ),
//               sizedBoxHeight(20.h),
//               Container(
//                 height: 200.h,
//                 width: double.infinity,
//                 decoration: ShapeDecoration(
//                   color: const Color.fromRGBO(242, 242, 242, 1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14.r),
//                     side:
//                         BorderSide(color: const Color(0xFF979797), width: 1.w),
//                   ),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     builduploadprofile(false);
//                   },
//                   child: GetBuilder<RecipeIngreController>(builder: (context){
//                     return Container(
//                       child: recipeIngreController.image != null
//                           ? Image.file(
//                               recipeIngreController.image!,
//                               width: 150.w,
//                               height: 150.h,
//                               fit: BoxFit.cover,
//                             )
//                           : Column(
//                               children: [
//                                 sizedBoxHeight(30.h),
//                                 SvgPicture.asset(
//                                   "assets/svg/upload-filled-svgrepo-com.svg",
//                                   height: 47.h,
//                                 ),
//                                 sizedBoxHeight(11.h),
//                                 Text(
//                                   "Add Cover Image",
//                                   style: TextStyle(
//                                     fontFamily: "Studio Pro",
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 18.spMin,
//                                     color: const Color(0xFF3E3D3D),
//                                   ),
//                                 ),
//                                 sizedBoxHeight(7.h),
//                                 Text(
//                                   "Add a high quality and perfect image of \nyour food to inspire others.",
//                                   style: TextStyle(
//                                       fontFamily: "Roboto",
//                                       fontSize: 12.spMin,
//                                       color: const Color(0xFF979797)),
//                                   textAlign: TextAlign.center,
//                                 )
//                               ],
//                             ),
//                     );
//                   }),
//                   // Container(
//                   //   child: recipeIngreController.image != null
//                   //       ? Image.file(
//                   //           recipeIngreController.image!,
//                   //           width: 150.w,
//                   //           height: 150.h,
//                   //           fit: BoxFit.cover,
//                   //         )
//                   //       : Column(
//                   //           children: [
//                   //             sizedBoxHeight(30.h),
//                   //             SvgPicture.asset(
//                   //               "assets/svg/upload-filled-svgrepo-com.svg",
//                   //               height: 47.h,
//                   //             ),
//                   //             sizedBoxHeight(11.h),
//                   //             Text(
//                   //               "Add Cover Image",
//                   //               style: TextStyle(
//                   //                 fontFamily: "Studio Pro",
//                   //                 fontWeight: FontWeight.w500,
//                   //                 fontSize: 18.spMin,
//                   //                 color: const Color(0xFF3E3D3D),
//                   //               ),
//                   //             ),
//                   //             sizedBoxHeight(7.h),
//                   //             Text(
//                   //               "Add a high quality and perfect image of \nyour food to inspire others.",
//                   //               style: TextStyle(
//                   //                   fontFamily: "Roboto",
//                   //                   fontSize: 12.spMin,
//                   //                   color: const Color(0xFF979797)),
//                   //               textAlign: TextAlign.center,
//                   //             )
//                   //           ],
//                   //         ),
//                   // ),
//                 ),
//               ),
//               sizedBoxHeight(20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Name Your Recipe",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(13.h),
//               SizedBox(
//                 height: 50.h,
//                 child: TextFormField(
//                   // controller: ,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xff707070)),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFF707070)),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     hintText: "Recipe's name",
//                     hintStyle: TextStyle(
//                         fontFamily: "Roboto",
//                         color: const Color(0xff54595f),
//                         fontSize: 17.h),
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Description",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(13.h),
//               SizedBox(
//                 height: 112.h,
//                 child: TextFormField(
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xff707070)),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFF707070)),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     hintText: "Describe your recipe!",
//                     hintStyle: TextStyle(
//                         fontFamily: "Roboto",
//                         color: const Color(0xff54595f),
//                         fontSize: 17.h),
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Add Tags",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(8.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Add tags to make your post easy to find!",
//                     style: TextStyle(fontFamily: "Roboto", fontSize: 14.sp),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(18.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Wrap(
//                     spacing: 11.w,
//                     runSpacing: 7.h,
//                     children: [
//                       ..._textList
//                           .map((text) => Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   CommonChip(text: text),
//                                   Visibility(
//                                     visible: editChip,
//                                     child: Row(
//                                       children: [
//                                         sizedBoxWidth(3.w),
//                                         InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               _textList.remove(text);
//                                             });
//                                           },
//                                           child: const Icon(
//                                             Icons.cancel,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ))
//                           .toList(),
//                     ],
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(18.h),
//               Visibility(
//                 visible: !textFieldVisibile,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           textFieldVisibile = true;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12.sp),
//                           color: AppColors.buttonGrey54595F,
//                         ),
//                         height: 27.h,
//                         width: 70.w,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             sizedBoxWidth(6.w),
//                             SvgPicture.asset(
//                               "assets/svg/add-circle-svgrepo-com.svg",
//                               // height: 15.h,
//                               // width: 15.w,
//                             ),
//                             Text(
//                               "  Custom",
//                               style: TextStyle(
//                                   color: const Color(0xffffffff),
//                                   fontFamily: "Studio Pro",
//                                   fontSize: 10.sp),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                         onTap: () {
//                           setState(() {
//                             editChip = !editChip;
//                           });
//                         },
//                         child: Icon(
//                           Icons.edit,
//                           color: editChip
//                               ? const Color(0xFFE1E1E1)
//                               : const Color.fromRGBO(84, 89, 95, 1),
//                         ))
//                   ],
//                 ),
//               ),
//               Visibility(
//                 visible: textFieldVisibile,
//                 child: Form(
//                   key: _formKey,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width / 2 - 10.w,
//                         child: TextFormField(
//                           maxLength: 20,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Text';
//                             } else if (value.length < 2) {
//                               return 'Please enter atleast 2 characters';
//                             }
//                             return null;
//                           },
//                           autofocus: true,
//                           textAlignVertical: TextAlignVertical.center,
//                           style: TextStyle(
//                             fontSize: 10.sp,
//                           ),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             suffixIconConstraints: const BoxConstraints(),
//                             contentPadding: EdgeInsets.all(17.h),
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: InputBorder.none,
//                             hintStyle: TextStyle(
//                                 color: const Color(0xff54595f),
//                                 fontSize: 10.sp,
//                                 fontFamily: "Roboto"),
//                             hintText: 'Enter text here',
//                           ),
//                           cursorColor: const Color(0xFF3B3F43),
//                           onFieldSubmitted: (String value) {
//                             setState(() {
//                               final FormState? form = _formKey.currentState;
//                               if (form != null && form.validate()) {
//                                 // form.save();
//                                 textFieldVisibile = !textFieldVisibile;
//                                 _textController.clear();
//                                 _textList.add(value);
//                               }
//                             });
//                           },
//                           controller: _textController,
//                         ),
//                       ),
//                       ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 const Color(0xff54595f)),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               textFieldVisibile = !textFieldVisibile;
//                             });
//                           },
//                           child: const Text('Cancel'))
//                     ],
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Select Tags",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(13.h),
//               Wrap(
//                 spacing: 11.w,
//                 runSpacing: 7.h,
//                 children: [
//                   const CommonChip(text: "Savoury moments"),
//                   const CommonChip(text: "Quarter to quick"),
//                   const CommonChip(text: "Juicy Mondays"),
//                   const CommonChip(text: "The healthy way"),
//                   const CommonChip(text: "Fry-day!!"),
//                   const CommonChip(text: "Simple greens"),
//                   const CommonChip(text: "Flavour explosions"),
//                   const CommonChip(text: "The healthy way"),
//                   SizedBox(
//                     height: 18.h,
//                     width: double.infinity,
//                   ),
//                   Text(
//                     "South Africa Cuisine",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                     width: double.infinity,
//                   ),
//                   const CommonChip(text: "Limpopo"),
//                   const CommonChip(text: "Easy"),
//                   const CommonChip(text: "Food"),
//                   const CommonChip(text: "Carrot"),
//                   const CommonChip(text: "Quick"),
//                   const CommonChip(text: "Yoghurt"),
//                   const CommonChip(text: "Breakfast"),
//                   const CommonChip(text: "Quick"),
//                   const CommonChip(text: "Yoghurt"),
//                   SizedBox(
//                     height: 13.h,
//                     width: double.infinity,
//                   ),
//                   Text(
//                     "International Cuisine",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                     width: double.infinity,
//                   ),
//                   const CommonChip(text: "Limpopo"),
//                   const CommonChip(text: "Easy"),
//                   const CommonChip(text: "Food"),
//                   const CommonChip(text: "Carrot"),
//                   const CommonChip(text: "Quick"),
//                   SizedBox(
//                     height: 6.h,
//                   ),
//                   const CommonChip(text: "Yoghurt"),
//                   const CommonChip(text: "Breakfast"),
//                   const CommonChip(text: "Quick"),
//                   const CommonChip(text: "Yoghurt"),
//                   SizedBox(
//                     height: 13.h,
//                     width: double.infinity,
//                   ),
//                   Text(
//                     "Select Difficulty",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.sp,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6.h,
//                     width: double.infinity,
//                   ),
//                   const CommonChip(text: "Easy"),
//                   const CommonChip(text: "Medium"),
//                   const CommonChip(text: "Hard"),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       tabController!.animateTo(1);
//                     },
//                     child: Text(
//                       "Next",
//                       style: TextStyle(
//                         fontFamily: "Studio Pro",
//                         decoration: TextDecoration.underline,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18.sp,
//                         color: const Color(0xFF3E3D3D),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(10.h)
//             ],
//           ),
//         ),
//       ),
  
//     );
//   }

//   Future<void> _onImageButtonPressed(ImageSource source,
//       {BuildContext? context, bool isMultiImage = false}) async {
//     // if (_controller != null) {
//     //   await _controller!.setVolume(0.0);
//     // }
//     // if (isVideo) {
//     XFile? file = await _picker.pickVideo(
//         source: source, maxDuration: const Duration(seconds: 10));
//     recipeIngreController.changeVideoFile(file);
//     // setState(() {});

//     // await _playVideo(file);
//     // Get.to(()=> FilePlayerWidget(file: file));
//     // FilePlayerWidget(file: file);
//     // }
//   }

//   // Future<void> _disposeVideoController() async {
//   //   if (_toBeDisposed != null) {
//   //     await _toBeDisposed!.dispose();
//   //   }
//   //   _toBeDisposed = _controller;
//   //   _controller = null;
//   // }

//   // Future<void> _playVideo(XFile? file) async {
//   //   if (file != null && mounted) {
//   //     await _disposeVideoController();
//   //     late VideoPlayerController controller;
//   //     if (kIsWeb) {
//   //       controller = VideoPlayerController.network(file.path);
//   //     } else {
//   //       controller = VideoPlayerController.file(File(file.path));
//   //     }
//   //     _controller = controller;
//   //     // In web, most browsers won't honor a programmatic call to .play
//   //     // if the video has a sound track (and is not muted).
//   //     // Mute the video so it auto-plays in web!
//   //     // This is not needed if the call to .play is the result of user
//   //     // interaction (clicking on a "play" button, for example).
//   //     const double volume = kIsWeb ? 0.0 : 1.0;
//   //     await controller.setVolume(volume);
//   //     await controller.initialize();
//   //     await controller.setLooping(true);
//   //     await controller.play();
//   //     setState(() {});
//   //   }
//   // }

//   void _showPicker({
//     required BuildContext context,
//   }) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.r),
//           topRight: Radius.circular(30.r),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           height: 100.h,
//           margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // getVideo(ImageSource.camera);
//                         Get.back();
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.camera,
//                             size: 30.sp,
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Text(
//                             'Camera',
//                             style: TextStyle(fontSize: 15.sp),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // getVideo(ImageSource.gallery);
//                         Get.back();
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.image,
//                             size: 30.sp,
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Text(
//                             'Gallery',
//                             style: TextStyle(fontSize: 15.sp),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Future getVideo(
//   //   ImageSource vid,
//   // ) async {
//   //   final pickedFile = await picker.pickVideo(
//   //       source: vid,
//   //       preferredCameraDevice: CameraDevice.front,
//   //       maxDuration: const Duration(minutes: 20));
//   //   XFile? xfilePick = pickedFile;
//   //   setState(
//   //     () {
//   //       if (xfilePick != null) {
//   //         galleryFile = File(pickedFile!.path);
//   //         _videoPlayerController = VideoPlayerController.file(galleryFile!);
//   //         _videoPlayerController.initialize();
//   //       } else {
//   //         ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
//   //             const SnackBar(content: Text('Nothing is selected')));
//   //       }
//   //     },
//   //   );
//   // }
// }
