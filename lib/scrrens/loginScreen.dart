import 'package:candidate_flow/bloc/auth_bloc.dart';
import 'package:candidate_flow/helping_widgets/button.dart';
import 'package:candidate_flow/helping_widgets/text_field.dart';
import 'package:candidate_flow/scrrens/userSelectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthBloc _bloc = AuthBloc();
  final _formKey = GlobalKey<FormState>();

  bool _isVisible = false;
  bool isLoading = false;

  login() async {
    _bloc.add(PerformLogin(
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is AuthLoginLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AuthLoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login Successfully"),
          ));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => AuthBloc(),
                    child: UserSelection(),
                  )));
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Failed to login"),
          ));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffF3E7D6),
            body: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset("assets/images/login_image.png")),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: MyTextField(
                          // borderSide:  BorderSide.none,
                          controller: emailController,
                          // hintText: 'EMAIL',
                          obscureText: false,
                          borderSide: BorderSide.none,
                          hintText: 'Email',
                    
                          // validator: validator,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required.";
                            }
                          },
                          enabled: true),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: MyTextField(
                          borderSide: BorderSide.none,
                          controller: passwordController,
                          hintText: 'PASSWORD',
                          obscureText: true,
                          // validator: validator,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required.";
                            }
                          },
                          enabled: true),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot login?',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                    
                    SizedBox(
                      height: 40,
                    ),
                    _autButton()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // MyTextField emailField() {
  //   return MyTextField(
  //       controller: emailController,
  //       hintText: 'EMAIL',
  //       obscureText: false,
  //       // validator: validator,
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return "Email is required.";
  //         }
  //       },
  //       enabled: true);
  // }

  // MyTextField passwordField() {
  //   return MyTextField(
  //       controller: passwordController,
  //       hintText: 'PASSWORD',
  //       obscureText: true,
  //       // validator: validator,
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return "Password is required.";
  //         }
  //       },
  //       enabled: true);
  // }

  Widget _autButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            shadowColor: Colors.black,
            minimumSize: const Size(120, 45),
            primary: Color(0xff85D29C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              login();
            }
          },
          child: const Text(
            'LOG IN',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1.0,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text('OR'),
            ),
            Container(
              height: 1.0,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        MyButton(
            text: 'SIGN UP',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserSelection(),
                  ));
            },
            color: Color(0xff85D29C))
      ],
    );
  }
}
