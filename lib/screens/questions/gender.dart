import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/nextButton.dart';

class MyGender extends StatefulWidget {
  const MyGender({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  State<MyGender> createState() => _MyGenderState();
}

class _MyGenderState extends State<MyGender> {
  double width = 320.w;
  bool allowedGender = true;
  bool allowedbutton = false;

  String selectedGender = "";
  // TextEditingController gen = TextEditingController();

  final getStorage = GetStorage();
  bool allowed = false;

  var _isDisabled = false;

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
                              "Select Your Gender",
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
                            // SizedBox(
                            //   height: 70.h,
                            // ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 35.h,
                                  ),

                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GenderWidget("Male", 1),
                                          GenderWidget("Female", 2),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 19.h,
                                  // ),

                                  Visibility(
                                      visible: _isDisabled == true,
                                      child: const RequiredGenderWidget()),
                                  SizedBox(
                                    height: 200.h,
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
                                  "*Select any option",
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
                            top: 500.h, left: 20.w, right: 20.w),
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
                            Opacity(
                              opacity: selectedGender == "" ? 0.5 : 1,
                              child: NextButtonWidget(
                                selected: true,
                                onPressed: () {
                                  print(selectedGender);
                                  print(("gender index"));
                                  print(widget.index);
                                  if (selectedGender != "") {
                                    _isDisabled = true;

                                    // userData.gender = selectedGender;
                                    getStorage.write("gender", selectedGender);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => AgePage(
                                    //       index: (widget.index) + 1,
                                    //     ),
                                    //   ),
                                    // );
                                  }
                                },
                                child: const NextButtonText(),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Stack GenderWidget(String gender, int ind) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedGender = gender;
            });
          },
          child: Material(
            elevation: selectedGender == gender ? 6.0 : 2,
            borderRadius: BorderRadius.circular(10.r),
            shadowColor: selectedGender == gender
                ? const Color(0xfffa9746)
                : Colors.grey,
            child: Container(
              height: 136.h,
              width: 136.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: selectedGender == gender
                    ? Border.all(
                        color: const Color(0xffFA9746),
                        width: 1.w,
                      )
                    : null,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // height: 60.h,
                      // width: 60.h,
                      child: Text(
                        gender,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto Regular",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        showSelectedGender(gender),
      ],
    );
  }

  Visibility showSelectedGender(String gender) {
    return Visibility(
      visible: selectedGender == gender,
      child: Positioned(
        left: -10,
        top: -10,
        child: Icon(
          Icons.check_circle_rounded,
          color: const Color(0xffFA9746),
          size: 20.h,
        ),
      ),
    );
  }
}

class RequiredGenderWidget extends StatelessWidget {
  const RequiredGenderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '*Please select the gender',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.sp,
        // color: Colors.black.withOpacity(0.6),
        color: const Color.fromRGBO(237, 53, 53, 1),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class RequiredAgeWidget extends StatelessWidget {
  const RequiredAgeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '*Input value range is 16-100',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.sp,
        // color: Colors.black.withOpacity(0.6),
        color: const Color.fromRGBO(237, 53, 53, 1),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
