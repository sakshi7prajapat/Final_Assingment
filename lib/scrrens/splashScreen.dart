import 'dart:async';

import 'package:candidate_flow/bloc/auth_bloc.dart';
import 'package:candidate_flow/scrrens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplshScreen extends StatefulWidget {
  const SplshScreen({super.key});

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => AuthBloc(),
                child: LoginScreen(),
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff85D29C),
      body: Center(
        // child: Image(),
        child: Container(
          height: 300,
          width: 300,
          child: Image.asset(
            "assets/images/splashSreen_Image.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
