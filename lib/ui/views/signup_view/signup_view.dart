import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/ui/shared/custom_widgets/button_widget.dart';
import 'package:food_order/ui/shared/custom_widgets/text_field_widget.dart';
import 'package:food_order/ui/shared/custom_widgets/text_widget.dart';
import 'package:food_order/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/colors.dart';
import '../../shared/utils.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  File? profileImage;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {


    late bool vi;
    if (profileImage==null && result==null) vi =false; else {vi = true;}

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(text: 'Sign Up', textSize: screenWidth(15)),
                  TextWidget(
                      text: 'Add your details to sign up',
                      textColor: AppColors.mainTextColor2,
                      textSize: screenWidth(25)),
                  //////////////////////////////////////////////////////////////

                  if(result != null )  Icon(Icons.file_copy_outlined , size: screenWidth(10),) else

                  if(profileImage != null)

                  Container(
                    width: screenWidth(3.8),
                    height: screenWidth(3.8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(profileImage!),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle
                    ),
                  ) else InkWell(
                    onTap: (){
                      Get.defaultDialog(
                        title: 'picker',
                        content: Container(
                          height: screenWidth(2.5),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      pickImage(ImageSource.gallery);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('gallery'),
                                        Icon(Icons.photo),
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      pickImage(ImageSource.camera);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('camera'),
                                        Icon(Icons.camera_alt_outlined),
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      result = await FilePicker.platform.pickFiles();
                                      setState(() {});
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('file'),
                                        Icon(Icons.file_present),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black , width: screenWidth(150)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                        child: Icon(Icons.person , size: screenWidth(8),)
                    ),
                  ),

                  Visibility(
                    visible: vi,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: screenWidth(3.1)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'picker',
                                  content: Container(
                                    height: screenWidth(2.5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                pickImage(ImageSource.gallery);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('gallery'),
                                                  Icon(Icons.photo),
                                                ],
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                pickImage(ImageSource.camera);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('camera'),
                                                  Icon(Icons.camera_alt_outlined),
                                                ],
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                result = await FilePicker.platform.pickFiles();
                                                setState(() {});
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('file'),
                                                  Icon(Icons.file_present),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: AppColors.mainOrangeColor,
                                size: screenWidth(20),
                              )),
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                                fontSize: screenWidth(30),
                                color: AppColors.mainOrangeColor),
                          )
                        ],
                      ),
                    ),
                  ),

                  //////////////////////////////////////////////////////////////
                  TextFieldWidget(
                    hitText: 'Name',
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return value!.isEmpty  ? 'please Enter Your Name' : null;
                    },
                  ),
                  TextFieldWidget(
                      hitText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                      return value!.isEmpty || !isEmail(value) ? 'please Enter valid email' : null;
                    },
                  ),
                  TextFieldWidget(
                      hitText: 'Mobile No',
                      controller: mobileNumberController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                      return value!.isEmpty ? 'please Enter Your mobile number' : null;
                    },
                  ),
                  TextFieldWidget(
                      hitText: 'Address',
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      validator: (value) {
                      return value!.isEmpty ? 'please Enter your address' : null;
                    },
                  ),
                  TextFieldWidget(
                      hitText: 'Password',
                      controller: passwordController1,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                      return value!.isEmpty || !isPassword(value) ? 'please check password' : null ;
                    },
                  ),
                  TextFieldWidget(
                      hitText: 'Confirm Password',
                      controller: passwordController2,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        return value!.isEmpty || !isPassword(value) ? 'please check password' : null ;
                      }
                  ),

                  isLoading ? SpinKitCircle(color: AppColors.mainOrangeColor,) :

                  ButtonWidget(
                      text: 'Sign Up',
                      onPressed: (){

                        if (_formKey.currentState!.validate()) {
                          print("All Ok");/// navigator swap print
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(seconds: 3)).then((value) => {
                            setState(() {
                              isLoading = false;
                            })
                          });
                        }
                        else
                        {
                          print(":(");
                        }

                      },
                      textSize: screenWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Already have an Account? ',
                        textColor: AppColors.mainTextColor1,
                        textSize: screenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(LoginView());
                        },
                        child: TextWidget(
                          text: 'Login',
                          textColor: AppColors.mainOrangeColor,
                          textSize: screenWidth(28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final profileImage = await ImagePicker().pickImage(source: source);

      if (profileImage == null) return;
      final temp_image = File(profileImage.path);
      setState(() {
        this.profileImage = temp_image;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

}
