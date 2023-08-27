import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/CommunityGuidelinesModel.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/community_guidelines_service.dart';

class CommunityGuidelines extends StatelessWidget {
  const CommunityGuidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleTxt: "Community Guidelines"),
      body: FutureBuilder<CommunityGuidelinesModel>(
        future: CommunityGuidelinesService().getCommunityGuidelines(),
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
            final guidelinesData = snapshot.data!.data;
            return ListView.builder(
              itemCount: guidelinesData!.length,
              itemBuilder: (context, index) {
                final item = guidelinesData[index];
                return ListTile(
                    title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sizedBoxHeight(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Food Specialties Community Guidelines',
                          style: TextStyle(
                            fontFamily: 'Studio Pro',
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    sizedBoxHeight(18.h),
                    Text(
                      item.description ?? "",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ));
              },
            );
          }
        },
      ),
    );
  }
}
