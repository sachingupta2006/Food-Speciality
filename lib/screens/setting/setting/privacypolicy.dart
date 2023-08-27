import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/PolicyModel.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/services/policy_service.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final PolicyService policyService = PolicyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleTxt: "Privacy Policy"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Food Specialities Privacy Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Studio Pro",
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: Text(
            //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\n'
            //         'Survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release ofLetraset sheets containing Lorem Ipsum\n\n'
            //         'passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n'
            //         'survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n',
            //         style: TextStyle(
            //           fontFamily: "Roboto",
            //           color: Colors.black,
            //           fontSize: 14.sp,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            FutureBuilder<PolicyModel>(
              future: policyService.getPolicyData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final policyData = snapshot.data?.data?.first;
                  if (policyData == null) {
                    return Text('No data available.');
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            policyData.description ??
                                'No description available.',
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
