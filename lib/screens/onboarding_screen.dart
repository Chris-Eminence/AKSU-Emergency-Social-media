import 'package:aksustack/screens/splash_screen/final_splash_screen.dart';
import 'package:aksustack/screens/splash_screen/first_splash_screen.dart';
import 'package:aksustack/screens/splash_screen/second_splash_screen.dart';
import 'package:aksustack/screens/splash_screen/third_splash_screen.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  DotsDecorator decorator = const DotsDecorator();
  int activePage = 0;

  final List<Widget> pages = [
    Container(
      color: AppColors.white,
      child: const FirstSplashScreen(),
    ),
    Container(color: AppColors.white, child: const SecondSplashScreen(),),
    Container(
      color: AppColors.white,
      child: const ThirdSplashScreen(),
    ),
    Container(
      color: AppColors.white,
      child: const FinalSplashScreen(),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currPageValue = 0.0;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page){
                setState((){
                  activePage = page;
                });
              },
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index){
                return pages[index % pages.length];
              },

            ),
          ),
          // Text(activePage.toString()),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DotsIndicator(
              dotsCount: pages.length,
              position: activePage.toDouble(),
              decorator: DotsDecorator(

                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
