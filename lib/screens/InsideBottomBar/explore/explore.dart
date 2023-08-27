import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/search_noti.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/explore/controller/explore_controller.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
import 'package:foodspeciality/screens/join_challenge.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../common files/common_view_rules.dart';
import '../../../services/like_service.dart';
import '../../../services/save_recipe.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  ScrollController? scrollController;

  // final controllerExplore = GetX
  // var sliderPage = 0.obs;
  ExploreController controllerExplore = Get.put(ExploreController());
  HomeController controllerHome = Get.put(HomeController());
  final CarouselController carouselController = CarouselController();
  final tecComment = TextEditingController();
  // ExploreController exploreController = Get.put(ExploreController());
  // ExploreController controllerExplore = Get.put(ExploreController());

  void _handleLikeButton(String id) async {
    try {
      var resp = await LikeService.likeRecipe(id);
      if (resp) {
        controllerExplore.getTrendingRecipe();
        // viewRecipeController.getRecipeDetails(recipeId: id);
        
      }
    } catch (e) {
      // Handle error here
      print('Error liking recipe: $e');
    }
  }

  void _handleSaveButton(id) async {
    try {
      var resp = await SaveService.saveRecipe(id ?? "");
      if (resp) {
        controllerExplore.getTrendingRecipe();
        // viewRecipeController.getRecipeDetails(recipeId: id);

        // setState(() {
        //   isSaved = !isSaved!;
        // });
      }
    } catch (e) {
      // Handle error here
      print('Error saving recipe: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // exploreController.get
    controllerExplore.getExplore();
    controllerExplore.getOnGoingChallenge();
    controllerExplore.getTrendingRecipe();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          searchNotification(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textgreyM20BoldSP("Join a cooking challenge"),
                        sizedBoxHeight(7.h),

                        GetBuilder<ExploreController>(builder: (builder){
                          return controllerExplore.isLoadingOngoingChallenge 
                          ? Center(child: CircularProgressIndicator()) 
                          : controllerExplore.onGoingChallenges == null 
                            ? Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: textgrey18BoldSP("Something went wrong"),
                            )
                              : controllerExplore.onGoingChallenges!.data.isEmpty 
                                ? Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: textgrey18BoldSP("No challenges"),
                                )
                                : Column(
                                children: [
                                  CarouselSlider.builder(
                                      carouselController: CarouselController(),
                                      itemCount: controllerExplore.onGoingChallenges!.data.length,
                                      // 3,
                                      itemBuilder: (context, index, realIndex) {
                                        final sliderData = controllerExplore.onGoingChallenges!.data[index];
                                        // final commentData =
                                        //   commentsContoller.comments!.data[index];
                                        String startDate = sliderData.startDate;
                                        DateTime parsedStartDate = DateTime.parse(startDate);
                                        String formattedStartDate = DateFormat('d MMMM').format(parsedStartDate);

                                        String endDate = sliderData.endDate;
                                        DateTime parsedEndDate = DateTime.parse(endDate);
                                        String formattedEndDate = DateFormat('d MMMM').format(parsedEndDate);
                                        return Padding(
                                          padding: EdgeInsets.all(5.w),
                                          child: mainChallengesCard(
                                            challengeId: sliderData.id,
                                            title: sliderData.title,
                                            startDate: formattedStartDate,
                                            endDate: formattedEndDate,
                                            numRecipeShared: sliderData.recipeCount
                                          ),
                                        );
                                        // final sliderInfo = sliderData[index];
                                        // return buildSlider(sliderInfo["imageUrl"], index , sliderInfo["title1"], sliderInfo["title2"], sliderInfo["videoUrl"]);
                                      },
                                      options: CarouselOptions(
                                        height: 260.h,
                                        // initialPage: sliderPage.value,
                                        // aspectRatio: 3 / 1,
                                        autoPlay: true,
                                        autoPlayAnimationDuration:
                                            const Duration(seconds: 3),
                                        // enlargeCenterPage: true,
                                        viewportFraction: 1,
                                        onPageChanged: (index, reason) {
                                          // setState(() {
                                            // sliderPage.value = index;
                                            // controllerExplore.sliderPage = index;
                                            controllerExplore.changeSliderPage(index);
                                          // });
                                        },
                                      )),
                                  
                                  sizedBoxHeight(12.h),
                              
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      controllerExplore.onGoingChallenges!.data.length,


                                      (index) => GestureDetector(
                                        onTap: () =>
                                            carouselController.animateToPage(index),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(25.r)),
                                          width: 12.w,
                                          height: controllerExplore.sliderPage == index ? 3.h : 2.h,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 3.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            
                                ],
                              );
                        
                        }),

                      //   Obx(() => 
                      //   Column(
                      //     children: [
                      //       CarouselSlider.builder(
                      //           carouselController: CarouselController(),
                      //           itemCount: 3,
                      //           itemBuilder: (context, index, realIndex) {
                      //             return Padding(
                      //               padding: EdgeInsets.all(5.w),
                      //               child: mainChallengesCard(),
                      //             );
                      //             // final sliderInfo = sliderData[index];
                      //             // return buildSlider(sliderInfo["imageUrl"], index , sliderInfo["title1"], sliderInfo["title2"], sliderInfo["videoUrl"]);
                      //           },
                      //           options: CarouselOptions(
                      //             height: 260.h,
                      //             // initialPage: sliderPage.value,
                      //             // aspectRatio: 3 / 1,
                      //             autoPlay: true,
                      //             autoPlayAnimationDuration:
                      //                 const Duration(seconds: 3),
                      //             // enlargeCenterPage: true,
                      //             viewportFraction: 1,
                      //             onPageChanged: (index, reason) {
                      //               // setState(() {
                      //                 // sliderPage.value = index;
                      //                 // controllerExplore.sliderPage = index;
                      //                 controllerExplore.changeSliderPage(index);
                      //               // });
                      //             },
                      //           )),
                            
                      //       sizedBoxHeight(12.h),
                        
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: List.generate(
                      //           3,
                      //           (index) => GestureDetector(
                      //             onTap: () =>
                      //                 carouselController.animateToPage(index),
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                   color: Colors.grey,
                      //                   borderRadius: BorderRadius.circular(25.r)),
                      //               width: 12.w,
                      //               height: controllerExplore.sliderPage == index ? 3.h : 2.h,
                      //               margin: const EdgeInsets.symmetric(
                      //                 horizontal: 3.0,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      
                      //     ],
                      //   ),
                    
                      // ),

                        // Column(
                        //   children: [
                        //     CarouselSlider.builder(
                        //         carouselController: CarouselController(),
                        //         itemCount: 3,
                        //         itemBuilder: (context, index, realIndex) {
                        //           return Padding(
                        //             padding: EdgeInsets.all(5.w),
                        //             child: mainChallengesCard(),
                        //           );
                        //           // final sliderInfo = sliderData[index];
                        //           // return buildSlider(sliderInfo["imageUrl"], index , sliderInfo["title1"], sliderInfo["title2"], sliderInfo["videoUrl"]);
                        //         },
                        //         options: CarouselOptions(
                        //           height: 260.h,
                        //           // initialPage: sliderPage.value,
                        //           // aspectRatio: 3 / 1,
                        //           autoPlay: true,
                        //           autoPlayAnimationDuration:
                        //               const Duration(seconds: 3),
                        //           // enlargeCenterPage: true,
                        //           viewportFraction: 1,
                        //           onPageChanged: (index, reason) {
                        //             // setState(() {
                        //             //   sliderPage.value = index;
                        //             // });
                        //           },
                        //         )),
                            
                        //     sizedBoxHeight(12.h),
                        
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: List.generate(
                        //         3,
                        //         (index) => GestureDetector(
                        //           onTap: () =>
                        //               carouselController.animateToPage(index),
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.grey,
                        //                 borderRadius: BorderRadius.circular(25.r)),
                        //             width: 12.w,
                        //             height: sliderPage.value == index ? 3.h : 2.h,
                        //             margin: const EdgeInsets.symmetric(
                        //               horizontal: 3.0,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                      
                        //   ],
                        // ),
                      
                        // sizedBoxHeight(12.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: List.generate(
                        //     3,
                        //     (index) => GestureDetector(
                        //       onTap: () =>
                        //           carouselController.animateToPage(index),
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //             color: Colors.grey,
                        //             borderRadius: BorderRadius.circular(25.r)),
                        //         width: 12.w,
                        //         height: sliderPage.value == index ? 3.h : 2.h,
                        //         margin: const EdgeInsets.symmetric(
                        //           horizontal: 3.0,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      
                        // GetBuilder<ExploreController>(builder: (_){
                        //   return CarouselSlider.builder(
                        //     itemCount: 3,
                        //     itemBuilder: (context, index, realIndex) {
                        //       return Padding(
                        //         padding: EdgeInsets.all(5.w),
                        //         child: mainChallengesCard(),
                        //       );
                        //       // final sliderInfo = sliderData[index];
                        //       // return buildSlider(sliderInfo["imageUrl"], index , sliderInfo["title1"], sliderInfo["title2"], sliderInfo["videoUrl"]);
                        //     },
                        //     options: CarouselOptions(

                        //       height: 260.h,
                        //       initialPage: sliderPage.value,
                        //       // aspectRatio: 3 / 1,
                        //       autoPlay: true,
                        //       autoPlayAnimationDuration: const Duration(seconds: 3),
                        //       // enlargeCenterPage: true,
                        //       viewportFraction: 1,
                        //       onPageChanged: (index, reason) {
                        //         // setState(() {
                        //         sliderPage.value = index;

                        //         // });
                        //       },
                        //     )
                        //   );
                        // }),

                        //   Obx(() => CarouselSlider.builder(
                        //     itemCount: 3,
                        //     itemBuilder: (context, index, realIndex) {
                        //       return Padding(
                        //         padding: EdgeInsets.all(5.w),
                        //         child: mainChallengesCard(),
                        //       );
                        //       // final sliderInfo = sliderData[index];
                        //       // return buildSlider(sliderInfo["imageUrl"], index , sliderInfo["title1"], sliderInfo["title2"], sliderInfo["videoUrl"]);
                        //     },
                        //     options: CarouselOptions(

                        //       height: 260.h,
                        //       initialPage: 0,
                        //       // aspectRatio: 3 / 1,
                        //       autoPlay: true,
                        //       autoPlayAnimationDuration: const Duration(seconds: 3),
                        //       // enlargeCenterPage: true,
                        //       viewportFraction: 1,
                        //       onPageChanged: (index, reason) {
                        //         // setState(() {
                        //         sliderPage.value = index;

                        //         // });
                        //       },
                        //     )
                        //   ),
                        //  ),
                        // mainChallengesCard(),
                        sizedBoxHeight(25.h),
                        textgreyM20BoldSP("Trending Recipes")
                      ],
                    ),
                  ),
                  sizedBoxHeight(11.h),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 98.h,
                            child: GetBuilder<ExploreController>(builder: (_) {
                              return controllerExplore.isLoadingTrending 
                              ? Center(child: CircularProgressIndicator()) 
                              : controllerExplore.trendingRecipe == null 
                                ? Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: textgrey18BoldSP("Something went wrong"),
                                )
                                : ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 9.w);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controllerExplore.trendingRecipe!.data.length,
                                  itemBuilder: (context, index) {
                                    final recipeData = controllerExplore.trendingRecipe!.data[index];
                                    // controllerExplore.likeSave[index]
                                    return trendingRecipeCard(
                                        // controllerExplore.likeSave[index]["like"],
                                        // controllerExplore.likeSave[index]["save"],
                                        // index,
                                        recipeId: recipeData.id,
                                        recipeImage: recipeData.coverImage,
                                        recipeName: recipeData.name,
                                        userName: recipeData.user.username,
                                        liked: recipeData.liked,
                                        numLike: recipeData.likes,
                                        numComment: recipeData.comments,
                                        saved: recipeData.saved,
                                        cookingTime: recipeData.cookingTime
                                    );
                                  },
                                );
                          
                            })),
                        sizedBoxHeight(20.h),
                        textgreyM20BoldSP("Explore"),
                        sizedBoxHeight(15.h),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GetBuilder<ExploreController>(builder: (context){
                      return controllerExplore.isLoadingExplore 
                      ? Center(child: CircularProgressIndicator()) 
                      : controllerExplore.exploreJson == null 
                        ? Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: textgrey18BoldSP("Something went wrong"),
                        )
                        : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controllerExplore.exploreJson!.recipes.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 7.w,
                            mainAxisSpacing: 7.w,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final recipeData = controllerExplore.exploreJson!.recipes[index];
                            // print(index);
                            // print(ApiUrls.base + "${controllerExplore.exploreJson!.recipes[index].coverImage}");
                            return InkWell(
                              onTap: () {
                                Get.toNamed("/InspirationRecipeComment",
                                  arguments: recipeData.id
                                );
                                print(recipeData.id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(ApiUrls.base + "${controllerExplore.exploreJson!.recipes[index].coverImage}"),
                                        // index.isEven
                                        //     ? const AssetImage("assets/home/17.png")
                                        //     : const AssetImage(
                                        //         "assets/home/12.png"),
                                        fit: BoxFit.cover
                                        // Image.asset("name")
                                        )),
                              ),
                            );
                          },
                        );
                    
                    })
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: 13,
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 3,
                    //     crossAxisSpacing: 7.w,
                    //     mainAxisSpacing: 7.w,
                    //   ),
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return InkWell(
                    //       onTap: () {
                    //         Get.toNamed("/InspirationRecipeComment");
                    //       },
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: index.isEven
                    //                     ? const AssetImage("assets/home/17.png")
                    //                     : const AssetImage(
                    //                         "assets/home/12.png"),
                    //                 fit: BoxFit.cover
                    //                 // Image.asset("name")
                    //                 )),
                    //       ),
                    //     );
                    //   },
                    // ),
                
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget trendingRecipeCard(
    // int like, int save, int index,
    {
    required String recipeId,
    required String recipeName,
    required String recipeImage,
    required String userName,
    // required String ,
    bool? liked,
    required int numLike,
    required int numComment,
    bool? saved,
    required String cookingTime,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed("/InspirationRecipeComment",
          arguments: recipeId
        );
      },
      child: Container(
        height: 97.h,
        width: 250.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyL979797),
          borderRadius: BorderRadius.circular(9.h),
          // color: AppColors.lightBlueF2F2F2,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 58.w,
                    height: 47.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        image: DecorationImage(
                            image: NetworkImage(ApiUrls.base + "$recipeImage"),
                            // AssetImage("assets/home/food_bowl.png"),
                            fit: BoxFit.fill)),
                  ),
                  sizedBoxWidth(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // textWhite17w500("George Smith"),
                      // e=
                      // textBlack14SP_Med("Bunny Chow"),
                      textBlack14SP_Med(recipeName),
    
                      // textgreyD16BoldSP("Priyanka Joshi"),
    
                      sizedBoxHeight(5.h),
    
                      // textgreyM10Robo("@Priyujoshi")
                      textgreyM10Robo("@$userName")
    
    
                      // textgreyD12Robo("2 Days ago")
    
                      // textGrey15W500("21 Jan, 2022, 10:41 am")
                    ],
                  )
                ],
              ),
    
              // sizedBoxHeight(.h),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Row(
                      //   children: [
                      //     Image.asset("assets/icons/like.png",
                      //       width: 18.w,
                      //       height: 16.h,
                      //     ),
    
                      //     textBlack10Robo("55")
                      //   ],
                      // ),
    
                      iconText(
                          liked!
                              ? "assets/icons/like_filled.png"
                              : "assets/icons/like.png",
                          numLike > 0 ?  numLike.toString() : "", 
                          onTap: () {
                            _handleLikeButton(recipeId);
                            // controllerExplore.likeMethod(index, like);
                          }, 
                          // color: !liked ? AppColors.greyM707070 : null
                          ),
    
                      sizedBoxWidth(25.w),
    
                      // InkWell(
                      //   onTap: (){
                      //     // commentbottomSheet();
                      //   },
                      //   child: Image.asset("assets/icons/comment.png",
                      //     width: 18.w,
                      //     height: 16.h,
                      //   ),
                      // ),
    
                      iconText("assets/icons/comment.png", 
                      numComment > 0 ? numComment.toString() : "", 
                      // onTap: () {
                      //   // commentbottomSheet();
                      //   // commentbottomSheet(recipeData.id!);
    
                      // }, 
                      color: AppColors.greyM707070),
    
                      sizedBoxWidth(25.w),
    
                      // InkWell(
                      //   // onTap: share,
                      //   // (){
                      //   //   shar
                      //   //   // Share.share('https://www.google.co.in/');
                      //   // },
                      //   child: Image.asset("assets/icons/share.png",
                      //     width: 18.w,
                      //     height: 16.h,
                      //   ),
                      // ),
    
                      iconText(
                          saved!
                              ? "assets/icons/save_filled.png"
                              : "assets/icons/save.png",
                          "", onTap: () {
                            _handleSaveButton(recipeId);
                        // controllerExplore.saveMethod(index, save);
                      }, color: AppColors.greyM707070),
    
                      // iconText(
                      //   "assets/icons/save.png", "25"),
                    ],
                  ),
    
                  // Image.asset("assets/icons/save.png",
                  //   width: 18.w,
                  //   height: 16.h,
                  // ),
                  Row(
                    children: [
                      // Image.asset(imagePath,
                      //   width: 18.w,
                      //   height: 16.h,
                      //   color: AppColors.greyM707070,
                      // ),
                      SvgPicture.asset(
                        "assets/icons/time.svg",
                        height: 16.h,
                        width: 18.w,
                        color: AppColors.greyM707070,
                        // colorFilter: AppColors.greyD3B3F43,
                      ),
    
                      sizedBoxWidth(2.w),
    
                      // textBlack10Robo("30 Min")
                      textBlack10Robo(cookingTime + " min")
                      
                    ],
                  ),
                  // iconText("assets/icons/save.png", "30 Min")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconText(String imagePath, String text,
      {void Function()? onTap, Color? color}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Image.asset(
            imagePath,
            width: 18.w,
            height: 16.h,
            // color: color,
          ),
        ),
        sizedBoxWidth(2.w),
        textBlack10Robo(text)
      ],
    );
  }

  // Future<T?> commentbottomSheet<T>(String recipeId) {
  //   isReply.value = false;
  //   // String? commentIdForReply;
    
    
  //   // FocusNode _focusNode = FocusNode();
  //   // _focusNode.addListener(() { });
  //   // GetCommentsController commentsContoller = Get.put(GetCommentsController());
  //   // bool? isReply = false;

  //   commentsContoller.emptyComments();
  //   commentsContoller.getCommentsData(recipeId);

  //   // focusForReply(){
  //   //   if (_focusNode.hasFocus) {
  //   //     _focusNode.requestFocus();
  //   //   }
  //   // }


  //   return Get.bottomSheet(
  //     // commentsContoller.getCommentsData(recipeId);
  //     GetBuilder<GetCommentsController>(builder: (context) {
  //       return GestureDetector(
  //         onTap: (){
  //           isReply.value = false;
  //           _focusNode.unfocus();
  //         },
  //         child: Container(
  //           // height: 375.h,
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
  //                 Expanded(child: GetBuilder<HomeController>(builder: (_) {
  //                   return commentsContoller.comments == null
  //                       ? Center(child: CircularProgressIndicator())
  //                       : commentsContoller.comments!.data.isEmpty
  //                           ? Center(child: textBlack14Robo("No comments"))
  //                           : ListView.builder(
  //                               // physics: const NeverScrollableScrollPhysics(),
  //                               // shrinkWrap: true,
  //                               // itemCount: controllerHome.commentLike.length,
  //                               itemCount: commentsContoller.comments!.data.length,
        
  //                               itemBuilder: (context, index) {
  //                                 final commentData =
  //                                     commentsContoller.comments!.data[index];
  //                                 String originalDate = commentData.createdAt;
  //                                 DateTime parsedDate =
  //                                     DateTime.parse(originalDate);
  //                                 String formattedDate =
  //                                     DateFormat('dd/mm/yyyy').format(parsedDate);
  //                                 return Column(
  //                                   children: [
  //                                     tileForlist(
  //                                         profileImage:
  //                                             commentData.user.profileImage,
  //                                         userName: commentData.user.firstName +
  //                                             " " +
  //                                             commentData.user.lastName,
  //                                         comment: commentData.comment,
  //                                         likedStatus: commentData.liked,
  //                                         likeNo: commentData.likedComments.length,
  //                                         commentId: commentData.id,
  //                                         recipeId: recipeId,
  //                                         numReplies: commentData.repliesLength,
  //                                         dateTime: formattedDate),
  //                                     // tileForlist(
  //                                     //     // controllerHome.commentLike[index]["comment"],
  //                                     //     commentData.comment,
  //                                     //     // commentData.likedComments.length,
  //                                     //     controllerHome.commentLike[index]["like"],
  //                                     //     ),
  //                                     sizedBoxHeight(13.h)
  //                                   ],
  //                                 );
  //                               },
  //                             );
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
        
  //                 Obx(() => CustomSearchTextFormField(
  //                   textEditingController: tecComment,
  //                   autofocus: false,
  //                   focusNode: _focusNode,
  //                   hintText: isReply.value ? "Add a reply" :"Add a comment",
  //                   validatorText: '',
  //                   suffixIcon: Padding(
  //                     padding: EdgeInsets.only(right: 15.w),
  //                     child: SizedBox(
  //                         height: 50.h,
  //                         width: 40.w,
  //                         child: Center(
  //                             child: InkWell(
  //                                 onTap: () async {
  //                                   if (tecComment.text.isNotEmpty) {
  //                                     // print(tecComment.text);
  //                                     // controllerHome
  //                                     //     .commentMethod(tecComment.text);
  //                                     if (isReply.value) { //for reply
  //                                       commentsContoller.addReplyApi(
  //                                         reply: tecComment.text, 
  //                                         commentId: commentIdForReply!,
  //                                         recipeId: recipeId
  //                                       );
  //                                       tecComment.clear();
  //                                       isReply.value = false;

  //                                     } else { // for comment
  //                                       var resp = await commentsContoller.addCommentApi(
  //                                           commment: tecComment.text,
  //                                           recipeId: recipeId);
  //                                       if (resp!) {
  //                                         setState(() {
                                            
  //                                         });
  //                                       }
  //                                       tecComment.clear();
  //                                     }
                                      
  //                                   }
  //                                 },
  //                                 child: textgreyM14Sp("Send")))),
  //                   )))
                  
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     })
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
  //               Expanded(child: GetBuilder<HomeController>(builder: (_) {
  //                 return ListView.builder(
  //                   // physics: const NeverScrollableScrollPhysics(),
  //                   // shrinkWrap: true,
  //                   itemCount: controllerHome.commentLike.length,
  //                   itemBuilder: (context, index) {
  //                     return Column(
  //                       children: [
  //                         tileForlist(
  //                             controllerHome.commentLike[index]["comment"],
  //                             controllerHome.commentLike[index]["like"],
  //                             index),
  //                         sizedBoxHeight(13.h)
  //                       ],
  //                     );
  //                   },
  //                 );
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
  //                                     controllerHome
  //                                         .commentMethod(tecComment.text);
  //                                     tecComment.clear();
  //                                   }
  //                                 },
  //                                 child: textgreyM14Sp("Send")))),
  //                   ))
  //             ],
  //           ),
  //         )),
  //     // barrierColor: Colors.red[50],
  //     // isDismissible: false,
  //   );
  // }

  Widget tileForlist(String comment, int like, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35.h,
          height: 35.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.h),
              image: const DecorationImage(
                  image: AssetImage("assets/home/profile.png"),
                  fit: BoxFit.fill)),
        ),
        sizedBoxWidth(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // textWhite17w500("George Smith"),
            // e=
            textBlack16SP("Chaitali tatkare"),

            sizedBoxHeight(5.h),

            // textgreyD12Robo("2 Days ago")
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  color: AppColors.greyLtEBEBEB),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                child: textgreyD10Robo("11:36"),
              ),
            ),

            sizedBoxHeight(5.h),

            Row(
              children: [
                SizedBox(
                    // hei
                    width: 290.w,
                    child: textBlack15Robo(comment
                        // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
                        )),
                sizedBoxWidth(10.w),
                Column(
                  children: [
                    // /
                    InkWell(
                      onTap: () {
                        controllerHome.likeMethod(index, like);
                        // sets
                        // like = !like;
                        // setState(() {
                        //   commentLike[index]["like"] = like == 0 ? 1 : 0;
                        //   // sdf
                        // });
                        // controllerHome.commentLike
                      },
                      child: like == 0
                          ? Image.asset(
                              "assets/icons/like.png",
                              width: 20.w,
                              height: 18.h,
                            )
                          : Image.asset(
                              "assets/icons/like_filled.png",
                              width: 20.w,
                              height: 18.h,
                            ),
                    ),

                    sizedBoxHeight(2.h),

                    textgreyL12Robo("20")
                  ],
                )
              ],
            ),

            sizedBoxHeight(5.h),

            textgreyM14Sp("Reply")

            // textGrey15W500("21 Jan, 2022, 10:41 am")
          ],
        )
      ],
    );
  }

  Widget mainChallengesCard({
    required String challengeId,
    required String title,
    required String startDate,
    required String endDate,
    required int numRecipeShared
  }) {
    return Container(
      // height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        color: AppColors.lightBlueF2F2F2,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyL979797,
            blurRadius: 2.h,
            spreadRadius: 1.h,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // textBlack18SP_Bold('The "Main" Mains Challenges'),
                    textBlack18SP_Bold(title),

                    textgreyD12Robo("$startDate - $endDate")
                    // textgreyD12Robo("10 Oct - 16 Oct")

                  ],
                ),
                Image.asset(
                  "assets/icons/trophy.png",
                  height: 38.h,
                  width: 39.w,
                ),
              ],
            ),
            sizedBoxHeight(12.h),
            textgreyM10Robo(
              numRecipeShared > 0  ? ("$numRecipeShared recipes shared so for!") : ""
            ),
            sizedBoxHeight(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) => sharedRecipeCard()),
            ),

            // SizedBox(
            //   height: 119.h,
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) {
            //       return index == 2 ? SizedBox() : SizedBox(width: 7.w);
            //     },
            //     scrollDirection: Axis.horizontal,
            //     physics: const BouncingScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return sharedRecipeCard();
            //     },
            //   ),
            // ),
            // sizedBoxHeight(16.h),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed("/joinchallenge",
                        arguments: challengeId
                      );
                      // Get.to(const JoinChallenge(),
                      //     duration: const Duration(milliseconds: 500),
                      //     transition: Transition.fadeIn);
                    },
                    child: textBlack14SP_Med("Join Challenge")),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.black,
                  size: 15.h,
                ),
                sizedBoxWidth(15.w),
                GestureDetector(
                    onTap: () {
                      getViewRulesDailog();
                    },
                    child: textBlack14SP_Med("View Rules")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sharedRecipeCard() {
    return Container(
      height: 114.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyL979797,
            blurRadius: 2.h,
            spreadRadius: 1.h,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          children: [
            Container(
              height: 85.h,
              width: 110.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                  image: const DecorationImage(
                      image: AssetImage("assets/home/food_bowl.png"),
                      fit: BoxFit.fill)),
            ),
            // sizedBoxHeight(5.h),
            const Spacer(),
            textgreyD10Robo("Slappappoffer Recipe"),
            // sizedBoxHeight(5.h),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
