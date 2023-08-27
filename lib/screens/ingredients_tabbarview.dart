// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodspeciality/common%20files/sized_box.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// class IngredientsTabbatview extends StatefulWidget {
//   const IngredientsTabbatview({super.key});

//   @override
//   State<IngredientsTabbatview> createState() => _IngredientsTabbatviewState();
// }

// class _IngredientsTabbatviewState extends State<IngredientsTabbatview> {
//   List<Widget> widgetsInColumn = [];
//   List<Widget> stepsInColumn = [];
//   final List<TextEditingController> _controllers = [];
//   final List<TextEditingController> _controllersTbs = [];
//   final List<TextEditingController> _controllers2 = [];

//   int number = 2;
//   int textControllerNumber = 0;
//   final TextEditingController _tec = TextEditingController();
//   int servigCount = 0;
//   late int _selectedHour;
//   late int _selectedMinute;
//   final TextEditingController _tbsController = TextEditingController(text: '1');
//   List<int> tbsint = [];
//   bool isSwitched = false;
//   File? _image;

//   Future getImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;

//       final imageTemporary = File(image.path);
//       // final imagePermanent = await saveFilePermanently(image.path);

//       setState(() {
//         this._image = imageTemporary;

//         // Get.snackbar("vng", "ggh");
//       });
//       if (_image != null) {
//         //  ScaffoldMessenger(child: SnackBar(content: Text("data")));
//         Get.snackbar(
//           "Successful",
//           "Image Added",
//         );
//         print("object");
//       }
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<File> saveFilePermanently(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     return File(imagePath).copy(imagePath);
//   }

//   builduploadprofile() {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           height: 100,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
//                         getImage(ImageSource.camera);
//                         Get.back();
//                         print("dsf");
//                         if (_image != null) {
//                           Get.snackbar("title", "message");
//                         }
//                         // Get.snackbar(title, message)
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.camera,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Camera',
//                             style: TextStyle(fontSize: 15),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         getImage(ImageSource.gallery);
//                         Get.back();
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.image,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Gallery',
//                             style: TextStyle(fontSize: 15),
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
//   void initState() {
//     _controllers.add(TextEditingController());
//     //_controllers2.add(TextEditingController());

//     super.initState();
//     _selectedHour = 0;
//     _selectedMinute = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               sizedBoxHeight(22.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Recipe Details",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.sp,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(15.h),
//               Container(
//                 height: 101.h,
//                 decoration: ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: Color(0xff707070)),
//                       borderRadius: BorderRadius.circular(8.r)),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // sizedBoxWidth(14.w),
//                       SvgPicture.asset("assets/svg/Group 58248.svg"),
//                       sizedBoxWidth(15.w),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Cooking Time",
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 fontFamily: "Roboto",
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           Wrap(
//                             children: [
//                               Text(
//                                 "How long does it take \nto make this recipe?",
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                     fontFamily: "Roboto",
//                                     color: const Color(0xff979797),
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           Get.bottomSheet(_timeForServing());
//                         },
//                         child: Container(
//                             decoration: ShapeDecoration(
//                               shape: RoundedRectangleBorder(
//                                   side: const BorderSide(
//                                       color: Color(0xff707070)),
//                                   borderRadius: BorderRadius.circular(8.r)),
//                             ),
//                             height: 45.h,
//                             width: 116.w,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "$_selectedHour Hr $_selectedMinute Min",
//                                   style: TextStyle(
//                                       fontFamily: "Roboto", fontSize: 20.sp),
//                                 ),
//                                 sizedBoxWidth(1.w),
//                               ],
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(15.h),
//               Container(
//                 height: 101.h,
//                 decoration: ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: Color(0xff707070)),
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       //  sizedBoxWidth(14.w),
//                       SvgPicture.asset("assets/svg/Group 58247.svg"),
//                       sizedBoxWidth(15.w),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Servings",
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 fontFamily: "Roboto",
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           Text(
//                             "How many people does \nthis recipe serve?",
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 color: const Color(0xff979797),
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           Get.bottomSheet(_servings());
//                         },
//                         child: Container(
//                           decoration: ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                                 side:
//                                     const BorderSide(color: Color(0xff707070)),
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                           height: 45.h,
//                           width: 116.w,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 " $servigCount Serving",
//                                 style: const TextStyle(
//                                     fontSize: 20, fontFamily: "Roboto"),
//                               ),
//                               sizedBoxWidth(1),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               sizedBoxHeight(20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Recipe Details",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(15.h),

//               //_recipeDetails(_tec, _tbsController),
//               ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: widgetsInColumn.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return _recipeDetails(_tec, _tbsController, index);
//                   }),
//               sizedBoxHeight(13.h),
//               SizedBox(
//                 height: 40.h,
//                 width: 150.w,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     elevation: 0,
//                     // ignore: deprecated_member_use
//                     primary: const Color.fromRGBO(84, 89, 95, 1),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide.none,
//                       borderRadius: BorderRadius.circular(8.h),
//                     ),
//                   ),
//                   child: Text(
//                     "+ Ingredient",
//                     style: TextStyle(
//                       fontFamily: "Roboto",
//                       color: Colors.white,
//                       fontSize: 16.sp,
//                     ),
//                   ),
//                   onPressed: () async {
//                     print(textControllerNumber);
//                     if (textControllerNumber < 5) {
//                       // await textControllerNumber++;
//                       _controllers.add(TextEditingController());
//                       _controllersTbs.add(TextEditingController());
//                       _controllers2.add(TextEditingController());
//                       _controllers2[textControllerNumber].text = "1";
//                       textControllerNumber++;

//                       print("bvg");

//                       // if (_tec.text.isEmpty) {
//                       //   return;
//                       // } else {
//                       //   setState(() {
//                       //     widgetsInColumn.add(_recipeDetails(null));
//                       //   });
//                       // }
//                       setState(() {
//                         widgetsInColumn.add(_recipeDetails(null, null, 0));
//                       });
//                     }
//                   },
//                 ),
//               ),
//               sizedBoxHeight(20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Instructions",
//                     style: TextStyle(
//                       fontFamily: "Studio Pro",
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18.spMin,
//                       color: const Color(0xFF3E3D3D),
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxHeight(20.h),
//               _instructionSteps(1),
//               Column(
//                 children: stepsInColumn,
//               ),
//               sizedBoxHeight(14.h),
//               SizedBox(
//                 height: 40.h,
//                 width: 150.w,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     elevation: 0,
//                     // ignore: deprecated_member_use
//                     primary: const Color.fromRGBO(84, 89, 95, 1),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide.none,
//                       borderRadius: BorderRadius.circular(8.h),
//                     ),
//                   ),
//                   child: Text(
//                     "+ Instructions",
//                     style: TextStyle(
//                       fontFamily: "Roboto",
//                       color: Colors.white,
//                       fontSize: 16.sp,
//                     ),
//                   ),
//                   onPressed: () {
//                     if (number < 5) {
//                       setState(() {
//                         stepsInColumn.add(_instructionSteps(null));
//                         number++;
//                       });
//                     }
//                   },
//                 ),
//               ),
//               sizedBoxHeight(25)
//             ],
//           ),
//         ),
//       ),
    
//     );
//   }

//   Widget _recipeDetails(TextEditingController? controller,
//       TextEditingController? controllerTbs, int? index) {
//     if (controllerTbs == null) {
//       _controllersTbs[(textControllerNumber - 1)].text = "1";
//     }
//     int _tbsInitialValue = 0;
//     return Column(
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               height: 45.h,
//               width: 155.w,
//               child: TextFormField(
//                 validator: (value) {
//                   if (_tec.text.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//                 controller: _controllers[index!],
//                 decoration: InputDecoration(
//                   isCollapsed: true,
//                   contentPadding: EdgeInsets.all(15.h),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Color(0xff707070)),
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Color(0xFF707070)),
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                   hintText: "Ex. Salt",
//                   hintStyle: TextStyle(
//                       fontFamily: "Roboto",
//                       color: const Color(0xff54595f),
//                       fontSize: 17.h),
//                 ),
//               ),
//             ),
//             sizedBoxWidth(33.w),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (tbsint[index] > 1) {
//                     tbsint[index] = int.parse(_controllers2[index].text);
//                     tbsint[index]--;
//                     _controllers2[index].text = '${tbsint[index]}';
//                   }
//                   // _tbsInitialValue == 1 ? null : _tbsInitialValue--;
//                   // _tbsController.text = '$_tbsInitialValue';

//                   // tbsint[index] = int.parse(_controllers2[index].text);
//                   // tbsint[index]--;
//                   // _controllers2[index].text = '${tbsint[index]}';
//                 });
//               },
//               child: CircleAvatar(
//                 radius: 16.r,
//                 backgroundColor: const Color(0xffE1E1E1),
//                 child: const Text(
//                   "-",
//                   style: TextStyle(
//                       fontFamily: "Roboto",
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20),
//                 ),
//               ),
//             ),
//             sizedBoxWidth(10.w),
//             SizedBox(
//               height: 45.h,
//               width: 124.w,
//               child: TextFormField(
//                 controller: _controllers2[index],

//                 // initialValue: '$_tbsInitialValue',
//                 keyboardType: TextInputType.number,
//                 maxLength: 2,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                     isCollapsed: true,
//                     contentPadding: EdgeInsets.all(15.h),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xff707070)),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFF707070)),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     hintText: "Ex. 1 TBS",
//                     hintStyle: TextStyle(
//                         fontFamily: "Roboto",
//                         color: const Color(0xff54595f),
//                         fontSize: 17.h),
//                     counterText: ''),
//               ),
//             ),
//             sizedBoxWidth(10.w),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   int increment = 0;

//                   for (var i = 0; i < widgetsInColumn.length; i++) {
//                     tbsint.add(increment);
//                   }
//                   tbsint[index] = int.parse(_controllers2[index].text);
//                   tbsint[index]++;

//                   // _tbsInitialValue == 99 ? null : _tbsInitialValue++;

//                   // _tbsController.text = '$_tbsInitialValue';
//                   _controllers2[index].text = '${tbsint[index]}';
//                 });
//               },
//               child: CircleAvatar(
//                 radius: 16.r,
//                 backgroundColor: const Color(0xffE1E1E1),
//                 child: const Text(
//                   "+",
//                   style: TextStyle(
//                       fontFamily: "Roboto",
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20),
//                 ),
//               ),
//             )
//           ],
//         ),
//         sizedBoxHeight(13.h),
//       ],
//     );
//   }

//   Widget _instructionSteps(int? stepNum) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               stepNum == null ? "Step $number" : 'Step 1',
//               style: TextStyle(
//                   fontFamily: "Roboto",
//                   fontSize: 17.sp,
//                   color: const Color(0XFF6B6B6B)),
//               // color: AppColors.),
//             ),
//           ],
//         ),
//         sizedBoxHeight(12.h),
//         SizedBox(
//           height: 68.h,
//           child: TextFormField(
//             maxLines: 2,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.only(top: 8, left: 12),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xff707070)),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xFF707070)),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               hintText: "Write your step of recipe here",
//               hintStyle: TextStyle(
//                   fontFamily: "Roboto",
//                   color: const Color(0xff6B6B6B),
//                   fontSize: 14.h),
//               suffixIcon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                 child: Container(
//                   height: 50.h,
//                   width: 40.w,
//                   child: _image != null
//                       ? Image.asset("assets/camera.png")
//                       : GestureDetector(
//                           onTap: () {
//                             builduploadprofile();
//                           },
//                           child: Image.asset("assets/camera.png"),
//                         ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         sizedBoxHeight(15.h),
//       ],
//     );
//   }

//   Widget _servings() {
//     return BottomSheet(
//       builder: (context) {
//         return SizedBox(
//           height: 200.0,
//           child: CupertinoPicker(
//             itemExtent: 32.0,
//             onSelectedItemChanged: (int value) {
//               setState(() {
//                 servigCount = value;
//               });
//             },
//             children: List<Widget>.generate(100, (int index) {
//               return Center(
//                 child: Text(
//                   '$index',
//                   style: const TextStyle(fontSize: 20, fontFamily: "Roboto"),
//                 ),
//               );
//             }),
//           ),
//         );
//       },
//       onClosing: () {
//         Get.back();
//       },
//     );
//   }

//   Widget _timeForServing() {
//     return BottomSheet(
//       builder: (context) {
//         return Column(
//           children: [
//             sizedBoxHeight(10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: const [
//                 Text(
//                   'Hours',
//                   style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
//                 ),
//                 SizedBox(),
//                 Text(
//                   "Minutes",
//                   style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   height: 200.0,
//                   width: MediaQuery.of(context).size.width / 2,
//                   child: CupertinoPicker(
//                     itemExtent: 32.0,
//                     onSelectedItemChanged: (int index) {
//                       setState(() {
//                         _selectedHour = index;
//                       });
//                     },
//                     children: List<Widget>.generate(24, (int index) {
//                       return Center(
//                         child: Text(
//                           '$index ',
//                           style: const TextStyle(
//                               fontSize: 20, fontFamily: "Roboto"),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 200.0,
//                   width: MediaQuery.of(context).size.width / 2,
//                   child: CupertinoPicker(
//                     itemExtent: 32.0,
//                     onSelectedItemChanged: (int index) {
//                       setState(() {
//                         _selectedMinute = index;
//                       });
//                     },
//                     children: List<Widget>.generate(60, (int index) {
//                       return Center(
//                         child: Text(
//                           '$index ',
//                           style: const TextStyle(
//                               fontSize: 20, fontFamily: "Roboto"),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 // Text('data')
//               ],
//             ),
//           ],
//         );
//       },
//       onClosing: () {
//         Get.back();
//       },
//     );
//   }

// }
