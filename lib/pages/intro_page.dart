import 'package:flutter/material.dart';
import 'package:flutter_intro_page/pages/home_page.dart';
import 'package:flutter_intro_page/Utils/strings.dart';

class Intro_page extends StatefulWidget {
  static final String id = "intro_page";

  @override
  State<Intro_page> createState() => _Intro_pageState();
}

class _Intro_pageState extends State<Intro_page> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: 'assets/images/image_1 (1).png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  reverse: true,
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(""),
                Row(
                  children: _buildIndicator(),
                ),
                _skip(), 

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            title,
            style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)),
    );
  }

  Widget _skip() {
    if (currentIndex == 2) {
      // Changed the condition to check if currentIndex is equal to 2
      return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, Home_page.id);
        },
        child: Padding(
          padding: EdgeInsets.only(right: 0, left: 0),
          child: Text(
            'Skip',
            style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
      );
    } else {
      return SizedBox(
        
      );
    }
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
