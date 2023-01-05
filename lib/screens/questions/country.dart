import 'dart:ui';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/nextButton.dart';

class MyCountry extends StatefulWidget {
  const MyCountry({super.key});

  @override
  State<MyCountry> createState() => _MyCountryState();
}

class _MyCountryState extends State<MyCountry> {
  double width = 320.w;
  bool allowedAge = true;
  bool allowedbutton = false;
  TextEditingController years = TextEditingController();
  String age = "";
  final getStorage = GetStorage();
  bool allowed = false;

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  final countryInitial =
      const CountryCode(name: "India", code: "IN", dialCode: "+91");

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
                        margin: EdgeInsets.only(top: 160.h),
                        child: Column(
                          children: [
                            Text(
                              "Select Your Country or Region",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.w),
                              child: LinearPercentIndicator(
                                width: 320.w,
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
                              height: 80.h,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final code = await countryPicker.showPicker(
                                    context: context);
                                setState(() {
                                  countryCode = code;
                                  print(countryCode);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF77D8E),
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Text(
                                  countryCode != null
                                      ? countryCode!.name
                                      : countryInitial.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
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
                        padding: EdgeInsets.only(
                            top: 450.h, left: 20.w, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: PrevButtonWidget(
                                selected: true,
                                onPressed: () {
                                  // Get.to(
                                  //   () => GenderPage(
                                  //     index: widget.index - 1,
                                  //   ),
                                  // );
                                  Navigator.pop(context);
                                },
                                child: const PrevButtonText(),
                              ),
                            ),
                            NextButtonWidget(
                              selected:
                                  (allowed == true || allowedbutton == false)
                                      ? false
                                      : true,
                              onPressed: () {
                                age = years.text;
                                print(age);
                                // userData.age = int.parse(age);
                                getStorage.write("age", age);
                              },
                              child: const NextButtonText(),
                            ),
                          ],
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
