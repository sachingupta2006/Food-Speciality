// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';

// builduploadprofile(bool uploadVideo, BuildContext context) {
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

//   Future<void> _onImageButtonPressed(ImageSource source,
//       {BuildContext? context, bool isMultiImage = false}) async {
//     // if (_controller != null) {
//     //   await _controller!.setVolume(0.0);
//     // }
//     // if (isVideo) {
//     file = await _picker.pickVideo(
//         source: source, maxDuration: const Duration(seconds: 10));
//     setState(() {});
//     // await _playVideo(file);
//     // Get.to(()=> FilePlayerWidget(file: file));
//     // FilePlayerWidget(file: file);
//     // }
//   }
