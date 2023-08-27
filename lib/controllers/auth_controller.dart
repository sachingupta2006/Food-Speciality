import 'package:get/get.dart';

class AuthController extends GetxController {
  bool _showdailog = false;
  bool get showDailog => _showdailog;

  changeDailogBool(bool value){
    _showdailog = value;
    update();
  }
}