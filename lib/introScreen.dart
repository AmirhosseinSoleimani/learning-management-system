import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:learning_management_system/store/homePage/screens/home_page.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: const Text('Write Title of Page',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            body: 'Write the more description of the page.',
            image: Image.network('https://cdn.elearningindustry.com/wp-content/uploads/2020/07/3-terms-everyone-in-digital-learning-should-know.png',
              height: 400,
              width: 400,
            )
          ),
          PageViewModel(
              titleWidget: const Text('Write Title of Page',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              body: 'Write the more description of the page.',
              image: Image.network('https://cdn.elearningindustry.com/wp-content/uploads/2020/07/3-terms-everyone-in-digital-learning-should-know.png',
                height: 400,
                width: 400,
              )
          ),
          PageViewModel(
              titleWidget: const Text('Write Title of Page',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              body: 'Write the more description of the page.',
              image: Image.network('https://cdn.elearningindustry.com/wp-content/uploads/2020/07/3-terms-everyone-in-digital-learning-should-know.png',
                height: 400,
                width: 400,
              )
          ),
        ],
        onDone: (){
          Navigator.pushNamed(context, HomePage.routeName);
        },
        onSkip: (){
          Navigator.pushNamed(context, HomePage.routeName);
        },
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Color(0xFF6C63FF)
          ),
        ),
          next: const Icon(Icons.arrow_forward,
            color: Color(0xFF6C63FF),
          ),
        done: const Text(
        'Done',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Color(0xFF6C63FF)
        ),
      ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0,10.0),
          color: Colors.black26,
          activeColor: const Color(0xFF6C63FF),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          )
        ),
      ),
    );
  }
}
