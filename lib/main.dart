import 'package:fancybox/screens/questions/country.dart';
import 'package:fancybox/screens/questions/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/onboding/onboding_screen.dart';
import 'screens/questions/age.dart';
import 'screens/questions/categoryPicker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //screen orientation
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FancyBox',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEEF1F8),
          primarySwatch: Colors.blue,
          fontFamily: "Intel",
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            errorStyle: TextStyle(height: 0),
            border: defaultInputBorder,
            enabledBorder: defaultInputBorder,
            focusedBorder: defaultInputBorder,
            errorBorder: defaultInputBorder,
          ),
        ),
        home:  CategoryPicker(),
      ),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
