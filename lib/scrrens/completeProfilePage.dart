import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff025B4E),
      body: Stack(
        children: [
          Positioned(
            top: 100.sp,
            left: 50.sp,
            child: SvgPicture.asset('assets/images/candidate_profile_bg.svg')),
            Positioned(
             top: 120.sp,
             left: 50.sp,
              child: SvgPicture.asset('assets/images/profile.svg')),

              Positioned(
                top: 360.sp,
                left: 40.sp,
                child: Column(
                  children: [
                    Text("You've got the basics.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Colors.white
                    ),
                    ),
                    Text("We need a little more into to finish",
                    style: TextStyle(
                      fontFamily: 'MontserratExtraLight',
                      fontSize: 15,
                      color: Colors.white
                    ),
                    ),
                    Text("your profile. This takes about 5 minutes",
                    style: TextStyle(
                      fontFamily: 'MontserratExtraLight',
                      fontSize: 15,
                      color: Colors.white
                    ),
                    ),
                    Text("but you can save and exit at any time",
                    style: TextStyle(
                      fontFamily: 'MontserratExtraLight',
                      fontSize: 15,
                      color: Colors.white
                    ),
                    )
                  ],
                ),
              ),

              Positioned(
                top: 500.sp,
                child: second_left_button()),

                Positioned(
                  top: 600.sp,
                  left: 150.sp,
                  child: second_right_button())
        ],
      ),
    );
  }

    second_left_button() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: Colors.black,
            minimumSize: const Size(250, 70),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.horizontal(
                    end: Radius.circular(50))),
            backgroundColor: Color(0xff85D29C)),
        onPressed: () {},
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I am a ',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat'
              ),
            ),
            Text(
              'talent agent',
              style: TextStyle(color: Color(0xff025B4E),
              fontFamily: 'Montserrat'),
            )
          ],
        ));
  }
  
  second_right_button() {

    return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shadowColor: Colors.black,
                  minimumSize: const Size(250, 70),
                  // maximumSize: Size(300, 80),
                  
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.horizontal(
                          start: Radius.circular(50))),
                  backgroundColor: Color(0xff85D29C)),
              onPressed: () {
                
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I employ ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat'
                    ),
                  ),
                  Text(
                    'talent agent',
                    style: TextStyle(color: Color(0xff025B4E),
                    fontFamily: 'Montserrat'
                    ),
                  )
                ],
              ));
  }

}