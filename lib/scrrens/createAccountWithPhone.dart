import 'package:candidate_flow/helping_widgets/text_field.dart';
import 'package:candidate_flow/scrrens/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/auth_bloc.dart';

class CreateAccountWithPhoneNumber extends StatefulWidget {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   CreateAccountWithPhoneNumber({super.key});

  @override
  State<CreateAccountWithPhoneNumber> createState() =>
      _CreateAccountWithPhoneNumberState();
}

class _CreateAccountWithPhoneNumberState
  extends State<CreateAccountWithPhoneNumber> {
  
  TextEditingController cPasswordController = TextEditingController();
  bool isColor = false;
  final _formKey = GlobalKey<FormState>();
  AuthBloc _bloc = new AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Form(
       
        key: _formKey,
        child: Stack(
          children: [
            // SvgPicture.asset(
            //   'assets/images/agent_bg_image_light_shade.svg',
            //   fit: BoxFit.cover,
            // ),
            Positioned(
                top: 250.sp,
                left: 35.sp,
                child: Container(
                  width: 300.w,
                  height: 100.h,
                 // color: Colors.amber,
                  child: MyTextField(
                      controller: widget.phoneNumberController,
                      hintText: 'PHONE NUMBER',
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {
                          if (widget.phoneNumberController.text.isNotEmpty &&
                               widget.passwordController.text.isNotEmpty &&
                              cPasswordController.text.isNotEmpty) {
                            isColor = true;
                          }else{
                          isColor=false;
                        }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      },
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff85D29C)),
                      enabled: true),
                )),
            Positioned(
              top: 350.sp,
              left: 35.sp,
              child: Container(
                width: 300.w,
                height: 100.h,
                
                child: MyTextField(
                    borderSide: BorderSide(width: 2, color: Color(0xff85D29C)),
                    controller: widget.passwordController,
                    hintText: 'PASSWORD',
                    obscureText: false,
                    onChanged: (value) {
                      setState(() {
                        if ( widget.phoneNumberController.text.isNotEmpty &&
                               widget.passwordController.text.isNotEmpty &&
                              cPasswordController.text.isNotEmpty) {
                          isColor = true;
                        }else{
                          isColor=false;
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    enabled: true),
              ),
            ),
            Positioned(
              top: 450.sp,
              left: 35.sp,
              child: Container(
                width: 300.w,
                height: 100.h,
                

                child: MyTextField(
                    borderSide: BorderSide(width: 2, color: Color(0xff85D29C)),
                    controller: cPasswordController,
                    hintText: 'RE ENTER PASSWORD',
                    obscureText: false,
                    onChanged: (value) {
                      setState(() {
                        if ( widget.phoneNumberController.text.isNotEmpty &&
                               widget.passwordController.text.isNotEmpty &&
                              cPasswordController.text.isNotEmpty) {
                          isColor = true;
                        }else{
                          isColor=false;
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                     
                      return null;
                    },
                    enabled: true),
              ),
            ),
            Positioned(
                top: 600.sp,
                left: 130.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(135, 38),
                      backgroundColor:
                          (isColor) ? Color(0xff085D29C) : Color(0xff959595),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if(pageIndex.value == 1){
                          pageIndex.value++ ;
                        }
                      }
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 15),
                    )))
          ],
        ),
      ),
    );
  }
}
