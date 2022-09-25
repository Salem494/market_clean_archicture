import 'package:bego_market/Helper/shared_helper.dart';
import 'package:bego_market/View/screens/login_screen.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Boarding {
   String img;
   String tit1;
   String tit2;

  Boarding({ this.img,  this.tit1,  this.tit2});
}

class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();
  bool isLast = false;

  List<Boarding> boardingList = [
    Boarding(
        img: "assets/img/onboarding1.jpg",
        tit1:
            "A person buying ordinary products in a supermarket is in touch with his deepest emotions.”\n you go to the supermarket\nand you have wipes to clean your\nhands before shopping",
        tit2: "you go to the supermarket"),
    Boarding(
        img: "assets/img/onboarding2.jpg",
        tit1:
            "A person buying ordinary products in a supermarket is in touch with his deepest emotions.”\n you go to the supermarket\nand you have wipes to clean your\nhands before shopping",
        tit2: "you go to the supermarket"),
    Boarding(
        img: "assets/img/onboarding3.jpg",
        tit1:
            "A person buying ordinary products in a supermarket is in touch with his deepest emotions.”\n you go to the supermarket\nand you have wipes to clean your\nhands before shopping",
        tit2: "you go to the supermarket"),
  ];

  // Cache onBoarding

   void go_on(context){
     sharedHelper.preferences.setBool('onBoarding', true).then((value) {
         if(value){
           NavigateAndRemove(context: context, widget: LoginScreen());
         }
     });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
//                  NavigateAndRemove(context: context, widget: LoginScreen());

                  go_on(context);
                },
                child: Text('SKIP'))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (index) {
                    if (index == boardingList.length - 1) {
                      isLast = true;
                      print('Last');
                    } else {
                      isLast = false;
                      print('Not Last');
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, i) => buildItemOnBoarding(
                        boardingList[i],
                      )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 20,
                          dotWidth: 20,
                          spacing: 3),
                      controller: boardController,
                      count: boardingList.length),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        go_on(context);
                      } else {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Widget buildItemOnBoarding(Boarding boarding) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: Image(
              image: AssetImage(boarding.img),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(boarding.tit1,
              textAlign: TextAlign.center,
              style: textStyle(color: Colors.grey, fontSize: 18.0)),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          boarding.tit2,
          style: textStyle(color: Colors.deepPurple, fontSize: 16.0),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
