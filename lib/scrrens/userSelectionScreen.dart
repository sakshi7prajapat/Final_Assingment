import 'package:candidate_flow/scrrens/stepper.dart';
import 'package:flutter/material.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3E7D6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text(),
          SizedBox(
            height: 50,
          ),
          first_right_button(),
          SizedBox(
            height: 40,
          ),
          second_left_button(),
          SizedBox(
            height: 40,
          ),
          third_right_button()
        ],
      ),
    );
  }

  Container first_right_button() {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shadowColor: Colors.black,
                  minimumSize: const Size(280, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.horizontal(
                          start: Radius.circular(50))),
                  backgroundColor: Color(0xff85D29C)),
                  
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StepperClass()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I need ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat'
                    ),
                  ),
                  Text(
                    'a talent agent',
                    style: TextStyle(color: Color(0xff025B4E),
                    fontFamily: 'Montserrat'),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Container second_left_button() {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: ElevatedButton(
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
              )),
        ),
      ),
    );
  }

  Container third_right_button() {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: ElevatedButton(
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
              )),
        ),
      ),
    );
  }

  Widget _text() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Describe your role.',
            style: TextStyle(fontSize: 20, fontFamily:'Montserrat'),
          ),
        ),
      ],
    );
  }
}
