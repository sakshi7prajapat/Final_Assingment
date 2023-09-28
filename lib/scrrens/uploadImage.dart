import 'dart:io';

import 'package:candidate_flow/scrrens/createAccount.dart';
import 'package:candidate_flow/scrrens/createAccountWithPhone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/auth_bloc.dart';
import 'completeProfilePage.dart';

class UploadImageProfile extends StatefulWidget {
  const UploadImageProfile({super.key});

  @override
  State<UploadImageProfile> createState() => _UploadImageProfileState();
}

class _UploadImageProfileState extends State<UploadImageProfile>
    with TickerProviderStateMixin {
  CreateAccountScreen _cr = new CreateAccountScreen();
  CreateAccountWithPhoneNumber _cpr = new CreateAccountWithPhoneNumber();
  // File? _image;
  // final _picker = ImagePicker();

  // Future getImage() async {
  //   var image = _picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image as File? ;
  //   });
  // }

  XFile? image;

  final ImagePicker picker = ImagePicker();
  AuthBloc _bloc = new AuthBloc();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  TextEditingController emailController = TextEditingController();

  register() {
    _bloc.add(RegisterEvent(
        email: _cr.email.toString(),
        password: _cpr.passwordController.toString(),
        phoneNo: _cpr.phoneNumberController.toString()));
  }

  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

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
            content: Text("Register Successfully"),
          ));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => AuthBloc(),
                    child: CompleteProfile(),
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
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                // SvgPicture.asset(
                //   'assets/images/agent_bg_image_light_shade.svg',
                //   fit: BoxFit.cover,
                // ),
                Positioned(
                    height: 650,
                    left: 90,
                    child: image != null
                        ? ClipOval(
                            child: Image.file(
                              //to show image, you type like this.
                              File(image!.path),
                              // fit: BoxFit.cover,
                              // width: MediaQuery.of(context).size.width,
                              // height: 100,
                              width: 200.w,
                              height: 30.h,
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                            "assets/images/profile.png",
                            width: 200.w,
                            height: 30.h,
                            //fit: BoxFit.fitHeight,
                          ))),
                Positioned(
                  top: 450.sp,
                  left: 20.sp,
                  child: Container(
                    height: 100.h,
                    width: 180.w,
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.sp),
                          child: Text(
                            'Add a photo.',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.sp, right: 9.sp),
                          child: Text(
                            'A photo goes a long way. Let agents find you with a proffesional selfie.',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 350,
                  left: 240,
                  child: InkWell(
                    onTap: () {
                      print('object');
                      _selectPhotho();
                    },
                    child: SvgPicture.asset(
                      'assets/images/add_icon.svg',
                      //fit: BoxFit.cover,
                      height: 80,
                      width: 50,
                    ),
                  ),
                ),
                Positioned(
                    top: 570.sp,
                    //height: 900,
                    left: 130.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 6,
                        shadowColor: Colors.black,
                        minimumSize: const Size(130, 45),
                        primary: Color(0xff85D29C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        register();
                      },
                      child: const Text(
                        'NEXT',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  Future _selectPhotho() async {
    TabController _tabController = TabController(
      length: 2,
      vsync: this,
    );
    await showModalBottomSheet(
        // constraints: BoxConstraints(
        //   maxHeight: 100.h,
        // ),
        context: context,
        builder: (context) => BottomSheet(
            constraints: BoxConstraints(
              maxHeight: 200.h,
            ),
            onClosing: () {},
            builder: (context) => Column(
                  children: [
                    // TabBar(
                    //   indicatorColor: Color(0xff85D29C),
                    //   controller: _tabController,
                    //   tabs: [
                    //      Center(
                    //         child: Icon(Icons.person_4,
                    //         size: 50,
                    //         )
                    //       ),
                    //       Center(
                    //         child: Text("Calls"),
                    //       ),
                    //   ],
                    //   ),

                    Container(
                      height: 30.h,
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              getImage(ImageSource.gallery);
                            },
                            child: SvgPicture.asset(
                              'assets/images/upload.svg',
                              //fit: BoxFit.cover,
                              height: 30.h,
                              width: 30.w,
                            ),
                          ),
                        ),
                        Text('Upload from your library')
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              getImage(ImageSource.camera);
                            },
                            child: SvgPicture.asset(
                              'assets/images/instagram.svg',
                              //fit: BoxFit.cover,
                              height: 30.h,
                              width: 30.w,
                            ),
                          ),
                        ),
                        Text('Take a photo')
                      ],
                    ),

                    // IconButton(
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //       getImage(ImageSource.camera);
                    //     },
                    //     icon: Icon(Icons.camera)),

                    // IconButton(
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //       getImage(ImageSource.gallery);
                    //     },
                    //     icon: Icon(Icons.image))
                  ],
                )));
  }
}
