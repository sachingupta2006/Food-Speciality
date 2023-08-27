import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/comman_comment.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/controllers/recipe_ingre_controller.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
import 'package:foodspeciality/screens/new_insp_reci_Comt.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/services/view_recipe_contro.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Model/Replies.dart';
import '../Model/recipe_details.dart';
import '../services/follow_service.dart';
import '../services/get_comments.dart';
import '../services/like_service.dart';
import '../services/save_recipe.dart';
import 'filter_bottom_sheet.dart';

class InspirationRecipeComment extends StatefulWidget {
  const InspirationRecipeComment({super.key});

  @override
  State<InspirationRecipeComment> createState() =>
      _InspirationRecipeCommentState();
}

class _InspirationRecipeCommentState extends State<InspirationRecipeComment>
    with SingleTickerProviderStateMixin {
  bool more = false;
  // late TabController _tabController;
  int _currentIndex = 0;
  int selectedVideoIndex = 0;
  final tecComment = TextEditingController();
  bool like = false;
  bool save = false;

  HomeController controllerHome = Get.put(HomeController());
  GetCommentsController commentsContoller = Get.put(GetCommentsController());

  ViewRecipeController viewRecipeController  = Get.put(ViewRecipeController());
  var isReply = false.obs;
  FocusNode _focusNode = FocusNode();
  String? commentIdForReply;

  


  List tags = [
    "Limpopo",
    "Simple greens",
    "Flavour explosions",
    "Limpopo",
    "Simple greens",
    "Flavour explosions"
  ];

  RecipeData? recipeDetailsData;

  List<AllrecipeDetails>? allUserRecipes;
  var recipeId;
  

  @override
  void initState() {
    super.initState();
    recipeId = Get.arguments;
    print(recipeId + " reci");
    viewRecipeController.getRecipeDetails(recipeId: recipeId);
    commentsContoller.getCommentsData(recipeId);
    viewRecipeController.getSimilarRecipe(recipeId: recipeId);

  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  // int _selectedIndex = 0;

  Color _getTabColor(int index) {
    if (_currentIndex == index) {
      return const Color(0xffE1E1E1);
    } else {
      return const Color.fromRGBO(84, 95, 90, 0.71);
    }
  }

  Color _getTextColor(int index) {
    if (_currentIndex == index) {
      return const Color(0xff000000);
    } else {
      return const Color(0xffFFFFFF);
    }
  }

  ScrollController? _scrollViewController;

  void _handleLikeButton(String id) async {
    try {
      var resp = await LikeService.likeRecipe(id);
      if (resp) {
        viewRecipeController.getRecipeDetails(recipeId: id);
        
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
        viewRecipeController.getRecipeDetails(recipeId: id);

        // setState(() {
        //   isSaved = !isSaved!;
        // });
      }
    } catch (e) {
      // Handle error here
      print('Error saving recipe: $e');
    }
  }

  void _handleFollowButton({required String userId, required String recipeId}) async {
    try {
      var resp = await FollowService.followRecipe(userId);
      if (resp) {
        viewRecipeController.getRecipeDetails(recipeId: recipeId);

        // setState(() {
        //   // isFollow = !isFollow!;
        // });
      }
    } catch (e) {
      // Handle error here
      print('Error Following user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        //   title: ,
        // ),
        body: SafeArea(
          child: GetBuilder<ViewRecipeController>(builder: (context){
            if (viewRecipeController.isLoadingRecipeDetails) {
              return Center(child: CircularProgressIndicator());
            } else if(viewRecipeController.recipeDetails == null){
              return Center(child: textgrey18BoldSP("Something went wrong"));
            }
            else {
              recipeDetailsData = viewRecipeController.recipeDetails!.data[0];
              allUserRecipes = viewRecipeController.recipeDetails!.allrecipeDetails;
              return GestureDetector(
                onTap: (){
                  isReply.value = false;
                  _focusNode.unfocus();
                },
                child: Column(
                  children: [
                    // sizedBoxHeight(8.h),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 258.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: 
                              NetworkImage(ApiUrls.base + "${recipeDetailsData!.coverImage}"),
                              // AssetImage("assets/Mask Group 14.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sizedBoxHeight(26.h),
                                    GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/Path 39.svg',
                                          height: 18.h,
                                          width: 27.w,
                                        )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      // onTap: (){
                                      onTap: () {
                                        Get.toNamed("/assetplayerwidget",
                                            arguments: {
                                              "videourl": recipeDetailsData!.video
                                            });
                                      },
                                      // },
                                      child: SvgPicture.asset(
                                        "assets/svg/media-play-circle-svgrepo-com.svg",
                                        height: 63.h,
                                        width: 63.h,
                                      ),
                                    ),
                                    sizedBoxHeight(30.h),
                                    sizedBoxHeight(5.h),
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.9),
                                          blurRadius: 25.0, // soften the shadow
                                          spreadRadius: 20.0, //extend the shadow
                                          offset: const Offset(
                                            5.0, // Move to right 5  horizontally
                                            5.0, // Move to bottom 5 Vertically
                                          ),
                                        )
                                      ]),
                                      height: 35.h,
                                      width: double.infinity,
                                      child: Text(
                                        // "Chomolia Recipe",
                                        recipeDetailsData!.name,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20.sp),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        height: 27.h,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return SizedBox(width: 5.w);
                                          },
                                          scrollDirection: Axis.horizontal,
                                          physics: const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: recipeDetailsData!.tags.length,
                                          // tags.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedVideoIndex = index;
                                                  // listCardData[index]["selectedVideoInde"] = index;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(15.h),
                                                    color: index == selectedVideoIndex
                                                        ? AppColors.white
                                                            .withOpacity(0.7)
                                                        : AppColors.greyD3B3F43
                                                            .withOpacity(0.7)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 7.w, vertical: 5.h),
                                                  child: selectedVideoIndex == index
                                                      ? textgreyD12Robo(recipeDetailsData!.tags[index].tag.name)
                                                      : textWhite12Robo(recipeDetailsData!.tags[index].tag.name),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    sizedBoxHeight(8.h),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 80.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                                sizedBoxWidth(3.w),
                                Text(
                                  // "30 Min",
                                  recipeDetailsData!.cookingTime + " Min",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'StudioProM',
                                      fontSize: 12.sp,
                                      color: const Color(0xffFFFFFF)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              
                    DataTabBarView()
                    // Expanded(
                    //   child: SizedBox(
                    //     // height: MediaQuery.of(context).size.height,
                    //     child: TabBarView(
                    //       controller: _tabController,
                    //       children: [
                    //         DataTabBarView(),
                    //         DataTabBarView(),
                    //         DataTabBarView(),
                    //         DataTabBarView()
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
          
            }
          
          })
          
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DataTabBarView() {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                backgroundColor: AppColors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                toolbarHeight: 280.h,
                pinned: true,
                floating: true,
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxHeight(5.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // sizedBoxHeight(5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // sizedBoxWidth(5.h),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        _handleLikeButton(recipeDetailsData!.id);
                                        // setState(() {
                                        //   like = !like;
                                        // });
                                      },
                                      child: !recipeDetailsData!.liked
                                          ? Image.asset(
                                              'assets/icons/like.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )
                                          : Image.asset(
                                              'assets/icons/like_filled.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )),
                                  Text(
                                    // '23k',
                                    recipeDetailsData!.likes > 0 ? recipeDetailsData!.likes.toString() : "",
                                    style: TextStyle(
                                        color: const Color(0xff020202),
                                        fontSize: 10.sp),
                                  )
                                ],
                              ),
                              sizedBoxWidth(20.w),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      commentbottomSheet(controllerHome);
                                    },
                                    child: Image.asset(
                                      'assets/icons/comment.png',
                                      height: 18.h,
                                      width: 20.w,
                                    ),
                                  ),
                                  Text(
                                    recipeDetailsData!.comments > 0 ? recipeDetailsData!.comments.toString() : "",
                                    style: TextStyle(
                                        color: const Color(0xff020202),
                                        fontSize: 10.sp),
                                  )
                                ],
                              ),
                              sizedBoxWidth(20.w),
                              InkWell(
                                onTap: share,
                                child: SvgPicture.asset(
                                  'assets/share-svgrepo-com.svg',
                                  height: 18.h,
                                  width: 20.w,
                                  // color: AppColors.greyD3B3F43,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        _handleSaveButton(recipeDetailsData!.id);
                                        // setState(() {
                                        //   save = !save;
                                        // });
                                        // save = !save;
                                      },
                                      child: !recipeDetailsData!.saved
                                          ? Image.asset(
                                              'assets/icons/save.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )
                                          : Image.asset(
                                              'assets/icons/save_filled.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )),
                                  // Text(
                                  //   '50',
                                  //   style: TextStyle(
                                  //       color: const Color(0xff020202),
                                  //       fontSize: 10.sp),
                                  // )
                                ],
                              ),
                              // sizedBoxWidth(16),
                            ],
                          ),
                        ],
                      ),
                      sizedBoxHeight(22.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 32.r,
                              //   backgroundColor: Colors.grey,
                              //   child: Image(
                              //     image: NetworkImage(ApiUrls.base + "${recipeDetailsData.user.profileImage}")
                              //           // AssetImage("assets/Mask Group 40.png")),
                              //   )
                              // ),
                              Container(
                                width: 64.h,
                                height: 64.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.h),
                                    image: 
                                                  recipeDetailsData!.user.profileImage == null 
                                                  ? DecorationImage(
                                                      image: 
                                                      // recipeData.user.profileImage == null 
                                                      // ? 
                                                      AssetImage("assets/default_profile.webp"),
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
                                                          ApiUrls.base + "${recipeDetailsData!.user.profileImage}"),
                                                      fit: BoxFit.fill)
                                  //   image:  DecorationImage(
                                  //       // image: 
                                  // image: NetworkImage(ApiUrls.base + "${recipeDetailsData!.user.profileImage}"),

                                  //       // AssetImage("assets/home/profile.png"),
                                  //       fit: BoxFit.cover)
                                        ),
                              ),
                              sizedBoxWidth(9.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Namrata Burondkar",
                                    recipeDetailsData!.user.firstName + " " + recipeDetailsData!.user.lastName,
                                    style: TextStyle(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff979797),
                                        
                                        ),
                                  ),
                                  Text(
                                    // "@Namrata0",
                                    "@${recipeDetailsData!.user.username}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff979797),
                                    ),
                                  ),
                                  sizedBoxHeight(5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 16.sp,
                                        color: const Color(0xff54595F),
                                      ),
                                      Text(
                                        // "South Africa",
                                        recipeDetailsData!.user.location??"",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xff54595F)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          myUserId == recipeDetailsData!.user.id 
                          ? SizedBox()
                        
                          : GestureDetector(
                            onTap: () {
                              _handleFollowButton(
                                userId: recipeDetailsData!.user.id,
                                recipeId: recipeDetailsData!.id
                                // recipeDetailsData!.user.id
                              );
                              // print("pressed");
                              // _handleFollowButton(
                              //     recipeData.user!.id!);
                            },
                            child: recipeDetailsData!.following
                            // recipeData!.following!
                                ? Container(
                                    //     width: 60.w,
                                    // height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(
                                              8.r),
                                      border: Border.all(
                                        color: const Color(
                                            0xFF3B3F43),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(5.h),
                                      child: Center(
                                        child: textgreyD14Robo(
                                            "Following"),
                                      ),
                                    ),
                                  )
                                : Container(
                                    //  width: 80.w,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.greyD3B3F43,
                                      borderRadius:
                                          BorderRadius.circular(
                                              8.r),
                                      border: Border.all(
                                          color: Colors
                                              .grey.shade700),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(5.h),
                                      child: Center(
                                        child: textWhite14Robo(
                                            "Follow"),
                                      ),
                                    ),
                                  ),
                          ),
                      
                          // Container(
                          //   width: 80.w,
                          //   // height: 30,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(8.r),
                          //     border: Border.all(
                          //       color: Color(0xFF3B3F43),
                          //     ),
                          //   ),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(5.h),
                          //     child: Center(child: textgreyD14Robo("Following")
                          //         // Text(
                          //         //   "Following",
                          //         //   style: TextStyle(
                          //         //     fontFamily: "StudioProR",
                          //         //     fontSize: 14.sp,
                          //         //     fontWeight: FontWeight.w500,
                          //         //     color: Color(0xFF3B3F43),
                          //         //   ),
                          //         // ),
                          //         ),
                          //   ),
                          // ),
                     
                        ],
                      ),

                      sizedBoxHeight(13.h),

                      Text(
                        recipeDetailsData!.description,
                          // "Lorem Ipsum is simply dummy text of the printing and ty..",
                          // maxLines: more ? null : 1,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              color: const Color(0xff6B6B6B))),

                      sizedBoxHeight(15.h),

                      const Divider(thickness: 0.3, color: Color(0xff707070)),

                      sizedBoxHeight(15.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/Group 58247.svg",
                            height: 36.h,
                          ),
                          sizedBoxWidth(3.5.w),
                          Text(
                            "${recipeDetailsData!.servings} Serving",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15.sp,
                                color: const Color(0xff000000)),
                          ),
                          sizedBoxWidth(11.5.w),
                          SvgPicture.asset(
                            "assets/svg/Group 58248.svg",
                            height: 36.h,
                          ),
                          sizedBoxWidth(3.5.w),
                          Text(
                            "${recipeDetailsData!.cookingTime} Minutes",
                            // recipeDetailsData.cookingTime 
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15.sp,
                                color: const Color(0xff000000)),
                          ),
                        ],
                      ),

                      sizedBoxHeight(15.h),

                      //     Column(
                      //       children: [
                      //         Column(
                      //           children: [
                      //             PreferredSize(
                      //               preferredSize: const Size.fromHeight(20),
                      //               child: TabBar(
                      //                 // controller: _tabController,
                      //                 indicator: UnderlineTabIndicator(
                      //                   borderRadius: BorderRadius.circular(10),
                      //                   borderSide: BorderSide(width: 2.5.sp),
                      //               // insets: EdgeInsets.symmetric(horizontal: 80.w),
                      //                 ),
                      //                 indicatorSize: TabBarIndicatorSize.tab,
                      //                 indicatorPadding:
                      //                 const EdgeInsets.symmetric(horizontal: 50),
                      //                 // indicatorWeight: 4,

                      //                 indicatorColor: const Color(0xFF3B3F43),
                      //                 unselectedLabelStyle:
                      //                 const TextStyle(color: Color(0xFF6B6B6B)),
                      //                 labelColor: const Color.fromRGBO(59, 63, 67, 1),
                      //                 labelStyle: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 18.sp,
                      //                 ),
                      //                 tabs: [
                      //                   Tab(
                      //                     child: Text(
                      //                       "Recipe",
                      //                       style: TextStyle(
                      //                           fontFamily: "StudioProM", fontSize: 17.sp),
                      //                     ),
                      //                   ),
                      //                   Tab(
                      //                     child: Text(
                      //                       "Comments",
                      //                       style: TextStyle(
                      //                           fontFamily: "StudioProM", fontSize: 17.sp),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),

                      //             // Expanded(
                      //             //   child: TabBarView(
                      //             //   // physics: NeverScrollableScrollPhysics(),
                      //             //     children: [
                      //             //       _recipeTabbarView(),
                      //             //       Padding(
                      //             //         padding: EdgeInsets.symmetric(horizontal: 22.w),
                      //             //         child: _commentTabbarView(),
                      //             //       )
                      //             //     ]
                      //             //   ),
                      //             // )

                      //             // SizedBox(
                      //             //     // height: 200.h,
                      //             //     child: TabBarView(
                      //             //       // physics: NeverScrollableScrollPhysics(),
                      //             //         children: [
                      //             //           _recipeTabbarView(),
                      //             //           Padding(
                      //             //             padding: EdgeInsets.symmetric(horizontal: 22.w),
                      //             //             child: _commentTabbarView(),
                      //             //           )
                      //             //         ])
                      //             // ),
                      //           ],
                      //         ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                bottom: CommanTabbarTab("Recipe", "Comments")
                // TabBar(
                //   // overlayColor: ,
                //   // color
                //       // controller: _tabController,
                //   indicator: UnderlineTabIndicator(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(width: 2.5.sp),
                //   // insets: EdgeInsets.symmetric(horizontal: 80.w),
                //   ),
                //   indicatorSize: TabBarIndicatorSize.tab,
                //   indicatorPadding:
                //   const EdgeInsets.symmetric(horizontal: 50),
                //   // indicatorWeight: 4,

                //   indicatorColor: const Color(0xFF3B3F43),
                //   unselectedLabelStyle:
                //   const TextStyle(color: Color(0xFF6B6B6B)),
                //   labelColor: const Color.fromRGBO(59, 63, 67, 1),
                //   labelStyle: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 18.sp,
                //   ),
                //   tabs: [
                //     Tab(
                //       child: Text(
                //         "Recipe",
                //         style: TextStyle(
                //             fontFamily: "StudioProM", fontSize: 17.sp),
                //       ),
                //     ),
                //     Tab(
                //       child: Text(
                //         "Comments",
                //         style: TextStyle(
                //             fontFamily: "StudioProM", fontSize: 17.sp),
                //       ),
                //     ),
                //   ],
                // ),

                )
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     childCount: 1,
            //         (context, index) =>Column(
            //           children: [
            //             sizedBoxHeight(22.h),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     sizedBoxWidth(16),
            //                     Column(
            //                       children: [
            //                         Image.asset(
            //                           'assets/icons/like.png',
            //                           height: 17.h,
            //                         ),
            //                         Text(
            //                           '23k',
            //                           style: TextStyle(
            //                               color: const Color(0xff020202), fontSize: 10.sp),
            //                         )
            //                       ],
            //                     ),
            //                     sizedBoxWidth(20.w),
            //                     Column(
            //                       children: [
            //                         Image.asset(
            //                           'assets/icons/comment.png',
            //                           height: 17.h,
            //                         ),
            //                         Text(
            //                           '150',
            //                           style: TextStyle(
            //                               color: const Color(0xff020202), fontSize: 10.sp),
            //                         )
            //                       ],
            //                     ),
            //                     sizedBoxWidth(20.w),
            //                     SvgPicture.asset(
            //                       'assets/share-svgrepo-com.svg',
            //                       height: 17.h,
            //                     )
            //                   ],
            //                 ),
            //                 Row(
            //                   children: [
            //                     Column(
            //                       children: [
            //                         Image.asset(
            //                           'assets/bookmark-svgrepo-com.png',
            //                           height: 19.h,
            //                         ),
            //                         Text(
            //                           '50',
            //                           style: TextStyle(
            //                               color: const Color(0xff020202), fontSize: 10.sp),
            //                         )
            //                       ],
            //                     ),
            //                     sizedBoxWidth(16),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             sizedBoxHeight(22.h),
            //             Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 16.w),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       CircleAvatar(
            //                         radius: 32.r,
            //                         backgroundColor: Colors.grey,
            //                         child: const Image(
            //                             image: AssetImage("assets/Mask Group 40.png")),
            //                       ),
            //                       sizedBoxWidth(9.w),
            //                       Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             "Namrata Burondkar",
            //                             style: TextStyle(
            //                                 fontSize: 16.h, fontWeight: FontWeight.bold),
            //                           ),
            //                           Text(
            //                             "@Namrata07",
            //                             style: TextStyle(
            //                               fontSize: 14.sp,
            //                               color: const Color(0xff979797),
            //                             ),
            //                           ),
            //                           sizedBoxHeight(5.h),
            //                           Row(
            //                             mainAxisAlignment: MainAxisAlignment.start,
            //                             children: [
            //                               Icon(
            //                                 Icons.location_on_outlined,
            //                                 size: 16.sp,
            //                                 color: const Color(0xff54595F),
            //                               ),
            //                               Text(
            //                                 "South Africa",
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(
            //                                     fontSize: 14.sp,
            //                                     color: const Color(0xff54595F)),
            //                               ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 31.h,
            //                     child: ElevatedButton(
            //                         style: ElevatedButton.styleFrom(
            //                             side: BorderSide(
            //                                 width: 1.sp, color: const Color(0xff3B3F43)),
            //                             elevation: 0,
            //                             backgroundColor: Colors.white,
            //                             shape: RoundedRectangleBorder(
            //                                 borderRadius: BorderRadius.circular(8.sp))),
            //                         onPressed: () {
            //                           FilterBottomSheet();
            //                           // Get.to(const RecipeIngredientsTapbar());
            //                           // Get.to(const FilterBottomSheet());
            //                         },
            //                         child: Text(
            //                           "Following",
            //                           style: TextStyle(
            //                               fontFamily: 'Studio Pro',
            //                               fontSize: 15.sp,
            //                               color: const Color(0xff3B3F43)),
            //                         )),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             sizedBoxHeight(13.h),
            //             Column(
            //               children: [
            //                 Text("Lorem Ipsum is simply dummy text of the printing and ty..",
            //                     maxLines: more ? null : 1,
            //                     style: TextStyle(
            //                         fontSize: 14.sp,
            //                         fontFamily: 'Roboto',
            //                         color: const Color(0xff6B6B6B))),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   children: [
            //                     Padding(
            //                       padding: EdgeInsets.only(right: 23.w),
            //                       child: GestureDetector(
            //                         onTap: () {
            //                           setState(() {
            //                             more = !more;
            //                           });
            //                         },
            //                         child: Text(
            //                           more ? 'Less' : 'More',
            //                           style: TextStyle(
            //                               color: const Color(0xff3B3F43),
            //                               fontWeight: FontWeight.w500,
            //                               fontFamily: 'Roboto',
            //                               fontSize: 12.sp),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             sizedBoxHeight(14.h),
            //             const Divider(thickness: 0.3, color: Color(0xff707070)),
            //             sizedBoxHeight(21.h),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 SvgPicture.asset(
            //                   "assets/svg/Group 58247.svg",
            //                   height: 36.h,
            //                 ),
            //                 sizedBoxWidth(3.5.w),
            //                 Text(
            //                   "10 Serving",
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                       fontFamily: 'Roboto',
            //                       fontSize: 15.sp,
            //                       color: const Color(0xff000000)),
            //                 ),
            //                 sizedBoxWidth(11.5.w),
            //                 SvgPicture.asset(
            //                   "assets/svg/Group 58248.svg",
            //                   height: 36.h,
            //                 ),
            //                 sizedBoxWidth(3.5.w),
            //                 Text(
            //                   "30 Minutes",
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                       fontFamily: 'Roboto',
            //                       fontSize: 15.sp,
            //                       color: const Color(0xff000000)),
            //                 ),
            //               ],
            //             ),

            //             Column(
            //               children: [
            //                 Column(
            //                   children: [
            //                     PreferredSize(
            //                       preferredSize: const Size.fromHeight(20),
            //                       child: TabBar(
            //                         // controller: _tabController,
            //                         indicator: UnderlineTabIndicator(
            //                           borderRadius: BorderRadius.circular(10),
            //                           borderSide: BorderSide(width: 2.5.sp),
            //                       // insets: EdgeInsets.symmetric(horizontal: 80.w),
            //                         ),
            //                         indicatorSize: TabBarIndicatorSize.tab,
            //                         indicatorPadding:
            //                         const EdgeInsets.symmetric(horizontal: 50),
            //                         // indicatorWeight: 4,

            //                         indicatorColor: const Color(0xFF3B3F43),
            //                         unselectedLabelStyle:
            //                         const TextStyle(color: Color(0xFF6B6B6B)),
            //                         labelColor: const Color.fromRGBO(59, 63, 67, 1),
            //                         labelStyle: TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 18.sp,
            //                         ),
            //                         tabs: [
            //                           Tab(
            //                             child: Text(
            //                               "Recipe",
            //                               style: TextStyle(
            //                                   fontFamily: "StudioProM", fontSize: 17.sp),
            //                             ),
            //                           ),
            //                           Tab(
            //                             child: Text(
            //                               "Comments",
            //                               style: TextStyle(
            //                                   fontFamily: "StudioProM", fontSize: 17.sp),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),

            //                     // Expanded(
            //                     //   child: TabBarView(
            //                     //   // physics: NeverScrollableScrollPhysics(),
            //                     //     children: [
            //                     //       _recipeTabbarView(),
            //                     //       Padding(
            //                     //         padding: EdgeInsets.symmetric(horizontal: 22.w),
            //                     //         child: _commentTabbarView(),
            //                     //       )
            //                     //     ]
            //                     //   ),
            //                     // )

            //                     // SizedBox(
            //                     //     // height: 200.h,
            //                     //     child: TabBarView(
            //                     //       // physics: NeverScrollableScrollPhysics(),
            //                     //         children: [
            //                     //           _recipeTabbarView(),
            //                     //           Padding(
            //                     //             padding: EdgeInsets.symmetric(horizontal: 22.w),
            //                     //             child: _commentTabbarView(),
            //                     //           )
            //                     //         ])
            //                     // ),
            //                   ],
            //                 ),
            //           ],
            //         )

            //           ],
            //         )
            //   ),
            // ),
          ];
        },
        body: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            children: [_recipeTabbarView(), _commentTabbarView()]),
        //     Column(
        //       children: [
        //         DefaultTabController(
        //           length: 2,
        //           child:
        //           Column(
        //             children: [
        //               PreferredSize(
        //                 preferredSize: const Size.fromHeight(20),
        //                 child: TabBar(
        //                   // controller: _tabController,
        //                   indicator: UnderlineTabIndicator(
        //                     borderRadius: BorderRadius.circular(10),
        //                     borderSide: BorderSide(width: 2.5.sp),
        //                 // insets: EdgeInsets.symmetric(horizontal: 80.w),
        //                   ),
        //                   indicatorSize: TabBarIndicatorSize.tab,
        //                   indicatorPadding:
        //                   const EdgeInsets.symmetric(horizontal: 50),
        //                   // indicatorWeight: 4,

        //                   indicatorColor: const Color(0xFF3B3F43),
        //                   unselectedLabelStyle:
        //                   const TextStyle(color: Color(0xFF6B6B6B)),
        //                   labelColor: const Color.fromRGBO(59, 63, 67, 1),
        //                   labelStyle: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 18.sp,
        //                   ),
        //                   tabs: [
        //                     Tab(
        //                       child: Text(
        //                         "Recipe",
        //                         style: TextStyle(
        //                             fontFamily: "StudioProM", fontSize: 17.sp),
        //                       ),
        //                     ),
        //                     Tab(
        //                       child: Text(
        //                         "Comments",
        //                         style: TextStyle(
        //                             fontFamily: "StudioProM", fontSize: 17.sp),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),

        //               // Expanded(
        //               //   child: TabBarView(
        //               //   // physics: NeverScrollableScrollPhysics(),
        //               //     children: [
        //               //       _recipeTabbarView(),
        //               //       Padding(
        //               //         padding: EdgeInsets.symmetric(horizontal: 22.w),
        //               //         child: _commentTabbarView(),
        //               //       )
        //               //     ]
        //               //   ),
        //               // )

        //               // SizedBox(
        //               //     // height: 200.h,
        //               //     child: TabBarView(
        //               //       // physics: NeverScrollableScrollPhysics(),
        //               //         children: [
        //               //           _recipeTabbarView(),
        //               //           Padding(
        //               //             padding: EdgeInsets.symmetric(horizontal: 22.w),
        //               //             child: _commentTabbarView(),
        //               //           )
        //               //         ])
        //               // ),
        //             ],
        //           ),

        //     ),
        //   ],
        // )
      ),
    );
  }

  Widget OtherRecipeCard({
    required String coverImage, 
    required String recipeName,
    required String userName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 93.h,
          width: 115.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ApiUrls.base + coverImage)
                  // AssetImage('assets/Chocolate 2.png')
                  ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9.r),
                  topRight: Radius.circular(9.r))),
        ),
        Material(
          borderRadius: BorderRadius.circular(9.sp),
          elevation: 1.2,
          child: Container(
            // height: 49.h,
            width: 115.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(9.r),
                    bottomRight: Radius.circular(9.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight(3.5.h),
                Padding(
                  padding: EdgeInsets.only(left: 7.4.w),
                  child: Text(
                    // 'Slappappoffer Recipe',
                    recipeName,
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 10.sp),
                  ),
                  // sizedBoxWidth(16.w),
                  // Image.asset(
                  //   'assets/icons/save.png',
                  //   height: 9.h,
                  //   width: 6.8.w,

                  // ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.4.w),
                  child: Text(
                    // '@Priyujoshi',
                    "@$userName",
                    style: TextStyle(
                        color: const Color(0xff6B6B6B),
                        fontSize: 8.sp,
                        fontFamily: 'Roboto'),
                  ),
                ),
                sizedBoxHeight(5.h),
                Row(
                  children: [
                    sizedBoxWidth(8.w),
                    Image.asset(
                      'assets/like-svgrepo-com.png',
                      height: 10.h,
                      width: 11.8.w,
                    ),
                    Text(
                      '23k',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 6.sp),
                    ),
                    sizedBoxWidth(16.w),
                    Image.asset(
                      'assets/comment-blank-svgrepo-com.png',
                      height: 9.7.h,
                      width: 10.18.w,
                    ),
                    Text(
                      '150',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 6.sp),
                    ),
                    sizedBoxWidth(16.w),
                    Image.asset(
                      'assets/bookmark-svgrepo-com.png',
                      height: 9.h,
                      width: 6.8.w,
                    ),
                    Text(
                      '50',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 6.sp),
                    ),
                  ],
                ),
                sizedBoxHeight(3.5.h),

                // sizedBoxHeight(5.h)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _recipeTabbarView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(22.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                sizedBoxHeight(11.h),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recipeDetailsData!.ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredientData = recipeDetailsData!.ingredients[index];
                    return ingredientsTile(
                      ingredientName: ingredientData.name,
                      quantity: ingredientData.quantity
                    );
                  },
                ),
                // ListView.builder(itemBuilder: itemBuilder)
               
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Instructions",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                sizedBoxHeight(15.h),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recipeDetailsData!.instruction.length,
                  itemBuilder: (context, index) {
                    final instructionData = recipeDetailsData!.instruction[index];
                    return instructionTile(
                      index: index,
                      instructionText: instructionData.instructions,
                      imageUrl: instructionData.coverImage?? ""
                    );
                  },
                ),

                // sizedBoxHeight(42.h),
              ],
            ),
            // const Divider(
            //   height: 0,
            // ),
            sizedBoxHeight(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    'Other Recipes By @${recipeDetailsData!.user.username}',
                    style: TextStyle(fontSize: 17.sp, fontFamily: 'StudioProM'),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: SizedBox(
                      height: 155.h,
                      child: ListView.separated(
                        itemCount: allUserRecipes!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final recipeData = allUserRecipes![index];
                          return OtherRecipeCard(
                            coverImage: recipeData.coverImage!,
                            recipeName: recipeData.name,
                            userName: recipeDetailsData!.user.username

                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 11.3.w,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Similar Recipes',
                  style: TextStyle(fontSize: 17.sp, fontFamily: 'StudioProM'),
                ),
              ],
            ),
            sizedBoxHeight(20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  SizedBox(
                    height: 150.h,
                    child: GetBuilder<ViewRecipeController>(builder: (context){
                      return viewRecipeController.isLoadingSimilarRecipe 
                      ? Center(child: CircularProgressIndicator())
                      : viewRecipeController.similarRecipesData == null 
                      ? Center(child: textgrey18BoldSP("Something went wrong"))
                      : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final recipeData = viewRecipeController.similarRecipesData!.similarRecipes[index];
                          return OtherRecipeCard(
                            coverImage: recipeData.coverImage,
                            recipeName: recipeData.name,
                            userName: recipeData.user.username

                          );
                          // return OtherRecipeCard();
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       height: 93.h,
                          //       width: 115.w,
                          //       decoration: BoxDecoration(
                          //           image: const DecorationImage(
                          //               fit: BoxFit.cover,
                          //               image: AssetImage(
                          //                   'assets/Chocolate 2.png')),
                          //           borderRadius: BorderRadius.only(
                          //               topLeft: Radius.circular(9.r),
                          //               topRight: Radius.circular(9.r))),
                          //       // child: Image.asset(
                          //       //   'assets/Chocolate 2.png',
                          //       //   fit: BoxFit.cover,
                          //       // ),
                          //     ),
                          //     Material(
                          //       borderRadius: BorderRadius.circular(9.sp),
                          //       elevation: 1.2,
                          //       child: Container(
                          //         height: 49.h,
                          //         width: 115.w,
                          //         decoration: BoxDecoration(
                          //             color: Colors.white,
                          //             borderRadius: BorderRadius.only(
                          //                 bottomLeft: Radius.circular(9.r),
                          //                 bottomRight: Radius.circular(9.r))),
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             sizedBoxHeight(3.5.h),
                          //             Padding(
                          //               padding: EdgeInsets.only(left: 7.4.w),
                          //               child: Text(
                          //                 'Slappappoffer Recipe',
                          //                 style: TextStyle(
                          //                     fontSize: 8.sp,
                          //                     fontFamily: 'Roboto'),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsets.only(left: 7.4.w),
                          //               child: Text(
                          //                 '@Priyujoshi',
                          //                 style: TextStyle(
                          //                     color: const Color(0xff6B6B6B),
                          //                     fontSize: 5.sp,
                          //                     fontFamily: 'Roboto'),
                          //               ),
                          //             ),
                          //             Row(
                          //               children: [
                          //                 sizedBoxWidth(8.w),
                          //                 Image.asset(
                          //                   'assets/like-svgrepo-com.png',
                          //                   height: 10.h,
                          //                   width: 11.8.w,
                          //                 ),
                          //                 Text(
                          //                   '23k',
                          //                   style: TextStyle(
                          //                       fontFamily: 'Roboto',
                          //                       fontSize: 6.sp),
                          //                 ),
                          //                 sizedBoxWidth(16.w),
                          //                 Image.asset(
                          //                   'assets/comment-blank-svgrepo-com.png',
                          //                   height: 9.7.h,
                          //                   width: 10.18.w,
                          //                 ),
                          //                 Text(
                          //                   '150',
                          //                   style: TextStyle(
                          //                       fontFamily: 'Roboto',
                          //                       fontSize: 6.sp),
                          //                 ),
                          //                 sizedBoxWidth(16.w),
                          //                 Image.asset(
                          //                   'assets/bookmark-svgrepo-com.png',
                          //                   height: 9.h,
                          //                   width: 6.8.w,
                          //                 ),
                          //                 Text(
                          //                   '50',
                          //                   style: TextStyle(
                          //                       fontFamily: 'Roboto',
                          //                       fontSize: 6.sp),
                          //                 ),
                          //               ],
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 11.3.w,
                          );
                        },
                        itemCount: viewRecipeController.similarRecipesData!.similarRecipes.length
                        );
                  
                    })
                    
                  ),
                ],
              ),
            )
          ],
        ),
          ]
      ),
      )
    );
  }

  Widget _commentTabbarView() {
    // String? commentIdForReply;

    // var isReply = false.obs;
    // FocusNode _focusNode = FocusNode();
    GetCommentsController commentsContoller = Get.put(GetCommentsController());



    return GetBuilder<GetCommentsController>(builder: (context) {
      return GestureDetector(
        onTap: (){
          isReply.value = false;
          _focusNode.unfocus();
        },
        child: Container(
            // height: 375.h,
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
                    return commentsContoller.comments == null
                        ? Center(child: CircularProgressIndicator())
                        : commentsContoller.comments!.data.isEmpty
                            ? Center(child: textBlack14Robo("No comments"))
                            : ListView.builder(
                                // physics: const NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                // itemCount: controllerHome.commentLike.length,
                                itemCount: commentsContoller.comments!.data.length,
        
                                itemBuilder: (context, index) {
                                  final commentData =
                                      commentsContoller.comments!.data[index];
                                  String originalDate = commentData.createdAt;
                                  DateTime parsedDate =
                                      DateTime.parse(originalDate);
                                  String formattedDate =
                                      DateFormat('dd/mm/yyyy').format(parsedDate);
                                  return Column(
                                    children: [
                                      tileForlist(
                                          profileImage:
                                              commentData.user.profileImage,
                                          userName: commentData.user.firstName +
                                              " " +
                                              commentData.user.lastName,
                                          comment: commentData.comment,
                                          likedStatus: commentData.liked,
                                          likeNo: commentData.likedComments.length,
                                          commentId: commentData.id,
                                          recipeId: recipeId,
                                          numReplies: commentData.repliesLength,
                                          dateTime: formattedDate),
                                      // tileForlist(
                                      //     // controllerHome.commentLike[index]["comment"],
                                      //     commentData.comment,
                                      //     // commentData.likedComments.length,
                                      //     controllerHome.commentLike[index]["like"],
                                      //     ),
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
        
                  Obx(() => CustomSearchTextFormField(
                    textEditingController: tecComment,
                    autofocus: false,
                    focusNode: _focusNode,
                    hintText: isReply.value ? "Add a reply" :"Add a comment",
                    validatorText: '',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: SizedBox(
                          height: 50.h,
                          width: 40.w,
                          child: Center(
                              child: InkWell(
                                  onTap: () async {
                                    if (tecComment.text.isNotEmpty) {
                                      // print(tecComment.text);
                                      // controllerHome
                                      //     .commentMethod(tecComment.text);
                                      if (isReply.value) { //for reply
                                        commentsContoller.addReplyApi(
                                          reply: tecComment.text, 
                                          commentId: commentIdForReply!,
                                          recipeId: recipeId
                                        );
                                        tecComment.clear();
                                        isReply.value = false;

                                      } else { // for comment
                                        var resp = await commentsContoller.addCommentApi(
                                            commment: tecComment.text,
                                            recipeId: recipeId);
                                        if (resp!) {
                                          setState(() {
                                            
                                          });
                                        }
                                        tecComment.clear();
                                      }
                                      
                                    }
                                  },
                                  child: textgreyM14Sp("Send")))),
                    )))
                  
                ],
              ),
            ),
          ),
     
      );
    });
   
    // return Container(
    //     height: 375.h,
    //     // color: AppColors.white,
    //     decoration: BoxDecoration(
    //         color: AppColors.white,
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(20.h),
    //             topRight: Radius.circular(20.h))),
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),

    //       // padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           // tileForlist()
    //           Expanded(child: GetBuilder<HomeController>(builder: (_) {
    //             return ListView.builder(
    //               // physics: const NeverScrollableScrollPhysics(),
    //               // shrinkWrap: true,
    //               itemCount: controllerHome.commentLike.length,
    //               itemBuilder: (context, index) {
    //                 return Column(
    //                   children: [
    //                     tileForlist(
    //                         controllerHome.commentLike[index]["comment"],
    //                         controllerHome.commentLike[index]["like"],
    //                         index,
    //                         controllerHome),
    //                     sizedBoxHeight(13.h)
    //                   ],
    //                 );
    //               },
    //             );
    //           })
    //               // ListView.builder(
    //               //   // physics: const NeverScrollableScrollPhysics(),
    //               //   // shrinkWrap: true,
    //               //   itemCount: 5,
    //               //   itemBuilder: (context, index) {
    //               //     return Column(
    //               //       children: [
    //               //         tileForlist(
    //               //             controllerHome.commentLike[index]["comment"],
    //               //             controllerHome.commentLike[index]["like"],
    //               //             index),
    //               //         sizedBoxHeight(13.h)
    //               //       ],
    //               //     );
    //               //   },
    //               // ),

    //               ),

    //           sizedBoxHeight(15.h),

    //           CustomSearchTextFormField(
    //               textEditingController: tecComment,
    //               autofocus: false,
    //               hintText: "Add a comment",
    //               validatorText: '',
    //               suffixIcon: Padding(
    //                 padding: EdgeInsets.only(right: 15.w),
    //                 child: SizedBox(
    //                     height: 50.h,
    //                     width: 40.w,
    //                     child: Center(
    //                         child: InkWell(
    //                             onTap: () {
    //                               if (tecComment.text.isNotEmpty) {
    //                                 // print(tecComment.text);
    //                                 controllerHome
    //                                     .commentMethod(tecComment.text);
    //                                 tecComment.clear();
    //                               }
    //                             },
    //                             child: textgreyM14Sp("Send")))),
    //               ))
    //         ],
    //       ),
    //     ));
 
  }

  Widget tileForlist(
      {required String userName,
      required String comment,
      String? profileImage,
      required bool likedStatus,
      required int likeNo,
      required String commentId,
      required String recipeId,
      required String dateTime,
      required int numReplies

      // required String date
      }) {
    var viewReply = false.obs;
    Replies? replies;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35.h,
          height: 35.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.h),
              image: 
                profileImage == null 
                ? DecorationImage(
                    image: 
                    // recipeData.user.profileImage == null 
                    // ? 
                    AssetImage("assets/default_profile.webp"),
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
                        ApiUrls.base + profileImage),
                    fit: BoxFit.fill)
              // image: const DecorationImage(
              //     image: AssetImage("assets/home/profile.png"),
              //     fit: BoxFit.fill)
                ),
        ),
        sizedBoxWidth(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // textWhite17w500("George Smith"),
            // e=
            // textBlack16SP("Chaitali tatkare"),
            textBlack16SP(userName),

            sizedBoxHeight(5.h),

            // textgreyD12Robo("2 Days ago")
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  color: AppColors.greyLtEBEBEB),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                // child: textgreyD10Robo("11:36"),
                child: textgreyD10Robo(dateTime),
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
                        commentsContoller.likeCommentApi(
                            commentId: commentId, recipeId: recipeId);
                      },
                      child: !likedStatus
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

                    // textgreyL12Robo("20")
                    textgreyL12Robo(likeNo > 0 ? likeNo.toString() : "")
                  ],
                )
              ],
            ),

            sizedBoxHeight(5.h),

            InkWell(
              onTap: (){
                print("reply");
                isReply.value = true;
                _focusNode.requestFocus();
                commentIdForReply = commentId;
                print(commentIdForReply);
                
                // focusForReply();
                // FocusScope.of(context).requestFocus(_focusNode);
              },
              child: textgreyM14Sp("Reply")
            ),

            sizedBoxHeight(5.h),

            Obx(() {
              // Replies? replies;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Visibility(

              
                      //one
                    visible: viewReply.value,
                    child: 
                    viewReply.value ? 
                    // GetBuilder(builder: (context){
                    //   return SizedBox();
                    // })
                      replies != null
                        ? 
                        SizedBox(
                          // height: 100.h,
              
                          width: 290.w,
                          // width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            physics:
                                const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: replies!.data.length,
                            itemBuilder: (context, index) {
                              // print("sdf" +
                              //     repliesData.length.toString());
                              final reply = replies!.data[index];

                              String originalDate = reply.createdAt;
                              DateTime parsedDate =
                                  DateTime.parse(originalDate);
                              String formattedDateReply =
                                  DateFormat('dd/MM/yyyy')
                                      .format(parsedDate);

                              // return Icon(Icons.sd);

                              return Padding(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30.h,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.h),
                                          image: 
                                            reply.user.profileImage == null 
                                            ? DecorationImage(
                                                image: 
                                                // recipeData.user.profileImage == null 
                                                // ? 
                                                AssetImage("assets/default_profile.webp"),
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
                                                    ApiUrls.base + reply.user.profileImage!),
                                                fit: BoxFit.fill)
                                          // image: DecorationImage(
                                          //     image: NetworkImage(ApiUrls.base + reply.user.profileImage!),
                                          //     // AssetImage("assets/home/profile.png"),
                                          //     fit: BoxFit.fill)
                                            ),
                                    ),
                                    sizedBoxWidth(10.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // textWhite17w500("George Smith"),
                                        // e=
                                        // textBlack16SP("Chaitali tatkare"),
                                        textBlack16SP(reply.user.firstName + " " + reply.user.lastName),
                              
                                        sizedBoxHeight(5.h),
                              
                                        // textgreyD12Robo("2 Days ago")
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.h),
                                              color: AppColors.greyLtEBEBEB),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                                            // child: textgreyD10Robo("11:36"),
                                            child: textgreyD10Robo(formattedDateReply),
                              
                                          ),
                                        ),
                              
                                        sizedBoxHeight(5.h),
                              
                                        textBlack15Robo(reply.comment),
                                      ],
                                    )
                                  ],
                                ),
                              );

                              // final follower = followers[index].follower;
                              // return invite(
                              //   firstname: follower!.firstName!,
                              //   username: follower.username!,
                              //   profileimage: follower.profileImage,
                              //   userId: follower.id!,
                              //   index: index,
                              //   selectedIds: selectedIds,
                              //   onInvitePressed: (id) {
                              //     // Handle invite button pressed
                              //     print('Invite button pressed for: $id');
                              //   },
                              // );
                            },
                          ),
                        )
                        // Text("sd")
                        // Expanded(
                        //   child: ListView.builder(
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     // shrinkWrap: true,
                        //     scrollDirection: Axis.vertical,
                        //     itemCount: replies!.data.length,
                        //     itemBuilder: (context, index) {
                        //       print(replies!.data.length);
                        //       // print("sdf" + repliesData.length.toString());
                        //       final reply = replies!.data[index];
                                      
                        //       String originalDate = reply.createdAt;
                        //       DateTime parsedDate = DateTime.parse(originalDate);
                        //       String formattedDateReply = DateFormat('dd/MM/yyyy').format(parsedDate);
                          
                        //       return Text("fgvhbjn");
                        //       // Icon(Icons.ac_unit);
                          
                              
                        //     },
                        //   ),
                        // )
                        
                          : 
                          textBlack10Robo("could not load replies")
                      
              
                    // FutureBuilder<Replies>(
                    //   future: commentsContoller.getReplies(commentId: commentId),
                    //   builder: (BuildContext context, AsyncSnapshot snapshot){
                    //     // print()
                    //     if (snapshot.connectionState == ConnectionState.waiting) {
                    //       return const Center(child: CircularProgressIndicator());
                    //     } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    //       // print(" main wid");
                    //       final data = snapshot.data;
                    //       final repliesData = data;
                    //       // return Icon(Icons.safety_check);
                    //       // return ListView()
                    //       return SizedBox(
                    //         height: 200.h,
                    //         child: ListView.builder(
                    //           physics: const NeverScrollableScrollPhysics(),
                    //           shrinkWrap: true,
                    //           itemCount: repliesData.length,
                    //           itemBuilder: (context, index) {
                    //             print("sdf" + repliesData.length.toString());
                    //             final reply = repliesData[index];
                                        
                    //             String originalDate = reply.createdAt;
                    //             DateTime parsedDate = DateTime.parse(originalDate);
                    //             String formattedDateReply = DateFormat('dd/MM/yyyy').format(parsedDate);
                            
                    //             return Icon(Icons.sd);
                            
                                
                    //           },
                    //         ),
                    //       );
                      
                    //     } else if (snapshot.hasError) {
                    //       return const Center(child: Text('Failed to load replies'));
                    //     } else {
                          
                    //       return Container();
                    //     }
                    //   }) 
                   
                      : SizedBox()
                    
                          ),
              
              
                  //two
                      // visible: viewReply.value,
                      // child: viewReply.value
                      //     ? FutureBuilder<Replies>(
                      //         future: commentsContoller.getReplies(
                      //             commentId: commentId),
                      //         builder: (context, snapshot) {
                      //           // print()
                      //           if (snapshot.connectionState ==
                      //               ConnectionState.waiting) {
                      //             return const Center(
                      //                 child: CircularProgressIndicator());
                      //           } else if (snapshot.hasData) {
                      //             // print(" main wid");
                      //             final repliesData = snapshot.data!.data;
                      //             // return Icon(Icons.safety_check);
                      //             // return ListView()
                      //             return SizedBox(
                      //               height: 200.h,
                      //               child: ListView.builder(
                      //                 physics:
                      //                     const NeverScrollableScrollPhysics(),
                      //                 shrinkWrap: true,
                      //                 itemCount: repliesData.length,
                      //                 itemBuilder: (context, index) {
                      //                   print("sdf" +
                      //                       repliesData.length.toString());
                      //                   final reply = repliesData[index];
              
                      //                   String originalDate = reply.createdAt;
                      //                   DateTime parsedDate =
                      //                       DateTime.parse(originalDate);
                      //                   String formattedDateReply =
                      //                       DateFormat('dd/MM/yyyy')
                      //                           .format(parsedDate);
              
                      //                   return Icon(Icons.sd);
              
                      //                   // return Row(
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
                      //                   //         textBlack16SP(reply.user.firstName + " " + reply.user.lastName),
              
                      //                   //         sizedBoxHeight(5.h),
              
                      //                   //         // textgreyD12Robo("2 Days ago")
                      //                   //         Container(
                      //                   //           decoration: BoxDecoration(
                      //                   //               borderRadius: BorderRadius.circular(15.h),
                      //                   //               color: AppColors.greyLtEBEBEB),
                      //                   //           child: Padding(
                      //                   //             padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                      //                   //             // child: textgreyD10Robo("11:36"),
                      //                   //             child: textgreyD10Robo(formattedDateReply),
              
                      //                   //           ),
                      //                   //         ),
              
                      //                   //         sizedBoxHeight(5.h),
              
                      //                   //         textBlack15Robo(reply.comment),
                      //                   //       ],
                      //                   //     )
                      //                   //   ],
                      //                   // );
              
                      //                   // final follower = followers[index].follower;
                      //                   // return invite(
                      //                   //   firstname: follower!.firstName!,
                      //                   //   username: follower.username!,
                      //                   //   profileimage: follower.profileImage,
                      //                   //   userId: follower.id!,
                      //                   //   index: index,
                      //                   //   selectedIds: selectedIds,
                      //                   //   onInvitePressed: (id) {
                      //                   //     // Handle invite button pressed
                      //                   //     print('Invite button pressed for: $id');
                      //                   //   },
                      //                   // );
                      //                 },
                      //               ),
                      //             );
                      //           } else if (snapshot.hasError) {
                      //             return const Center(
                      //                 child: Text('Failed to load followers'));
                      //           } else {
                      //             return Container();
                      //           }
                      //         })
                      //     : SizedBox()
                      // // Row(
                      // //   crossAxisAlignment: CrossAxisAlignment.start,
                      // //   children: [
                      // //     Container(
                      // //       width: 30.h,
                      // //       height: 30.h,
                      // //       decoration: BoxDecoration(
                      // //           borderRadius: BorderRadius.circular(15.h),
                      // //           image: const DecorationImage(
                      // //               image: AssetImage("assets/home/profile.png"),
                      // //               fit: BoxFit.fill)),
                      // //     ),
                      // //     sizedBoxWidth(10.w),
                      // //     Column(
                      // //       crossAxisAlignment: CrossAxisAlignment.start,
                      // //       mainAxisAlignment: MainAxisAlignment.center,
                      // //       children: [
                      // //         // textWhite17w500("George Smith"),
                      // //         // e=
                      // //         // textBlack16SP("Chaitali tatkare"),
                      // //         textBlack16SP(userName),
              
                      // //         sizedBoxHeight(5.h),
              
                      // //         // textgreyD12Robo("2 Days ago")
                      // //         Container(
                      // //           decoration: BoxDecoration(
                      // //               borderRadius: BorderRadius.circular(15.h),
                      // //               color: AppColors.greyLtEBEBEB),
                      // //           child: Padding(
                      // //             padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                      // //             // child: textgreyD10Robo("11:36"),
                      // //             child: textgreyD10Robo(dateTime),
              
                      // //           ),
                      // //         ),
              
                      // //         sizedBoxHeight(5.h),
              
                      // //         textBlack15Robo(comment),
                      // //       ],
                      // //     )
                      // //   ],
                      // // ),
              
                      // ),
              

                  //three
                  sizedBoxHeight(5.h),
                  numReplies > 0
                      ? InkWell(
                          onTap: () async {
                            replies = await commentsContoller.getReplies(commentId: commentId);
                            viewReply.value = !viewReply.value;
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                child: Divider(
                                  thickness: 0.5.h,
                                  color: AppColors.grey54595F,
                                ),
                              ),
                              sizedBoxWidth(5.w),
                              textgreyD12Robo(viewReply.value
                                  ? "Hide reply"
                                  : "View ${numReplies.toString()} reply")
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              );
            })

            // textGrey15W500("21 Jan, 2022, 10:41 am")
          ],
        )
      ],
    );
  }




  Widget ingredientsTile({required String ingredientName, required String quantity}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // "chomolia, finely chopped",
              ingredientName,
              style: TextStyle(
                  fontSize: 14.sp, color: const Color(0xff414141)),
            ),
            Text(
              // "1 Bunch",
              quantity,
              style: TextStyle(
                  fontSize: 14.sp, color: const Color(0xff414141)),
            ),
          ],
        ),
        const Divider(
          height: 1,
          thickness: 0.5,
        ),
        sizedBoxHeight(15.h),
      ],
    );
  }

  Widget instructionTile({
    required int index,
    required String instructionText,
    required String imageUrl
  }){
    return Column(
      children: [
        Container(
          // height: 80.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xff7070705E)),
                borderRadius: BorderRadius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxWidth(6.w),
                    CircleAvatar(
                      radius: 11.sp,
                      backgroundColor: const Color(0xff6B6B6B),
                      child: Text(
                        // "3",
                        (index + 1).toString(),
                        style: TextStyle(
                            fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                    sizedBoxWidth(7.w),
                    Text(
                      instructionText,
                      // "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xff707070),
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight(6.h),
                // Image.asset(
                //   "assets/Mask Group 24.png",
                //   height: 173.h,
                //   width: double.infinity,
                //   fit: BoxFit.fill,
                // )
                Image.network(
                  ApiUrls.base + imageUrl,
                  height: 173.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )

                // NetworkImage(
                //   ApiUrls.base + imageUrl
                // )
                // Image(
                //   height: 173.h,
                //   // fit:
                //   // ,
                //   width: double.infinity,
                //   image: AssetImage("assets/Mask Group 24.png",
                //     // heigh
                //   ))
              ],
            ),
          ),
        ),
        sizedBoxHeight(14.h),
      ],
    );
  }
}
