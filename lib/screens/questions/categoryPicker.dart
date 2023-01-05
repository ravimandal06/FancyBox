import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  final List<String> _listItems = [
    'assets/categories/aestheticinstagramtheme.jpeg',
    'assets/categories/businessmarketingplan.jpeg',
    'assets/categories/conceptmodelsarchitecture.jpeg',
    'assets/categories/hairgrowthfoods.jpeg',
    'assets/categories/handtattos.png',
    'assets/categories/illustration.png',
    'assets/categories/lifehacks.jpeg',
    'assets/categories/matchingpfpcouple.jpeg',
    'assets/categories/moodpics.jpeg',
    'assets/categories/poplyrics.jpeg',
    'assets/categories/redaesthetic.jpeg',
    'assets/categories/visionboardideas.jpeg',
    'assets/categories/winterfashionoutfits.jpeg',
    'assets/categories/illustration.png',
    'assets/categories/lifehacks.jpeg',
    'assets/categories/matchingpfpcouple.jpeg',
    'assets/categories/moodpics.jpeg',
    'assets/categories/poplyrics.jpeg',
    'assets/categories/redaesthetic.jpeg',
    'assets/categories/visionboardideas.jpeg',
    'assets/categories/winterfashionoutfits.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFebeeee),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Welcome\n",
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                    ),
                    TextSpan(
                        text: "Pick 5 or more topics",
                        style: TextStyle(color: Colors.black, fontSize: 20.sp))
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 110.h, left: 15.w, right: 15.w),
              child: Container(
                height: height,
                width: double.infinity,
                color: Colors.white,
                child: Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: _listItems
                        .map((item) => Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
