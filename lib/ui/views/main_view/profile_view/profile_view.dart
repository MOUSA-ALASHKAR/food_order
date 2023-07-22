import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/button_widget.dart';
import 'package:food_order/ui/shared/custom_widgets/text_field_widget.dart';
import 'package:food_order/ui/shared/custom_widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../main_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? profileImage;
  FilePickerResult? result;


  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    late bool vi;
    if (profileImage==null && result==null) vi =false; else {vi = true;}


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: size.width * 0.03,
                    end: size.width * 0.03,
                    top: size.width * 0.03,
                    bottom: size.width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.black, fontSize: size.width * 0.06),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.to(MainView());
                        },
                        icon: Icon(Icons.shopping_cart))
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  if (result != null)  Icon(Icons.file_copy_outlined , size: size.width*0.15)  else

                  if (profileImage != null)
                    Container(
                      width: size.width*0.3,
                      height: size.width*0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(profileImage!),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle
                      ),
                    )
                  else
                    InkWell(
                      onTap: (){
                        Get.defaultDialog(
                          title: 'picker',
                          content: Container(
                            height: size.width * 0.4,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: size.width*0.18),
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
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: size.width*0.18),
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
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: size.width*0.18),
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
                      child: FlutterLogo(
                        size: 100,
                      ),
                    ),



                  Visibility(
                    visible: vi,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: size.width * 0.33),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'picker',
                                  content: Container(
                                    height: size.width * 0.4,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.symmetric(horizontal: size.width*0.18),
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
                                          padding: EdgeInsets.symmetric(horizontal: size.width*0.18),
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
                                          padding: EdgeInsetsDirectional.symmetric(horizontal: size.width*0.18),
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
                                size: size.width * 0.05,
                              )),
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                                fontSize: size.width * 0.035,
                                color: AppColors.mainOrangeColor),
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: size.width * 0.012, bottom: size.width * 0.02),
                    child: TextWidget(
                      text: 'Hi there Emilia!',
                      textColor: Colors.black,
                    ),
                  ),
                  TextWidget(
                    text: 'Sign Out',
                    textColor: AppColors.mainTextColor2,
                  ),
                  SizedBox(height: size.width * 0.03),
                  TextFieldWidget(
                      hitText: 'MOUSA',
                      controller: name,
                      backColor: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: size.width * 0.02),
                  TextFieldWidget(
                      hitText: 'mousa@gmail.com',
                      controller: email,
                      backColor: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: size.width * 0.02),
                  TextFieldWidget(
                      hitText: '0936******',
                      controller: phone,
                      backColor: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: size.width * 0.02),
                  TextFieldWidget(
                      hitText: 'No 20, 6th Lane',
                      controller: address,
                      backColor: Colors.grey.withOpacity(0.2)),
                  SizedBox(height: size.width * 0.02),
                  TextFieldWidget(
                    hitText: '********',
                    controller: password,
                    backColor: Colors.grey.withOpacity(0.2),
                  ),
                  SizedBox(height: size.width * 0.02),
                  ButtonWidget(
                    text: 'Save',
                    onPressed: () {},
                  ),
                  SizedBox(height: size.width * 0.03),
                ],
              ),
              SizedBox(height: size.height * 0.12),
            ],
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





  // void saveImage(String val) async {
  //   final sharedPref = await SharedPreferences.getInstance();
  //   sharedPref.setString('path', val);
  //   getImage();
  // }

  // void getImage() async {
//   //   final sharedPref = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     imagePath = sharedPref.getString('path');
//   //   });
//   // }

}
