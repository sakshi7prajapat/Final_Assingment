import 'package:candidate_flow/scrrens/createAccount.dart';
import 'package:candidate_flow/scrrens/createAccountWithPhone.dart';
import 'package:candidate_flow/scrrens/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepperClass extends StatefulWidget {
 // bool istest;
  StepperClass({super.key});

  @override
  State<StepperClass> createState() => StepperClassState();
}

// int pageIndex.value = 0;
ValueNotifier<int> pageIndex = ValueNotifier(0);

class StepperClassState extends State<StepperClass> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isfilled = false;
  // int setIndex(int pageno){
  //    return index = pageno;
  //  }

  final List<Widget> _pages = [
    CreateAccountScreen(),
    CreateAccountWithPhoneNumber(),
    UploadImageProfile()
  ];

  @override
  Widget build(BuildContext context) {
    bool isColor = false;
    bool isLine = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/agent_bg_image_light_shade.svg',
            fit: BoxFit.cover,
          ),
          const Positioned(
              top: 100,
              left: 30,
              child: Text(
                'Create an account.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat'),
              )),
          Positioned(top: 140, left: 30, child: customStepper(isLine)),
          Positioned(
            child: ValueListenableBuilder(
                
                valueListenable: pageIndex,
                builder:
                    (BuildContext context, int counterValue, Widget? child) {
                  return PageView.builder(
                    //allowImplicitScrolling: false,
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (int page) {
                      setState(() {
                        // if(index == 1 || index == 2){
                        pageIndex.value = page;
                        //}
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      
                      return _pages[pageIndex.value];
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  Row customStepper(bool isContainerColor) {
    // setState(() {
    //   pageIndex.value ;
    // });
    return Row(
      children: [
        GestureDetector(
          child: Image.asset(
            "assets/images/darkGreen.png",
          ),
          onTap: () {
            setState(() {
              print(1);
              pageIndex.value =0;
              print(pageIndex.value);
            });
            print(pageIndex.value);
            print(1);
          },
        ),
        Container(
          
          height: 2,
          width: 20,
          color: pageIndex.value == 1 || pageIndex.value == 2
              ? Color(0xff025B4E)
              : Color(0xff85D29C),
        ),
        InkWell(
          child: pageIndex.value == 1 || pageIndex.value == 2
              ? Image.asset(
                  "assets/images/darkGreen.png",
                )
              : Image.asset(
                  "assets/images/lightGreen.png",
                ),
          onTap: () {
            setState(() {
              pageIndex.value == 1;
            });
          },
        ),
        Container(
          height: 2,
          width: 20,
          color: pageIndex.value == 2 ? Color(0xff025B4E) : Color(0xff85D29C),
        ),
        InkWell(
          child: pageIndex.value == 2
              ? Image.asset(
                  "assets/images/darkGreen.png",
                )
              : Image.asset(
                  "assets/images/lightGreen.png",
                ),
          onTap: () {
            setState(() {
              pageIndex.value == 1;
            });
          },
        ),
      ],
    );
  }
}
