import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/nextButton.dart';

class MyAge extends StatefulWidget {
  const MyAge({super.key});

  @override
  State<MyAge> createState() => _MyAgeState();
}

class _MyAgeState extends State<MyAge> {
  double width = 320.w;
  bool allowedAge = true;
  bool allowedbutton = false;
  TextEditingController years = TextEditingController();
  String age = "";
  final getStorage = GetStorage();
  bool allowed = false;

  void onsubmit(String value) {
    print(value);
    if (value == null) {
      setState(() {
        allowed = false;
        allowedbutton = true;
      });
    } else if (int.parse(value) < 16 || int.parse(value) > 100) {
      setState(() {
        allowed = true;
      });
    } else {
      setState(() {
        allowed = false;
        allowedbutton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFebeeee),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              right: 20.w,

              bottom: 5.h,
              child: Image.asset(
                'assets/Backgrounds/Spline.png',
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: const SizedBox(),
              ),
            ),

            Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 60.h),
                        child: Column(
                          children: [
                            Text(
                              "What's your age?",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 65.w),
                              child: LinearPercentIndicator(
                                width: 230.w,
                                animation: true,
                                lineHeight: 5.h,
                                percent: 1.0,
                                // percent: 0.5,
                                backgroundColor:
                                    const Color.fromRGBO(226, 226, 226, 1),
                                progressColor:
                                    const Color.fromRGBO(255, 126, 142, 1),
                                barRadius: const Radius.circular(10),
                              ),
                            ),
                            SizedBox(
                              height: 70.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 130.w),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                    child: TextFormField(
                                      controller: years,
                                      obscureText: false,
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "  Yrs",
                                    style: TextStyle(
                                        fontFamily: "ProductSans Medium",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              child: Visibility(
                                visible: allowed,
                                child: Text(
                                  "*Input value range is 18-100",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 400.h, left: 250.w),
                        child: NextButtonWidget(
                          selected: (allowed == true || allowedbutton == false)
                              ? false
                              : true,
                          onPressed: () {
                            age = years.text;
                            print(age);
                            if (age != "" &&
                                int.parse(age) >= 16 &&
                                int.parse(age) <= 100) {
                              // userData.age = int.parse(age);
                              getStorage.write("age", age);
                              // Get.to(
                              //   () =>
                              //   HeightPage(
                              //     index: widget.index + 1,
                              //   ),
                              // );
                            }


                          },
                          child: const NextButtonText(),
                        ),
                      ),

                      // Positioned(
                      //   width: MediaQuery.of(context).size.width * 1.7,
                      //   // left: 100.w,

                      //   // bottom: 100.h,
                      //   child: Image.asset(
                      //     'assets/Backgrounds/Spline.png',
                      //   ),
                      // ),
                      // Positioned.fill(
                      //   child: BackdropFilter(

                      //     filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      //     child: const SizedBox(),
                      //   ),
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 1.7,
                      //   height: 600.h,
                      //   // child: const RiveAnimation.asset(
                      //   //   "assets/RiveAssets/shapes.riv",

                      //   // ),
                      // ),
                      // // Positioned.fill(
                      // //   child: BackdropFilter(
                      // //     filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      // //     child: const SizedBox(),
                      // //   ),
                      // // ),
                    ],
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
