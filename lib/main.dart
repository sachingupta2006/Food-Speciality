import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/video_player.dart';
import 'package:foodspeciality/common%20files/video_player_file.dart';
import 'package:foodspeciality/login.dart';
import 'package:foodspeciality/screens/AddParticipantExistingCommunity.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatDetails.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/Follower.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/Following.dart';
import 'package:foodspeciality/screens/Inspiration_recipe_comment.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:foodspeciality/screens/communityAddparticipants.dart';
import 'package:foodspeciality/screens/completed_challenge.dart';
import 'package:foodspeciality/screens/create_account.dart';
import 'package:foodspeciality/screens/discovery_recipe.dart';
import 'package:foodspeciality/screens/edit_profile.dart';
import 'package:foodspeciality/screens/followUser.dart';
import 'package:foodspeciality/screens/forgot_password.dart';
import 'package:foodspeciality/screens/join_challenge.dart';
import 'package:foodspeciality/screens/onboarding/onboarding.dart';
import 'package:foodspeciality/screens/otpScreen.dart';
import 'package:foodspeciality/screens/preview.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/screens/reset_password.dart';
import 'package:foodspeciality/screens/search_page.dart';
import 'package:foodspeciality/screens/setting/setting/accordion.dart';
import 'package:foodspeciality/screens/setting/setting/blocklist_full.dart';
// import 'packa+ge:foodspeciality/screens/setting/setting/setting.dart';
import 'package:foodspeciality/screens/signup_profile.dart';
import 'package:foodspeciality/screens/splash_screen2.dart';
import 'package:foodspeciality/screens/user_notification.dart';
import 'package:foodspeciality/screens/viewUser.dart';
import 'package:foodspeciality/sucessfully_blocked.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common files/video_player_network.dart';
import 'screens/InsideBottomBar/chats/Screens/ChatCommunityDetail.dart';
import 'screens/InsideBottomBar/chats/Screens/ViewCommumity.dart';
import 'screens/InsideBottomBar/chats/Screens/edit_community.dart';
import 'screens/report.dart';
import 'screens/report_successfull.dart';
import 'screens/setting/setting/setting.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // GlobalVariables globalVariables = GlobalVariables();
  accessToken = prefs.getString('accessToken');
  onboard = prefs.getBool("OnBoard");
  myUserId = prefs.getString('userId');
  myImage = prefs.getString('myImage');
  print("acs to ${accessToken}");

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

// checkToken(){
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//     GlobalVariables globalVariables = GlobalVariables();
//     globalVariables.accessToken = prefs.getString('accessToken');
//     print("acs to ${globalVariables.accessToken}");
//     // print("token " + jsonResp["data"]["accessToken"]);
//     // await prefs.setString('accessToken', jsonResp["data"]["accessToken"]);
//     // await prefs.setString('refreshToken', jsonResp["data"]["refreshToken"]);

//     runApp(new MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // GlobalVariables globalVariables = GlobalVariables();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      builder: (BuildContext context, Widget? child) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
          debugShowCheckedModeBanner: false,
          // home: LoginScreen(),  title: 'FreeU',
          // initialRoute: (accessToken == null || accessToken == "") ? '/' : '/bottomBar',
          initialRoute: onboard != true
              ? '/'
              : (accessToken == null || accessToken == "")
                  ? '/login'
                  : '/bottomBar',
          // Get.toNamed("/bottomBar")
          getPages: [
            //SplashScreen2()
            GetPage(name: '/', page: () => const SplashScreen2()),
            GetPage(name: "/onboard", page: () => const OnBoarding()),
            GetPage(name: "/login", page: () => const Login()),
            GetPage(name: "/forgetPass", page: () => ForgotPassword()),
            GetPage(
                name: "/otpverification", page: () => const otpVerification()),
            GetPage(name: "/createAcc", page: () => CreateAccountScreen()),
            GetPage(name: "/resetPass", page: () => ResetPassword()),
            GetPage(name: "/signUpProfile", page: () => const SignupProfile()),
            GetPage(
                name: "/discoveryRecipes",
                page: () => const DiscoveryRecipesScreen()),
            GetPage(name: "/viewuser", page: () => const viewUser()),
            GetPage(name: "/followuser", page: () => const followUser()),
            GetPage(name: "/bottomBar", page: () => BottomBar()),
            GetPage(name: "/Preview", page: () => Preview()),

            GetPage(
                name: "/communityaddparticipants",
                page: () => const CommunityAddParticipants()),
            GetPage(
                name: "/addparticipantsexistingcommunity",
                page: () => const AddParticipantExistingCommunity()),
            GetPage(
                name: "/chatcommunitydetail",
                page: () => const ChatCommunityDetail()),
            GetPage(name: "/chatdetail", page: () => const ChatPrivateDetail()),
            // GetPage(name: "/myProfile", page: () => myProfile()),
            GetPage(
                name: "/networkplayerwidget",
                page: () => const NetworkPlayerWidget()),
            GetPage(name: "/setting", page: () => const Setting()),
            GetPage(name: "/joinchallenge", page: () => const JoinChallenge()),
            GetPage(
                name: "/notification", page: () => const UserNotifications()),
            GetPage(name: "/EditProfile", page: () => EditProfile()),
            GetPage(name: "/Report", page: () => const Report()),
            GetPage(name: "/ReportSuccess", page: () => const ReportSuccess()),
            GetPage(name: "/blocklistfull", page: () => const BlockListFull()),
            GetPage(
                name: "/sucessfullyblocked", page: () => SucessfullyBlocked()),
            GetPage(
                name: "/InspirationRecipeComment",
                page: () => const InspirationRecipeComment()),

            GetPage(name: "/SearchPage", page: () => const SearchPage()),
            GetPage(name: "/RecipeIng", page: () => const RecipeIng()),
            GetPage(name: "/FilePlayerWidget", page: () => FilePlayerWidget()),
            GetPage(name: "/ViewCommunity", page: () => const ViewCommunity()),
            GetPage(name: "/EditCommunity", page: () => const EditCommunity()),
            GetPage(name: "/following", page: () => const Following()),
            GetPage(name: "/follower", page: () => const Follower()),
            GetPage(name: "/faq", page: () => const Accordion()),
            GetPage(
                name: "/CompletedChallenge",
                page: () => const CompletedChallenge()),
            GetPage(
                name: "/assetplayerwidget", page: () => AssetPlayerWidget()),
          ],
        ),
      ),
    );
  }
}
