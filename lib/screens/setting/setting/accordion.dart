import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/FaqModel.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/faq_service.dart';
import 'package:getwidget/getwidget.dart';

class Accordion extends StatefulWidget {
  const Accordion({Key? key}) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  final FaqService faqService = FaqService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Frequently Asked Questions"),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'FAQ',
                style: TextStyle(
                  fontFamily: 'Studio Pro',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxHeight(20.h),
              Container(
                height: 624.h,
                child: FutureBuilder<FaqModel>(
                  future: faqService.getFaqData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      final List<Data>? faqData = snapshot.data!.data;

                      if (faqData == null || faqData.isEmpty) {
                        return Center(child: Text('No FAQs available.'));
                      }

                      // Group FAQs by category
                      final Map<String, List<Data>> groupFaqByCategories = {};

                      faqData.forEach((faq) {
                        if (!groupFaqByCategories.containsKey(faq.categories)) {
                          groupFaqByCategories[faq.categories!] = [];
                        }
                        groupFaqByCategories[faq.categories!]!.add(faq);
                      });

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var category in groupFaqByCategories.keys)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontFamily: 'Studio Pro',
                                    color: const Color(0xff3B3F43),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 16),
                                GFAccordion(
                                  titleChild: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var faq
                                          in groupFaqByCategories[category]!)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(faq.question!),
                                            SizedBox(height: 8),
                                          ],
                                        ),
                                    ],
                                  ),
                                  contentChild: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var faq
                                          in groupFaqByCategories[category]!)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(faq.answer!),
                                            SizedBox(height: 16),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Failed to load FAQs'));
                    } else {
                      return Container(); // Placeholder, you can handle this based on your UI design
                    }
                  },
                ),
              ),

              // sizedBoxHeight(16.h),
              // GFAccordion(
              //   margin: const EdgeInsets.all(0),
              //   titlePadding: EdgeInsets.only(
              //       top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
              //   contentPadding: EdgeInsets.only(
              //       top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
              //   expandedTitleBackgroundColor: const Color(0xffF2F2F2),
              //   collapsedIcon: Icon(
              //     Icons.arrow_forward_ios_outlined,
              //     size: 16.sp,
              //   ),
              //   expandedIcon: Icon(
              //     Icons.close,
              //     size: 16.sp,
              //   ),
              //   contentBackgroundColor: const Color(0xffF2F2F2),

              //   contentChild: Text(
              //     'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
              //     style: TextStyle(
              //       fontFamily: 'Roboto',
              //       color: Colors.black,
              //       fontSize: 12.sp,
              //       fontWeight: FontWeight.w100,
              //     ),
              //   ),
              // ),

              sizedBoxHeight(16.h),
            ],
          ),
        ),
      ),
    );
  }
}

Map<String, List<Data>> groupFaqByCategories(FaqModel faqData) {
  final Map<String, List<Data>> groupedFaq = {};
  for (final faq in faqData.data!) {
    final category = faq.categories ??
        'Uncategorized'; // If categories is null, use 'Uncategorized'
    groupedFaq.putIfAbsent(category, () => []).add(faq);
  }
  return groupedFaq;
}
