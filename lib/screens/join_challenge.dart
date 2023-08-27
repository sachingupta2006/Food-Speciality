import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/comment_bottom_sheet.dart';
import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/controllers/join_challenge_controller.dart';
import 'package:foodspeciality/screens/InsideBottomBar/explore/controller/explore_controller.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../common files/app_bar.dart';
import '../common files/sized_box.dart';
import '../services/like_service.dart';
import '../services/save_recipe.dart';

class JoinChallenge extends StatefulWidget {
  const JoinChallenge({super.key});

  @override
  State<JoinChallenge> createState() => _JoinChallengeState();
}

class _JoinChallengeState extends State<JoinChallenge> {
  ExploreController controllerExplore = Get.put(ExploreController());
  HomeController controllerHome = Get.put(HomeController());
  final tecComment = TextEditingController();
  JoinChallengeController joinChallengeController = Get.put(JoinChallengeController());
  var challengeId;

  void _handleLikeButton(String id) async {
    try {
      var resp = await LikeService.likeRecipe(id);
      if (resp) {
        joinChallengeController.getChallenge(challengeId: challengeId);
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
        joinChallengeController.getChallenge(challengeId: challengeId);
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
    challengeId = Get.arguments;
    joinChallengeController.getChallenge(challengeId: challengeId);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<JoinChallengeController>(builder: (context){
          return joinChallengeController.isloading 
            ? Center(child: CircularProgressIndicator()) 
            // ? 
            : joinChallengeController.challengeModel == null 
            ? Center(child: textgrey18BoldSP("Something went wrong"))
            : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(86),
                    child: Material(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14)),
                      // shape: Border.all(color: Colors.white),
                      color: Colors.white,
                      elevation: 2,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 86.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            sizedBoxWidth(9.w),
                            CircularPercentIndicator(
                              radius: 28.r,
                              percent: 0.72,
                              startAngle: 320,
                              progressColor: const Color(0xff3B3F43),
                              lineWidth: 2,
                              center: const Icon(
                                Icons.calendar_today_outlined,
                                size: 18,
                              ),
                            ),
                            sizedBoxWidth(10.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<JoinChallengeController>(builder: (builder){
                                  final daysLeft = joinChallengeController.challengeModel!.data.challengeDetails.timeLeft.days;

                                  return Text(
                                    
                                    // '2 Days Left',
                                    daysLeft > 0 ? "${(daysLeft + 1).toString()} Days Left" : "Ends Today",
                                    // joinChallengeController.challengeModel!.data.challengeDetails.timeLeft.days.toString(),

                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: 'StudioProM',
                                        color: const Color(0xff3B3F43)),
                                  );

                                }), 
                                // Text(
                                  
                                //   // '2 Days Left',
                                //   joinChallengeController.challengeModel!.data.challengeDetails.timeLeft.days.toString(),

                                //   style: TextStyle(
                                //       fontSize: 10.sp,
                                //       fontFamily: 'StudioProM',
                                //       color: const Color(0xff3B3F43)),
                                // ),
                                sizedBoxHeight(5.h),
                                LinearPercentIndicator(
                                  barRadius: Radius.circular(5.r),
                                  padding: const EdgeInsets.all(0),
                                  width: 186.w,
                                  percent: 0.4,
                                  progressColor: const Color(0xff979797),
                                  backgroundColor: const Color(0xffF2F2F2),
                                ),
                                // sizedBoxHeight(10.h)
                              ],
                            ),
                            sizedBoxWidth(27.w),
                            InkWell(
                              onTap: () {
                                Get.toNamed("/RecipeIng",
                                  arguments: challengeId
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Submit recipe',
                                    style: TextStyle(
                                      fontFamily: 'StudioProM',
                                      fontSize: 14.sp,
                                      color: const Color(0xff3B3F43),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16.sp,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: 
                              joinChallengeController.challengeModel!.data.challengeDetails.thumbnail == null 
                              ? DecorationImage(
                                  image: 
                                  // recipeData.user.profileImage == null 
                                  // ? 
                                  AssetImage("assets/No_Image_Available.jpg"),
                                  // :
                                  //  NetworkImage(
                                  //     ApiUrls.base + "${recipeData.user!.profileImage}"),
                                  fit: BoxFit.fill)
                              :
                              DecorationImage(
                                  image: 
                                  // recipeData.user.profileImage == null 
                                  // ? 
                                  // AssetImage("assetName")
                                  // :
                                    NetworkImage(
                                      ApiUrls.base + "${joinChallengeController.challengeModel!.data.challengeDetails.thumbnail}"),
                                  fit: BoxFit.fill)
                              // image: DecorationImage(
                              //     fit: BoxFit.cover,
                              //     opacity: 1,
                              //     image: 
                              //     NetworkImage(ApiUrls.base + "${joinChallengeController.challengeModel!.data.challengeDetails.thumbnail}")
                              //     // AssetImage('assets/home/food_bowl.png')
                              //     )
                                ),
                          // child: Image.asset(
                          //   "assets/Mask Group 108.png",
                          //   // color: Color.fromARGB(255, 168, 168, 168).withOpacity(0.54),
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  sizedBoxHeight(26.h),
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child:
                                          SvgPicture.asset('assets/Path 39.svg')),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // 'The " Main" Mains Challenge',
                                    joinChallengeController.challengeModel!.data.challengeDetails.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Studio Pro",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.sp),
                                  ),
                                  sizedBoxHeight(10.h),
                                  Text(
                                    joinChallengeController.challengeModel!.data.challengeDetails.description,
                                    // "Let's bring 'main-course' to the forefront \nthis week",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                  ),
                                  sizedBoxHeight(113.h),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    centerTitle: true,
                  ),
                  expandedHeight: 363,
                  backgroundColor: Colors.white,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) => SingleChildScrollView(
                      // physics: BouncingScrollPhysics(),
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        // width: 20,
                        // height: 600,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Divider(
                              //     // color: const Color(0xff00000029),
                              //     ),
                              sizedBoxHeight(10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  // "12 Recipes Shared",
                                  joinChallengeController.challengeModel!.data.recipes.length > 0 
                                    ? "${joinChallengeController.challengeModel!.data.recipes.length} Recipes Shared"
                                    :"",
                                  style: TextStyle(
                                      color: const Color(0xff3B3F43),
                                      fontFamily: "StudioProM",
                                      fontSize: 18.sp),
                                ),
                              ),
                              sizedBoxHeight(10.h),
                              SizedBox(
                                  // height: 520.h,
                                  child:
                                      GetBuilder<ExploreController>(builder: (_) {
                                return joinChallengeController.challengeModel!.data.recipes.isEmpty 
                                ? Center(child: textgrey18BoldSP("No Recipe shared"))
                                : ListView.separated(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final recipeData = joinChallengeController.challengeModel!.data.recipes[index];
                                      return shareRecipeCard(
                                        recipeId: recipeData.recipe.id,
                                        coverImage: recipeData.recipe.coverImage, 
                                        recipeName: recipeData.recipe.name, 
                                        userName: recipeData.recipe.user.username, 
                                        numLikes: recipeData.likes, 
                                        numComments: recipeData.comments, 
                                        numSaves: recipeData.saves, 
                                        cookingTime: recipeData.recipe.cookingTime,
                                        liked: recipeData.liked,
                                        saved: recipeData.saved
                                      );
                                      // shareRecipeCard(like, save, index, coverImage: coverImage, recipeName: recipeName, userName: userName, numLikes: numLikes, numComments: numComments, numSaves: numSaves, cookingTime: cookingTime)
                                      // shareRecipeCard(
                                      //     controllerExplore.likeSave[index]["like"],
                                      //     controllerExplore.likeSave[index]["save"],
                                      //     index,

                                      // );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 15.h,
                                      );
                                    },
                                    itemCount: joinChallengeController.challengeModel!.data.recipes.length
                                    // 5
                                    );
                              })),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
        
        })
    
      ),
    );
  }

  Widget shareRecipeCard(
    // int like, int save, int index,
  {
    required String recipeId,
    required String coverImage,
    required String recipeName,
    required String userName,
    required bool liked,
    required bool saved,
    required int numLikes,
    required int numComments,
    required int numSaves,
    required String cookingTime,
K
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: InkWell(
        onTap: (){
          Get.toNamed("/InspirationRecipeComment",
            arguments: recipeId
          );
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: Colors.white,
          margin: const EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.fromLTRB(13.w, 13.h, 0, 16.4),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //         color: const Color(0xff707070),
            //         width: 0.2),
            //     borderRadius:
            //         BorderRadius.circular(10.r)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 112.h,
                  width: 133.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(ApiUrls.base + coverImage),
                        // AssetImage('assets/home/food.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                sizedBoxWidth(27.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "Slappappoffer Recipe",
                      recipeName,
                      style: TextStyle(
                          fontFamily: "StudioProM",
                          fontSize: 18.sp,
                          color: const Color(0xFF000000)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      // "@priyujoshi",
                      "@$userName",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14.sp,
                          color: const Color(0xff6B6B6B)),
                    ),
                    sizedBoxHeight(26.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconText(
                            liked
                                ? "assets/icons/like_filled.png"
                                : "assets/icons/like.png",
                            // "55", 
                            numLikes > 0 ? numLikes.toString() : "",
                            onTap: () {
                              _handleLikeButton(recipeId);
                          // controllerExplore.likeMethod(index, like);
                        }, 
                        // color: like ? AppColors.greyM707070 : null
                        ),
                        sizedBoxWidth(20.w),
                        iconText("assets/icons/comment.png", 
                        // "30",
                        numComments > 0 ? numComments.toString() : "",
                        //  onTap: () {
                        //   commentbottomSheet();
                        // }, 
                        // color: AppColors.greyM707070
                        ),
                        sizedBoxWidth(20.w),
                        iconText(
                            saved
                                ? "assets/icons/save_filled.png"
                                : "assets/icons/save.png",
                            // "55",
                            numSaves > 0 ? numSaves.toString() : "",
                            onTap: () {
                              _handleSaveButton(recipeId);
                          // controllerExplore.saveMethod(index, save);
                        }, 
                        // color: AppColors.greyM707070
                        ),
                        sizedBoxWidth(40.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset('assets/icons/time.svg',
                                width: 18.w,
                                height: 16.h,
                                // color: ,
                                color: AppColors.greyM707070),
                            sizedBoxWidth(2.w),
                            Text(
                              // '30 Min',
                              '$cookingTime Min',
      
                              // cookingTime,
                              style: TextStyle(
                                  fontFamily: 'Roboto', fontSize: 10.sp),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<T?> commentbottomSheet<T>() {
    return Get.bottomSheet(
      Container(
          height: 375.h,
          // color: AppColors.white,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),

            // padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // tileForlist()
                Expanded(child: GetBuilder<HomeController>(builder: (_) {
                  return ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: controllerHome.commentLike.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          tileForlist(
                              controllerHome.commentLike[index]["comment"],
                              controllerHome.commentLike[index]["like"],
                              index),
                          sizedBoxHeight(13.h)
                        ],
                      );
                    },
                  );
                })
                    // ListView.builder(
                    //   // physics: const NeverScrollableScrollPhysics(),
                    //   // shrinkWrap: true,
                    //   itemCount: 5,
                    //   itemBuilder: (context, index) {
                    //     return Column(
                    //       children: [
                    //         tileForlist(
                    //             controllerHome.commentLike[index]["comment"],
                    //             controllerHome.commentLike[index]["like"],
                    //             index),
                    //         sizedBoxHeight(13.h)
                    //       ],
                    //     );
                    //   },
                    // ),

                    ),

                sizedBoxHeight(15.h),

                CustomSearchTextFormField(
                    textEditingController: tecComment,
                    autofocus: false,
                    hintText: "Add a comment",
                    validatorText: '',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: SizedBox(
                          height: 50.h,
                          width: 40.w,
                          child: Center(
                              child: InkWell(
                                  onTap: () {
                                    if (tecComment.text.isNotEmpty) {
                                      // print(tecComment.text);
                                      controllerHome
                                          .commentMethod(tecComment.text);
                                      tecComment.clear();
                                    }
                                  },
                                  child: textgreyM14Sp("Send")))),
                    ))
              ],
            ),
          )),
      // barrierColor: Colors.red[50],
      // isDismissible: false,
    );
  }

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

  Widget iconText(String imagePath, String text,
      {void Function()? onTap, 
      // Color? color
      }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Image.asset(
            imagePath,
            width: 18.w,
            height: 16.h,
            // color: AppColors.greyM707070,
          ),
        ),
        sizedBoxHeight(10.h),
        textForFav(text)
      ],
    );
  }

  Widget textForFav(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 10.sp, fontFamily: "StudioProR"),
    );
  }
}
