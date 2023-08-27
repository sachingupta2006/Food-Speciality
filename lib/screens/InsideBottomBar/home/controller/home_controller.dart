import 'package:get/get.dart';

class HomeController extends GetxController {
  // _currentIndex
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // TabController? _tabController;
  // TabController? get tabController => _tabController;

  List _commentLike = [
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {"like": 0, "comment": "Lorem Ipsum is simply dummy text of the printing"},
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
  ];
  List get commentLike => _commentLike;

  changeTab(int index) {
    _currentIndex = index;
    update();
  }

  likeMethod(int index, int like) {
    _commentLike[index]["like"] = like == 0 ? 1 : 0;
    update();
  }

  commentMethod(String comment) {
    // print("comment " + comment);
    var data = {"like": 0, "comment": comment};

    _commentLike.insert(0, data);
    print(_commentLike);
    update();
  }
}
