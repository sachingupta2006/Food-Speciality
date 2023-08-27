// import 'dart:html';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/constants/base_manager.dart';
import 'package:foodspeciality/controllers/recipe_ingre_controller.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
import 'package:foodspeciality/screens/preview.dart';
import 'package:foodspeciality/services/recipe_service.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../common files/common_sucess_dailog.dart';
import '../common files/sized_box.dart';
// import 'common_chip.dart';
// import 'dropdownList.dart';
// import 'menuButton.dart';se

// int currentIndex = 0;
enum SampleItem { itemOne, itemTwo, itemThree }

TabController? tabController;

class RecipeIng extends StatefulWidget {
  const RecipeIng({super.key});

  @override
  State<RecipeIng> createState() => _RecipeIngState();
}

class _RecipeIngState extends State<RecipeIng>
    with SingleTickerProviderStateMixin {
  // bool? _visible = false;
  // TabController? tabController;

  HomeController controllerHome = HomeController();
  // int currentIndex = 0;
  SampleItem? selectedMenu;

  RecipeIngreController recipeIngreController =
      Get.put(RecipeIngreController());
  final ImagePicker _picker = ImagePicker();
  final List _textList = [];
  GlobalKey _popupMenuKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool editChip = false;
  bool textFieldVisibile = false;
  final TextEditingController _textController = TextEditingController();
  late int _selectedHour;
  late int _selectedMinute;
  int servigCount = 0;
  List<Widget> widgetsInColumn = [];
  final List<TextEditingController> _controllersTbs = [];
  int textControllerNumber = 0;
  final TextEditingController _tec = TextEditingController();
  final List<TextEditingController> _controllers = [];
  // final List<GlobalKey> popKeys = [];
  List<double> tbsint = [];
  final List<TextEditingController> _controllers2 = [];
  final List<TextEditingController> tecInstructionList = [];
  // File? _image;
  final List<File?> imageInstructionList = [];

  // int number = 2;
  File? _image;
  final TextEditingController _tbsController = TextEditingController(text: '1');
  List<Widget> stepsInColumn = [];
  final TextEditingController tecRecipeName = TextEditingController();
  final TextEditingController tecDescription = TextEditingController();
  var difficultyIndex = 4.obs;
  String? selectedDifficultyText;
  final List<String> items = [
    'cup',
    'fl oz',
    'oz',
    'tsp',
    'tbsp',
  ];
  String? selectedValue;
  final List<String?> dropdownData = [];

  List difficultyList = ["Easy", "Medium", "Hard"];
  // List<String> units = [];
  List ingredients = [];
  List instructions = [];
  List instructionsImages = [];
  String? publish_status_value;
  List selectTags = [
    {"text": "Quarter to quick", "colorBool": true},
    {"text": "Juicy Mondays", "colorBool": true},
    {"text": "The healthy way", "colorBool": true},
    {"text": "Fry-day!!", "colorBool": true},
    {"text": "Simple greens", "colorBool": true},
    {"text": "Flavour explosions", "colorBool": true},
    {"text": "The healthy way", "colorBool": true},
  ];

  List southAfricaCuisine = [
    {"text": "Limpopo", "colorBool": true},
    {"text": "Easy", "colorBool": true},
    {"text": "Food", "colorBool": true},
    {"text": "Carrot", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
    {"text": "Breakfast", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
  ];

  List internationalCuisine = [
    {"text": "Limpopo", "colorBool": true},
    {"text": "Easy", "colorBool": true},
    {"text": "Food", "colorBool": true},
    {"text": "Carrot", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
    {"text": "Breakfast", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
  ];

  var _newFormKey = GlobalKey<FormState>();

  var challengeId;

  @override
  void initState() {
    super.initState();
    challengeId = Get.arguments ?? null;
    print("challengeId $challengeId");

    _controllers.add(TextEditingController());
    //_controllers2.add(TextEditingController());

    // super.initState();
    _selectedHour = 0;
    _selectedMinute = 0;
    // tabController = TabController(length: 2, vsync: this);

    // to add first ingredient
    _controllers.add(TextEditingController());
    _controllersTbs.add(TextEditingController());
    _controllers2.add(TextEditingController());
    _controllers2[textControllerNumber].text = "1";
    dropdownData.add("cup");
    textControllerNumber++;
    // widgetsInColumn.add(_recipeDetails(null, null, 0));

    // /

    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      setState(() {
        switch (tabController!.index) {
          case 0:
            // controllerHome.currentIndex = 0;
            controllerHome.changeTab(0);
            break;
          case 1:
            // currentIndex = 1;
            controllerHome.changeTab(1);

            break;
          default:
        }
      });
    });
  }

  @override
  void dispose() {
    tabController!.dispose();
    // recipeIngreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widgetsInColumn.isEmpty) {
      widgetsInColumn.add(_recipeDetails(null, null, 0));
    }
    if (stepsInColumn.isEmpty) {
      tecInstructionList.add(TextEditingController());
      imageInstructionList.add(null);
      stepsInColumn.add(_instructionSteps(0));
    }
    // widgetsInColumn.add(_recipeDetails(null, null, 0));

    return DefaultTabController(
        length: 2,
        child: GetBuilder<HomeController>(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80.h,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromRGBO(59, 63, 67, 1),
              // leading: InkWell(
              //   onTap: (){
              //     Get.back();
              //   },
              //   child: Image.asset("assets/icons/back_arrow.png",
              //     height: 20.h,
              //     width: 30.w,
              //     color: AppColors.greyD3B3F43,

              //     // color: ,
              //   )
              //   // const Icon(
              //   //   Icons.arrow_back,
              //   // ),
              // ),
              title: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      "assets/icons/back_arrow.png",
                      height: 20.h,
                      width: 30.w,
                      color: AppColors.greyD3B3F43,
                      fit: BoxFit.contain,

                      // color: ,
                    )
                    // const Icon(
                    //   Icons.arrow_back,
                    // ),
                    ),
              ),
              actions: [
                Visibility(
                    visible: controllerHome.currentIndex == 0 ? false : true,
                    child: Row(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(const Preview());
                              // Get.toNamed("/Preview");
                            },
                            child: Text(
                              "Preview",
                              style: TextStyle(
                                  color: const Color(0xffABABAB),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              // final isValid = _newFormKey.currentState!.validate();
                              // if (!isValid) {
                              //   return ;
                              // }

                              publish_status_value = "published";
                              if (recipeIngreController.file == null) {
                                Get.snackbar("Error", "Select a video");
                              } else if (recipeIngreController.image == null) {
                                Get.snackbar("Error", "Select a Cover Image");
                              } else if (tecRecipeName.text.isEmpty ||
                                  tecDescription.text.isEmpty) {
                                Get.snackbar("Error",
                                    "Enter recipe name and description");
                              } else if (selectedDifficultyText == null) {
                                Get.snackbar("Error", "Select difficulty");
                              } else {
                                final isValid =
                                    _newFormKey.currentState!.validate();
                                print("isValid $isValid");
                                if (isValid) {
                                  return callAddRecipeApi();
                                }
                              }

                              // final isValid = _newFormKey.currentState!.validate();
                              // if (!isValid) {

                              //   // return callAddRecipeApi();
                              // }

                              // callAddRecipeApi();
                            },
                            child: Text(
                              "Publish",
                              style: TextStyle(
                                  color: const Color(0xff000000),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w)
                      ],
                    ))
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: TabBar(
                  controller: tabController,
                  // onTap: (value) {
                  //   if (value == 0) {
                  //     setState(() {
                  //       _visible = false;
                  //     });
                  //   } else {
                  //     setState(() {
                  //       _visible = true;
                  //     });
                  //   }
                  //   ;
                  // },
                  indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2.5.sp),
                      insets: EdgeInsets.symmetric(horizontal: 100.w)),
                  indicatorSize: TabBarIndicatorSize.label,
                  // indicatorWeight: 4,

                  indicatorColor: const Color(0xFF3B3F43),
                  unselectedLabelStyle:
                      const TextStyle(color: Color(0xFF6B6B6B)),
                  labelColor: const Color.fromRGBO(59, 63, 67, 1),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "Recipe",
                        style: TextStyle(
                            fontFamily: "Studio Pro",
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Ingredients",
                        style: TextStyle(
                            fontFamily: "Studio Pro",
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
                controller: tabController,
                children: [recipeTab(), ingredientTab()]),
          );
        }));
  }

  callAddRecipeApi() async {
    print("callAddRecipeApi");
    RecipeService recipeService = RecipeService();
    int cookingTime = _selectedHour * 60 + _selectedMinute;
    ingredients = [];
    for (var i = 0; i < dropdownData.length; i++) {
      ingredients.add({
        '"name"': '"${_controllers[i].text}"',
        '"quantity"': '"${_controllers2[i].text + " " + dropdownData[i]!}"'
      });
    }
    instructions = [];
    for (var i = 0; i < stepsInColumn.length; i++) {
      // instructions.add('"${tecInstructionList[i].text}"');
      instructions.add("${tecInstructionList[i].text}");

      // instructionsImages.add()
    }

    var resp = await recipeService.addRecipe(
        // int cookingTime = _selectedHour * 60 + _selectedMinute,
        videoPath: recipeIngreController.file!.path,
        imagePath: recipeIngreController.image!.path,
        name: tecRecipeName.text,
        description: tecDescription.text,
        difficulty: selectedDifficultyText!.toLowerCase(),
        cookingTime: cookingTime.toString(),
        serving: servigCount.toString(),
        tags: recipeIngreController.tags.toString(),
        ingredients: ingredients.toString(),
        // instructions: instructions.toString(),
        instructions: jsonEncode(instructions),
        publish_status: publish_status_value!,
        instructionsImages: imageInstructionList,
        challengeId: challengeId ?? null);

    if (resp.status == ResponseStatus.PRIVATE) {
      callAddRecipeApi();
    } else if (resp.status == ResponseStatus.SUCCESS) {
      if (challengeId != null) {
        commonSucessDailog(
            msg: "Recipe shared for challenge successfully",
            onPressed: () {
              Get.offAllNamed("/bottomBar");
            });
      } else {
        getRecipePublishSuccess();
      }
    }
  }

  getRecipePublishSuccess() {
    Get.defaultDialog(
        titleStyle: TextStyle(fontSize: 0),
        titlePadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.all(10.h),
        title: "",
        barrierDismissible: false,
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       Get.back();
                  //     },
                  //     child: Icon(Icons.close,
                  //       color: AppColors.grey54595F,
                  //       // ColorConstants.kPrimaryColor,
                  //       size: 25.h,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 30),

                  // LottieBuilder.network("https://assets3.lottiefiles.com/packages/lf20_jbrw3hcz.json",
                  //   // height: ,
                  //   height: 200.h,
                  //   width: 250.w,
                  // ),

                  LottieBuilder.asset(
                    "assets/sucess_lottie.json",
                    height: 200.h,
                    width: 250.w,
                  ),

                  Text(
                    "Congratulations",
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColors.greyD3B3F43,
                      // ColorConstants.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Recipe added successfully",
                    // HomeApiController().setMoodResponse,
                    // homeApiController.setMoodResponse.progressBar!,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.greyD3B3F43,
                    ),
                  ),

                  sizedBoxHeight(30.h),

                  SizedBox(
                    height: 50.h,
                    width: 170.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        // ignore: deprecated_member_use
                        primary: const Color(0xFF3B3F43),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF707070)),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: 'StudioProR',
                        ),
                      ),
                      onPressed: () {
                        Get.offAllNamed("/bottomBar");

                        // Get.toNamed("communityaddparticipants");
                      },
                    ),
                  ),

                  // custom

                  // TextSpan(
                  //         text: appDataController.name.value,
                  //         style: TextStyle(
                  //           fontSize: 17,
                  //           color: ColorConstants.kPrimaryColor,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       )

                  // custom

                  // const SizedBox(height: 34),
                ],
              ),
            ],
          ),
        ));
  }

  recipeTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight(22.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Upload A New Recipe",
                  style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(84, 89, 95, 1)),
                ),
              ],
            ),
            sizedBoxHeight(20.h),
            GetBuilder<RecipeIngreController>(builder: (context) {
              return recipeIngreController.file == null
                  ? SizedBox(
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          // ignore: deprecated_member_use
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xff707070)),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                "assets/svg/add-media-svgrepo-com.svg"),
                            SizedBox(
                              width: 7.42.w,
                            ),
                            Text(
                              "Upload Video",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          // isVideo = true;
                          // _onImageButtonPressed(ImageSource.gallery);
                          builduploadprofile(true);

                          // _showPicker(context: context);
                        },
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    size: 25.h,
                                    color: const Color(0xFF3E3D3D),
                                  ),
                                  // SvgPicture.asset(
                                  //     "assets/svg/add-media-svgrepo-com.svg"),
                                  SizedBox(
                                    width: 7.42.w,
                                  ),
                                  Text(
                                    "Preview",
                                    style: TextStyle(
                                      fontFamily: "Studio Pro",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.spMin,
                                      color: const Color(0xFF3E3D3D),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                //Get.to(FilePlayerWidget(file: file));
                                Get.toNamed("/FilePlayerWidget",
                                    arguments: recipeIngreController.file);
                                // Get.to))
                                // isVideo = true;
                                // _onImageButtonPressed(ImageSource.gallery);
                                // builduploadprofile(true);

                                // _showPicker(context: context);
                              },
                            ),
                          ),
                        ),
                        sizedBoxWidth(10.w),
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 22.h,
                                    color: const Color(0xFF3E3D3D),
                                  ),
                                  // SvgPicture.asset(
                                  //     "assets/svg/add-media-svgrepo-com.svg"),
                                  SizedBox(
                                    width: 7.42.w,
                                  ),
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                      fontFamily: "Studio Pro",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.spMin,
                                      color: const Color(0xFF3E3D3D),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                recipeIngreController.changeVideoFile(null);
                                // recipeIngreController.file = null;
                                // setState(() {});
                                // isVideo = true;
                                // _onImageButtonPressed(ImageSource.gallery);
                                // builduploadprofile(true);

                                // _showPicker(context: context);
                              },
                            ),
                          ),
                        ),
                      ],
                    );

              // return SizedBox();
            }),

            // Column(
            //     children: [
            //       Center(child: Text(galleryFile!.path)),
            //       SizedBox(
            //         height: 200,
            //         child: VideoPlayer(_videoPlayerController),
            //       ),
            //       // video should display here
            //     ],
            //   ),
            sizedBoxHeight(20.h),
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color.fromRGBO(242, 242, 242, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  side: BorderSide(color: const Color(0xFF979797), width: 1.w),
                ),
              ),
              child: InkWell(
                onTap: () {
                  builduploadprofile(false);
                },
                child: GetBuilder<RecipeIngreController>(builder: (context) {
                  return Container(
                    child: recipeIngreController.image != null
                        ? Image.file(
                            recipeIngreController.image!,
                            width: 150.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          )
                        : Column(
                            children: [
                              sizedBoxHeight(30.h),
                              SvgPicture.asset(
                                "assets/svg/upload-filled-svgrepo-com.svg",
                                height: 47.h,
                              ),
                              sizedBoxHeight(11.h),
                              Text(
                                "Add Cover Image",
                                style: TextStyle(
                                  fontFamily: "Studio Pro",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.spMin,
                                  color: const Color(0xFF3E3D3D),
                                ),
                              ),
                              sizedBoxHeight(7.h),
                              Text(
                                "Add a high quality and perfect image of \nyour food to inspire others.",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12.spMin,
                                    color: const Color(0xFF979797)),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                  );
                }),
                // Container(
                //   child: recipeIngreController.image != null
                //       ? Image.file(
                //           recipeIngreController.image!,
                //           width: 150.w,
                //           height: 150.h,
                //           fit: BoxFit.cover,
                //         )
                //       : Column(
                //           children: [
                //             sizedBoxHeight(30.h),
                //             SvgPicture.asset(
                //               "assets/svg/upload-filled-svgrepo-com.svg",
                //               height: 47.h,
                //             ),
                //             sizedBoxHeight(11.h),
                //             Text(
                //               "Add Cover Image",
                //               style: TextStyle(
                //                 fontFamily: "Studio Pro",
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 18.spMin,
                //                 color: const Color(0xFF3E3D3D),
                //               ),
                //             ),
                //             sizedBoxHeight(7.h),
                //             Text(
                //               "Add a high quality and perfect image of \nyour food to inspire others.",
                //               style: TextStyle(
                //                   fontFamily: "Roboto",
                //                   fontSize: 12.spMin,
                //                   color: const Color(0xFF979797)),
                //               textAlign: TextAlign.center,
                //             )
                //           ],
                //         ),
                // ),
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Name Your Recipe",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(13.h),
            SizedBox(
              // height: 50.h,
              child: TextFormField(
                controller: tecRecipeName,
                // autovalidateMode: AutovalidateMode.always,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Recipe Name';
                //   }

                //   // v2 = true;
                //   return null;
                // },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(17.h),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  hintText: "Recipe's name",
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff54595f),
                      fontSize: 17.h),
                ),
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(13.h),
            SizedBox(
              height: 112.h,
              child: TextFormField(
                controller: tecDescription,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Description';
                //   }

                //   // v2 = true;
                //   return null;
                // },
                maxLines: 5,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  hintText: "Describe your recipe!",
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff54595f),
                      fontSize: 17.h),
                ),
              ),
            ),
            sizedBoxHeight(20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add Tags",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add tags to make your post easy to find!",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 14.sp),
                ),
              ],
            ),
            sizedBoxHeight(18.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Wrap(
            //       spacing: 11.w,
            //       runSpacing: 7.h,
            //       children:
            //       [
            //         ..._textList
            //             .map((text) => Row(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     CommonChip(text: text),
            //                     // CommonChip(
            //                     //   text: _textList[index]["text"],
            //                     //   colorchange: _textList[index]["colorBool"],
            //                     //   index: index,
            //                     //   listName: "_textList"
            //                     // ),
            //                     Visibility(
            //                       visible: editChip,
            //                       child: Row(
            //                         children: [
            //                           sizedBoxWidth(3.w),
            //                           InkWell(
            //                             onTap: () {
            //                               setState(() {
            //                                 _textList.remove(text);
            //                                 recipeIngreController
            //                                     .removeTags(text);
            //                                 print(recipeIngreController.tags);
            //                               });
            //                             },
            //                             child: const Icon(
            //                               Icons.cancel,
            //                               color: Colors.grey,
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ))
            //             .toList(),
            //       ],
            //     ),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Wrap(
                    spacing: 11.w,
                    runSpacing: 7.h,
                    children: List.generate(
                        _textList.length,
                        (index) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // CommonChip(text: text),
                                CommonChip(
                                    text: _textList[index]["text"],
                                    colorchange: _textList[index]["colorBool"],
                                    index: index,
                                    listName: "_textList"),
                                Visibility(
                                  visible: editChip,
                                  child: Row(
                                    children: [
                                      sizedBoxWidth(3.w),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            // _textList.remove(_textList[index]["text"]);
                                            recipeIngreController.removeTags(
                                                _textList[index]["text"]);
                                            _textList.removeWhere((element) =>
                                                element["text"] ==
                                                _textList[index]["text"]);
                                            print(recipeIngreController.tags);
                                            print(_textList);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.cancel,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))),
              ],
            ),

            sizedBoxHeight(18.h),
            Visibility(
              visible: !textFieldVisibile,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        textFieldVisibile = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: AppColors.buttonGrey54595F,
                      ),
                      height: 27.h,
                      width: 70.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          sizedBoxWidth(6.w),
                          SvgPicture.asset(
                            "assets/svg/add-circle-svgrepo-com.svg",
                            // height: 15.h,
                            // width: 15.w,
                          ),
                          Text(
                            "  Custom",
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontFamily: "Studio Pro",
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          editChip = !editChip;
                        });
                      },
                      child: Icon(
                        Icons.edit,
                        color: editChip
                            ? const Color(0xFFE1E1E1)
                            : const Color.fromRGBO(84, 89, 95, 1),
                      ))
                ],
              ),
            ),
            Visibility(
              visible: textFieldVisibile,
              child: Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 10.w,
                      child: TextFormField(
                        maxLength: 20,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Text';
                          } else if (value.length < 2) {
                            return 'Please enter atleast 2 characters';
                          }
                          return null;
                        },
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          suffixIconConstraints: const BoxConstraints(),
                          contentPadding: EdgeInsets.all(17.h),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: const Color(0xff54595f),
                              fontSize: 12.sp,
                              fontFamily: "Roboto"),
                          hintText: 'Enter text here',
                        ),
                        cursorColor: const Color(0xFF3B3F43),
                        onFieldSubmitted: (String value) {
                          setState(() {
                            final FormState? form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              // form.save();
                              textFieldVisibile = !textFieldVisibile;
                              _textController.clear();
                              _textList.add({"text": value, "colorBool": true});

                              // /
                            }
                          });
                        },
                        controller: _textController,
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff54595f)),
                        ),
                        onPressed: () {
                          setState(() {
                            textFieldVisibile = !textFieldVisibile;
                          });
                        },
                        child: const Text('Cancel'))
                  ],
                ),
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Tags",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(13.h),
            Wrap(
              spacing: 11.w,
              runSpacing: 7.h,
              children: [
                // CommonChip(text: "Savoury moments"),
                // CommonChip(text: "Quarter to quick"),
                // CommonChip(text: "Juicy Mondays"),
                // CommonChip(text: "The healthy way"),
                // CommonChip(text: "Fry-day!!"),
                // CommonChip(text: "Simple greens"),
                // CommonChip(text: "Flavour explosions"),
                // CommonChip(text: "The healthy way"),
                // List.generate(
                //   selectTags.length,
                //   (index) => null
                // ),
                // List.
                Wrap(
                  spacing: 11.w,
                  runSpacing: 7.h,
                  children: List.generate(
                      selectTags.length,
                      (index) => CommonChip(
                          text: selectTags[index]["text"],
                          colorchange: selectTags[index]["colorBool"],
                          index: index,
                          listName: "selectTags")),
                ),

                SizedBox(
                  height: 18.h,
                  width: double.infinity,
                ),
                Text(
                  "South Africa Cuisine",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                  width: double.infinity,
                ),
                // CommonChip(text: "Limpopo"),
                // CommonChip(text: "Easy"),
                // CommonChip(text: "Food"),
                // CommonChip(text: "Carrot"),
                // CommonChip(text: "Quick"),
                // CommonChip(text: "Yoghurt"),
                // CommonChip(text: "Breakfast"),
                // CommonChip(text: "Quick"),
                // CommonChip(text: "Yoghurt"),
                Wrap(
                  spacing: 11.w,
                  runSpacing: 7.h,
                  children: List.generate(
                      southAfricaCuisine.length,
                      (index) => CommonChip(
                          text: southAfricaCuisine[index]["text"],
                          colorchange: southAfricaCuisine[index]["colorBool"],
                          index: index,
                          listName: "southAfricaCuisine")),
                ),

                SizedBox(
                  height: 13.h,
                  width: double.infinity,
                ),
                Text(
                  "International Cuisine",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                  width: double.infinity,
                ),
                Wrap(
                  spacing: 11.w,
                  runSpacing: 7.h,
                  children: List.generate(
                      internationalCuisine.length,
                      (index) => CommonChip(
                          text: internationalCuisine[index]["text"],
                          colorchange: internationalCuisine[index]["colorBool"],
                          index: index,
                          listName: "internationalCuisine")),
                ),
                // CommonChip(text: "Limpopo"),
                // CommonChip(text: "Easy"),
                // CommonChip(text: "Food"),
                // CommonChip(text: "Carrot"),
                // CommonChip(text: "Quick"),
                // SizedBox(
                //   height: 6.h,
                // ),
                // CommonChip(text: "Yoghurt"),
                // CommonChip(text: "Breakfast"),
                // CommonChip(text: "Quick"),
                // CommonChip(text: "Yoghurt"),
                SizedBox(
                  height: 13.h,
                  width: double.infinity,
                ),
                Text(
                  "Select Difficulty",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                  width: double.infinity,
                ),
                Obx(() => Wrap(
                      spacing: 11.w,
                      runSpacing: 7.h,
                      children: List.generate(
                          difficultyList.length,
                          (index) =>
                              commomChipToggle(index, difficultyList[index])),
                    ))
                // Wrap(
                //   spacing: 11.w,
                //   runSpacing: 7.h,
                //   children: List.generate(difficultyList.length, (index) => commomChipToggle(index, difficultyList[index])),
                // )
                // List.generate(difficultyList.length, (index) => commomChipToggle(index, "hg"))
                // const CommonChip(text: "Easy"),
                // const CommonChip(text: "Medium"),
                // const CommonChip(text: "Hard"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    tabController!.animateTo(1);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(10.h)
          ],
        ),
      ),
    );
  }

  ingredientTab() {
    return Form(
      key: _newFormKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedBoxHeight(22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recipe Details",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(15.h),
              Container(
                height: 101.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // sizedBoxWidth(14.w),
                      SvgPicture.asset("assets/svg/Group 58248.svg"),
                      sizedBoxWidth(15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Cooking Time",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Wrap(
                            children: [
                              Text(
                                "How long does it take \nto make this recipe?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: const Color(0xff979797),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(_timeForServing());
                        },
                        child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                            height: 45.h,
                            width: 116.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$_selectedHour Hr $_selectedMinute Min",
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 20.sp),
                                ),
                                sizedBoxWidth(1.w),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBoxHeight(15.h),
              Container(
                height: 101.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //  sizedBoxWidth(14.w),
                      SvgPicture.asset("assets/svg/Group 58247.svg"),
                      sizedBoxWidth(15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Servings",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "How many people does \nthis recipe serve?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0xff979797),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(_servings());
                        },
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: Color(0xff707070)),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          height: 45.h,
                          width: 116.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " $servigCount Serving",
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: "Roboto"),
                              ),
                              sizedBoxWidth(1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recipe Details",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.spMin,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(15.h),

              //_recipeDetails(_tec, _tbsController),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widgetsInColumn.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _recipeDetails(_tec, _tbsController, index);
                  }),

              sizedBoxHeight(13.h),

              SizedBox(
                height: 40.h,
                width: 150.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // ignore: deprecated_member_use
                    primary: const Color.fromRGBO(84, 89, 95, 1),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                  ),
                  child: Text(
                    "+ Ingredient",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onPressed: () async {
                    print(textControllerNumber);
                    // if (textControllerNumber < 5) {
                    // await textControllerNumber++;
                    _controllers.add(TextEditingController());
                    _controllersTbs.add(TextEditingController());
                    _controllers2.add(TextEditingController());
                    _controllers2[textControllerNumber].text = "1";
                    dropdownData.add("cup");
                    // popKeys.add(GlobalKey());
                    // units.add("");
                    textControllerNumber++;
                    print("bvg");

                    // if (_tec.text.isEmpty) {
                    //   return;
                    // } else {
                    //   setState(() {
                    //     widgetsInColumn.add(_recipeDetails(null));
                    //   });
                    // }
                    setState(() {
                      widgetsInColumn.add(_recipeDetails(null, null, 0));
                    });
                    // }
                  },
                ),
              ),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Instructions",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.spMin,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(20.h),

              // _instructionSteps(1),
              // Column(
              //   children: stepsInColumn,
              // ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: stepsInColumn.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _instructionSteps(index);
                  }),

              sizedBoxHeight(14.h),
              SizedBox(
                height: 40.h,
                width: 150.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // ignore: deprecated_member_use
                    primary: const Color.fromRGBO(84, 89, 95, 1),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                  ),
                  child: Text(
                    "+ Instructions",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onPressed: () {
                    // if (number < 5) {
                    setState(() {
                      tecInstructionList.add(TextEditingController());
                      imageInstructionList.add(null);
                      stepsInColumn.add(_instructionSteps(0));
                      print(tecInstructionList.length);
                      print(imageInstructionList.length);
                    });
                    // }
                  },
                ),
              ),

              // ElevatedButton(onPressed: (){
              //   Get.to(PopupMenuExample());
              // }, child: Text("dropdown")),
              sizedBoxHeight(25)
            ],
          ),
        ),
      ),
    );
  }

  Widget _recipeDetails(TextEditingController? controller,
      TextEditingController? controllerTbs, int? index) {
    if (controllerTbs == null) {
      _controllersTbs[(textControllerNumber - 1)].text = "1";
    }
    // print("_recipeDetails $index");
    int _tbsInitialValue = 0;
    return SizedBox(
      height: 80.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // height: 45.h,
            width: 120.w,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                }
                // if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
                //   retuPlease enter a valid Ingredient Name';
                // }
                return null;
              },

              // validatorText: ""
              controller: _controllers[index!],
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8.h),
                isCollapsed: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff707070)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF707070)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                hintText: "Ex. Salt",
                hintStyle: TextStyle(
                    fontFamily: "Roboto",
                    color: const Color(0xff54595f),
                    fontSize: 17.h),
              ),
            ),
          ),
          // sizedBoxWidth(20.w),

          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                if (_controllers2[index].text.isNotEmpty) {
                  if (double.tryParse(_controllers2[index].text)! > 0.1) {
                    _controllers2[index].text =
                        ((double.tryParse(_controllers2[index].text) ?? 0.1) -
                                0.1)
                            .toStringAsFixed(2);
                  }
                }
              });
            },
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: const Color(0xffE1E1E1),
              child: const Text(
                "-",
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          ),

          sizedBoxWidth(10.w),
          SizedBox(
            // height: 45.h,
            width: 70.w,
            child: TextFormField(
              controller: _controllers2[index],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                }
                // if(imageInstructionList[index] == null){
                //   return "s"
                // }
                // if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
                //   retuPlease enter a valid Ingredient Name';
                // }
                return null;
              },
              // initialValue: '$_tbsInitialValue',
              keyboardType: TextInputType.number,
              // maxLength: 2,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                // WhitelistingTextInputFormatter(RegExp(r'^(\d+)?\.?\d{0,2}')),
              ],
              // onChanged: (value) {
              //   // _showPopupMenu();
              //   // openPopupMenu(index);
              //   if (units[index] == "") {
              //     openPopupMenu(index);
              //   }
              // },

              decoration: InputDecoration(
                  isCollapsed: true,
                  isDense: true,
                  contentPadding: EdgeInsets.all(8.h),
                  // content÷Padding: EdgeInsets.all(15.h),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  hintText: "Ex. 1 TBS",
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff54595f),
                      fontSize: 17.h),
                  counterText: ''),
            ),
          ),

          sizedBoxWidth(10.w),
          GestureDetector(
            onTap: () {
              setState(() {
                _controllers2[index].text =
                    ((double.tryParse(_controllers2[index].text) ?? 0.1) + 0.1)
                        .toStringAsFixed(2);
              });
            },
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: const Color(0xffE1E1E1),
              child: const Text(
                "+",
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          ),

          Spacer(),
          SizedBox(
            width: 100.w,
            height: 45.h,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Unit',
                  style: TextStyle(
                    // fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: dropdownData[index],
                onChanged: (value) {
                  setState(() {
                    dropdownData[index] = value!;
                  });
                },
                buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide: const BorderSide(color: Color(0xff707070)),
                        border: Border.all(color: Color(0xFF707070)))),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void openPopupMenu(int index) {
  //   final dynamic popupMenuState = popKeys[index].currentState;
  //   if (popupMenuState != null && popupMenuState.showButtonMenu != null) {
  //     popupMenuState.showButtonMenu();
  //   }
  // }

  // void _showPopupMenu() async {
  //   await showMenu(
  //     context: context,
  //     // position: RelativeRect.fromLTRB(100, 100, 100, 100),
  //     items: [
  //       PopupMenuItem(
  //         value: 1,
  //         child: Text("View"),
  //       ),
  //       PopupMenuItem(
  //           value: 2,
  //         child: Text("Edit"),
  //       ),
  //       PopupMenuItem(
  //         value: 3,
  //         child: Text("Delete"),
  //       ),
  //     ],
  //     elevation: 8.0,
  //   ).then((value){

  //   // NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null , value is the value given in PopupMenuItem
  //   if(value!=null)
  //     print(value);
  //     });
  // }
  // Widget

  Widget CommonChip(
      {required String text,
      bool colorchange = true,
      int? index,
      String? listName}) {
    // late bool _colorchange = true;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 27.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // ignore: deprecated_member_use
              primary: colorchange
                  ? const Color(0xFFE1E1E1)
                  : const Color.fromRGBO(84, 89, 95, 1),
              shape: RoundedRectangleBorder(
                side: colorchange
                    ? const BorderSide(
                        color: Color.fromARGB(255, 223, 216, 216))
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(11.r),
              ),
            ),
            child: Row(
              children: [
                Visibility(
                    visible: !colorchange,
                    child: Row(
                      children: [
                        const Image(image: AssetImage("assets/style=bulk.png")),
                        SizedBox(
                          width: 7.42.w,
                        )
                      ],
                    )),
                Text(
                  text,
                  style: TextStyle(
                    color: colorchange ? const Color(0xFF303030) : Colors.white,
                    fontSize: 11.sp,
                    fontFamily: 'StudioProR',
                  ),
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                print(colorchange);
                colorchange = !colorchange;

                print(colorchange);
                if (listName == "selectTags") {
                  selectTags[index!]["colorBool"] =
                      !selectTags[index]["colorBool"];
                } else if (listName == "southAfricaCuisine") {
                  southAfricaCuisine[index!]["colorBool"] =
                      !southAfricaCuisine[index]["colorBool"];
                } else if (listName == "internationalCuisine") {
                  internationalCuisine[index!]["colorBool"] =
                      !internationalCuisine[index]["colorBool"];
                } else {
                  _textList[index!]["colorBool"] =
                      !_textList[index]["colorBool"];
                }
                if (colorchange) {
                  recipeIngreController.removeTags(text);
                } else {
                  recipeIngreController.addTags(text);
                }
                print(recipeIngreController.tags);
                // /
                // colorchange = _colorchange ? _colorchange = false : true;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _servings() {
    return BottomSheet(
      builder: (context) {
        return SizedBox(
          height: 200.0,
          child: CupertinoPicker(
            itemExtent: 32.0,
            onSelectedItemChanged: (int value) {
              setState(() {
                servigCount = value;
              });
            },
            children: List<Widget>.generate(100, (int index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 20, fontFamily: "Roboto"),
                ),
              );
            }),
          ),
        );
      },
      onClosing: () {
        Get.back();
      },
    );
  }

  Widget _timeForServing() {
    return BottomSheet(
      builder: (context) {
        return Column(
          children: [
            sizedBoxHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Hours',
                  style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                ),
                SizedBox(),
                Text(
                  "Minutes",
                  style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width / 2,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _selectedHour = index;
                      });
                    },
                    children: List<Widget>.generate(24, (int index) {
                      return Center(
                        child: Text(
                          '$index ',
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "Roboto"),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width / 2,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _selectedMinute = index;
                      });
                    },
                    children: List<Widget>.generate(60, (int index) {
                      return Center(
                        child: Text(
                          '$index ',
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "Roboto"),
                        ),
                      );
                    }),
                  ),
                ),
                // Text('data')
              ],
            ),
          ],
        );
      },
      onClosing: () {
        Get.back();
      },
    );
  }

  builduploadprofileImage(int? index) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.camera, index: index);
                        Get.back();
                        print("dsf");
                        if (_image != null) {
                          Get.snackbar("title", "message");
                        }
                        // Get.snackbar(title, message)
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery, index: index);
                        Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  builduploadprofile(bool uploadVideo) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (context) {
        return Container(
          height: 100.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (uploadVideo) {
                          _onImageButtonPressed(ImageSource.camera);
                          Get.back();
                        } else {
                          getImage(ImageSource.camera);
                          Get.back();
                        }
                        // getImage(ImageSource.camera);
                        // Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (uploadVideo) {
                          _onImageButtonPressed(ImageSource.gallery);
                          Get.back();
                        } else {
                          getImage(ImageSource.gallery);
                          Get.back();
                        }
                        // getImage(ImageSource.gallery);
                        // Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 30.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    // if (_controller != null) {
    //   await _controller!.setVolume(0.0);
    // }
    // if (isVideo) {
    XFile? file = await _picker.pickVideo(
        source: source, maxDuration: const Duration(seconds: 10));
    recipeIngreController.changeVideoFile(file);
    // setState(() {});

    // await _playVideo(file);
    // Get.to(()=> FilePlayerWidget(file: file));
    // FilePlayerWidget(file: file);
    // }
  }

  Widget _instructionSteps(int? index) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              // index == null ? "Step 1" :
              'Step ' + (index! + 1).toString(),
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 17.sp,
                  color: const Color(0XFF6B6B6B)),
              // color: AppColors.),
            ),
          ],
        ),
        sizedBoxHeight(12.h),
        SizedBox(
          // height: 68.h,
          child: TextFormField(
            controller: tecInstructionList[index],
            // maxLines: 2,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "Step is can't be empty";
              }
              if (imageInstructionList[index] == null) {
                return "Select a image";
              }
              // if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
              //   retuPlease enter a valid Ingredient Name';
              // }
              return null;
            },
            decoration: InputDecoration(
              isDense: true,

              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              // contentPadding: const EdgeInsets.only(top: 8, left: 12),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff707070)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF707070)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              hintText: "Write your step of recipe here",
              hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  color: const Color(0xff6B6B6B),
                  fontSize: 14.sp),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  height: 50.h,
                  width: 40.w,
                  child: imageInstructionList[index] != null
                      ?
                      //  Image.asset("assets/camera.png")
                      Icon(
                          Icons.check,
                          size: 40.h,
                          color: AppColors.grey54595F,
                        )
                      : GestureDetector(
                          onTap: () {
                            builduploadprofileImage(index);
                          },
                          child: Image.asset(
                            "assets/camera.png",
                            // height: ,
                            // fit: BoxFit.fill,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
        sizedBoxHeight(15.h),
      ],
    );
  }

  Future getImage(ImageSource source, {int? index}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // final imagePermanent = await saveFilePermanently(image.path);

      // setState(() {
      //   // this._image
      //   recipeIngreController.image = imageTemporary;
      // });
      // recipeIngreController.changeImageFile(imageTemporary);
      if (index == null) {
        recipeIngreController.changeImageFile(imageTemporary);
      } else {
        setState(() {
          imageInstructionList[index] = imageTemporary;
          print(imageInstructionList);
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(imagePath).copy(imagePath);
  }

  commomChipToggle(int index, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 27.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // ignore: deprecated_member_use
              primary: difficultyIndex == index
                  ? const Color.fromRGBO(84, 89, 95, 1)
                  : const Color(0xFFE1E1E1),
              shape: RoundedRectangleBorder(
                side: difficultyIndex == index
                    ? BorderSide.none
                    : const BorderSide(
                        color: Color.fromARGB(255, 223, 216, 216)),
                borderRadius: BorderRadius.circular(11.r),
              ),
            ),
            child: Row(
              children: [
                Visibility(
                    visible: difficultyIndex == index,
                    child: Row(
                      children: [
                        const Image(image: AssetImage("assets/style=bulk.png")),
                        SizedBox(
                          width: 7.42.w,
                        )
                      ],
                    )),
                Text(
                  text,
                  style: TextStyle(
                    color: difficultyIndex == index
                        ? Colors.white
                        : const Color(0xFF303030),
                    fontSize: 11.sp,
                    fontFamily: 'StudioProR',
                  ),
                ),
              ],
            ),
            onPressed: () {
              difficultyIndex.value = index;
              selectedDifficultyText = text;
              // print(selectedDifficultyText);
              // setState(() {
              //   _colorchange = !_colorchange;
              //   // _colorchange = _colorchange ? _colorchange = false : true;
              // });
            },
          ),
        ),
      ],
    );
  }
}
