
import 'package:aksustack/screens/profile_screens/settings.dart';
import 'package:aksustack/screens/splash_screen/final_splash_screen.dart';
import 'package:aksustack/screens/splash_screen/first_splash_screen.dart';
import 'package:aksustack/screens/splash_screen/second_splash_screen.dart';
import 'package:aksustack/screens/splash_screen/third_splash_screen.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


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
    Container(
      color: AppColors.white,
      child: const SecondSplashScreen(),
    ),
    Container(
      color: AppColors.white,
      child: const ThirdSplashScreen(),
    ),

  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState((){

      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  _onchanged(int index) {
    setState(() {
      activePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, int index) {
                return pages[index];
              },
            ),
          ),


          Container(
            color: AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, (int index) {
                      return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 10,
                          width: (index == activePage) ? 30 : 10,
                          margin:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == activePage)
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryColor ));
                    })),
                InkWell(
                  onTap: () {
                    if (activePage == pages.length - 1) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FinalSplashScreen()));
                    } else {
                      _pageController.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.easeInOutQuint);
                    }
                  },

                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 300),
                    height: screenHeight  / 16.9,
                    width: (activePage == (pages.length - 1)) ? 200 : 75,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(60)),
                    child: (activePage == (pages.length - 1)) ? const Text("Get Started",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    )
                        : const Icon(
                      Icons.navigate_next,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
