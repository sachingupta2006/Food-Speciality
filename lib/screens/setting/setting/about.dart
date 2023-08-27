import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/AboutUsModel.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/about_service.dart';

class AboutFoodSpeciality extends StatefulWidget {
  const AboutFoodSpeciality({super.key});

  @override
  State<AboutFoodSpeciality> createState() => _AboutFoodSpecialityState();
}

class _AboutFoodSpecialityState extends State<AboutFoodSpeciality> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: 'About Food Speciality'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: FutureBuilder<AboutUsModel>(
          future: AboutUsService().getAboutUsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final aboutUsData = snapshot.data!.data;
              return ListView.builder(
                itemCount: aboutUsData!.length,
                itemBuilder: (context, index) {
                  final item = aboutUsData[index];
                  return ListTile(
                    title: Column(
                      children: [
                        sizedBoxHeight(20.h),
                        Text(
                          item.description ?? "",
                          maxLines: more ? null : 2,
                          style:
                              TextStyle(fontFamily: "Roboto", fontSize: 16.sp),
                          // overflow: TextOverflow.fade,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              more = !more;
                            });
                          },
                          child: Text(
                            more ? 'Less' : 'More',
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
