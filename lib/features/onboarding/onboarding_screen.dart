import 'package:flutter/material.dart';
import 'package:plant_app/plant_app_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../models/onboard_model.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreen createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/onboard1.png',
      text: "Welcome to the Plant App",
      text2: "Identify more than 3000+ plants and 88% accuracy.",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/onboard2.png',
      text: "Take a photo to identify the plant!",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/images/onboard3.png',
      text: "Get plant care guides",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          currentIndex % 2 == 0 ? AppColors.kwhite : AppColors.kgreen,

      // appBar: AppBar(
      //   backgroundColor:
      //       currentIndex % 2 == 0 ? AppColors.kwhite : AppColors.kblue,
      //   elevation: 0.0,
      //   actions: [
      //     TextButton(
      //       onPressed: () {
      //         _storeOnboardInfo();
      //         Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => PlantAppHomeScreen()));
      //       },
      //       child: Text(
      //         "Skip Onboarding",
      //         style: TextStyle(
      //           color:
      //               currentIndex % 2 == 0 ? AppColors.kblack : AppColors.kwhite,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Center(
                          child: Text(
                            screens[index].text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: index % 2 == 0
                                  ? AppColors.kblack
                                  : AppColors.kwhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (screens[index].text2 != null)
                        Center(
                          child: Text(
                            screens[index].text2!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              color: index % 2 == 0
                                  ? AppColors.kblack
                                  : AppColors.kwhite,
                            ),
                          ),
                        ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: Image.asset(screens[index].img)),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(child: Container()),
                      _buildNextButton(index, context),
                      _buildDots(context),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  Container _buildDots(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: screens.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              width: currentIndex == index ? 12 : 8,
              height: currentIndex == index ? 12 : 8,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? const Color(0xff13231B)
                    : const Color(0xffC4C8C6),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ]);
        },
      ),
    );
  }

  InkWell _buildNextButton(int index, BuildContext context) {
    return InkWell(
      onTap: () async {
        print(index);
        if (index == screens.length - 1) {
          await _storeOnboardInfo();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PlantAppHomeScreen()));
        }

        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.bounceIn,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        decoration: BoxDecoration(
            color: index % 2 == 0 ? AppColors.kgreen : AppColors.kwhite,
            borderRadius: BorderRadius.circular(15.0)),
        child: Center(
          child: Text(
            "Next",
            style: TextStyle(
                fontSize: 16.0,
                color: index % 2 == 0 ? AppColors.kwhite : AppColors.kgreen),
          ),
        ),
      ),
    );
  }
}
