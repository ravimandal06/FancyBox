import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButtonText extends StatelessWidget {
  const NextButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Next",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'ProductSans Medium',
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
        Icon(
          Icons.arrow_forward,
          size: 20.sp,
          color: Colors.white,
        ),
      ],
    );
  }
}

class PrevButtonText extends StatelessWidget {
  const PrevButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_back,
          size: 20.sp,
          color: Colors.white,
        ),
        SizedBox(
          width: 7.w,
        ),
        Text(
          "Prev",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'ProductSans Medium',
            fontStyle: FontStyle.normal,
          ),
        ),
        
        
      ],
    );
  }
}

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.selected,
  }) : super(key: key);

  final Function onPressed;
  final Widget child;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF77D8E).withOpacity(0.25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 6,
          ),
        ],
      ),
      width: 83.w,
      height: 40.h,
      child: RawMaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        fillColor: selected == true
            ? const Color(0xFFF77D8E)
            : const Color(0xFFF77D8E).withOpacity(0.5),
        onPressed: () => onPressed(),
        child: child,
      ),
    );
  }
}

class PrevButtonWidget extends StatelessWidget {
  const PrevButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.selected,
  }) : super(key: key);

  final Function onPressed;
  final Widget child;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF77D8E).withOpacity(0.25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 6,
          ),
        ],
      ),
      width: 83.w,
      height: 40.h,
      child: RawMaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        fillColor: selected == true
            ? const Color(0xFFF77D8E)
            : const Color(0xFFF77D8E).withOpacity(0.5),
        onPressed: () => onPressed(),
        child: child,
      ),
    );
  }
}
