import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        shadowColor: Colors.black,
        minimumSize: const Size(120, 45),
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
     onPressed: onPressed,
     child: Text(text,
     style: TextStyle(
      fontSize: 15,
      color: Colors.white
     ),
     ),
     
     );
  }
}
