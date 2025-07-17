import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/onboard_page.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentIndex == 4;
    bool isFirstPage = currentIndex == 0;

    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: Stack(
        children: [


          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              children: const [
                OnboardPage(
                  image: 'assets/images/hello.png',
                  description: '',
                  title: 'Welcome To Islmai App',
                ),
                OnboardPage(
                  image: 'assets/images/kabba.png',
                  title: 'Welcome To Islami',
                  description: 'We Are Very Excited To Have You In Our Community',
                ),
                OnboardPage(
                  image: 'assets/images/welcome.png',
                  title: 'Reading the Quran',
                  description: 'Read, and your Lord is the Most Generous',
                ),
                OnboardPage(
                  image: 'assets/images/bearish.png',
                  title: 'Bearish',
                  description: 'Praise the name of your Lord, the Most High',
                ),
                OnboardPage(
                  image: 'assets/images/radio.png',
                  title: 'Holy Quran Radio',
                  description: 'You can listen to the Holy Quran Radio through the application for free and easily',
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isFirstPage)
                  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xff202020),
                        padding:  EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      ),
                      onPressed: () {
                        _controller.previousPage(
                          duration:  Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child:  Text(
                        'Back',
                        style: TextStyle(color: Color(0xffE2BE7F)),
                      ),
                    ),
                  )
                else
                   SizedBox(width: 90),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect:  WormEffect(
                    activeDotColor: Color(0xffE2BE7F),
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xff202020),
                      padding:  EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    onPressed: () {
                      if (isLastPage) {
                        Navigator.pushNamed(context, HomeScreen.routName);
                      } else {
                        _controller.nextPage(
                          duration:  Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      isLastPage ? 'Get Started' : 'Next',
                      style:  TextStyle(color: Color(0xffE2BE7F)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
