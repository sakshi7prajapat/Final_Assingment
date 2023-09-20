import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../helping_widgets/text_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
        //backgroundColor: Color(0xffF3E7D6),
        body: Form(
      key: _formKey,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/agent_bg_image_light_shade.svg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 250,
            left: 50,
            child: SizedBox(
                width: 300,
                height: 50,
                child: MyTextField(
                    controller: firstNameController,
                    hintText: 'FIRST NAME',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    borderSide: BorderSide(width: 1, color: Color(0xff85D29C)),
                    enabled: true)),
          ),
          Positioned(
            top: 350,
            left: 50,
            child: SizedBox(
              width: 300,
              height: 50,
              child: MyTextField(
                  borderSide: BorderSide(width: 1, color: Color(0xff85D29C)),
                  controller: LastNameController,
                  hintText: 'LAST NAME',
                  obscureText: true,
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
            top: 450,
            left: 50,
            child: SizedBox(
              width: 300,
              height: 50,
              child: MyTextField(
                  borderSide: BorderSide(width: 1, color: Color(0xff85D29C)),
                  controller: LastNameController,
                  hintText: 'EMAIL',
                  obscureText: true,
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
            top: 550,
            left: 150,
            child: ElevatedButton(
            onPressed: (){}, child: Text('NEXT')))
        ],
      ),
    ));
  }
}
