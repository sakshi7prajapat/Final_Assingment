import 'package:candidate_flow/bloc/auth_bloc.dart';
import 'package:candidate_flow/scrrens/createAccountWithPhone.dart';
import 'package:candidate_flow/scrrens/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../helping_widgets/text_field.dart';

// ignore: must_be_immutable
class CreateAccountScreen extends StatefulWidget {
  bool? isValid;
  TextEditingController email  = TextEditingController();
  //int? indexPro;
  CreateAccountScreen({super.key, this.isValid});

  @override
  State<CreateAccountScreen> createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends State<CreateAccountScreen> {
 // TextEditingController widget.email= TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final StepperClassState steps = new StepperClassState();
  // int? index= widget.indexPro;
  AuthBloc _bloc = new AuthBloc();
  final _formKey = GlobalKey<FormState>();
  bool isColor = false;

  // register(){
  //   _bloc.add(RegisterEvent(email: emailController.text,));
  // }

  

  

  // onValidation( int count) {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       count = count + 1;
       
  //     });
  //   }
  // }

 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
       // resizeToAvoidBottomInset: false,
        //backgroundColor: Color(0xffF3E7D6),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    child: MyTextField(
                        controller: firstNameController,
                        hintText: 'FIRST NAME',
                        obscureText: false,
                        onChanged: (value) {
                          setState(() {
                            if (widget.email.text.isNotEmpty &&
                                firstNameController.text.isNotEmpty &&
                                lastNameController.text.isNotEmpty) {
                                  isColor = true;
                                 // steps.onColor(isColor);
                                 // StepperClass(istest: isColor,);
                              
                            } else {
                              isColor = false;
                              
                            }
                          });
                        },
                        validator: (value) {
                          
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                          
                        },
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff85D29C)),
                        enabled: true)),
              ),
              Positioned(
                top: 350.sp,
                left: 35.sp,
                child: Container(
                  width: 300.w,
                  height: 100.h,
                  child: MyTextField(
                      borderSide:
                       BorderSide(width: 1, color: Color(0xff85D29C)),
                      controller: lastNameController,
                      hintText: 'LAST NAME',
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {
                          if (widget.email.text.isNotEmpty &&
                              firstNameController.text.isNotEmpty &&
                              lastNameController.text.isNotEmpty) {
                            isColor = true;
                           // StepperClass(istest: isColor,);
                          } else {
                            isColor = false;
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
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
                  color: Colors.transparent,
                  child: MyTextField(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff85D29C)),
                      controller: widget.email,
                      hintText: 'EMAIL',
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {
                          if (widget.email.text.isNotEmpty &&
                              firstNameController.text.isNotEmpty &&
                              lastNameController.text.isNotEmpty) {
                            isColor = true;
                            //StepperClass(istest: isColor,);
                          } else {
                            isColor = false;
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      enabled: true),
                ),
              ),
              Positioned(
                  top: 600.sp,
                  left: 130.sp,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(135, 38),
                        backgroundColor:
                            (isColor) ? Color(0xff085D29C) : Color(0xff959595),
                      ),
                      onPressed: () {
                        
                        if (_formKey.currentState!.validate()) {
                          if(pageIndex.value == 0){
                          pageIndex.value++;
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
        ));
  }

  
}
