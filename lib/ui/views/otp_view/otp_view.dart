import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/new_password_view/new_password_view.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/button_widget.dart';
import '../../shared/custom_widgets/text_widget.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(6) ),
            child: Column(
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(text: 'We have sent an OTP to', textSize: screenWidth(18)),

                    TextWidget(text: 'your Mobile', textSize: screenWidth(18)),
                  ],
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(20) , bottom: screenWidth(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(text: 'Please check your mobile number 071*****12',
                        textColor: AppColors.mainTextColor2,
                        textSize: screenWidth(25),
                      ),

                      TextWidget(text: 'continue to reset your password',
                        textColor: AppColors.mainTextColor2,
                        textSize: screenWidth(25),
                      ),
                    ],
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
                      child: PinCodeTextField(
                        appContext: context,
                        controller: controller,
                        length: 4,
                        cursorHeight: 18,
                        obscureText: false,
                        enableActiveFill: true,
                        textStyle: TextStyle(fontSize: screenWidth(30)),
                        animationType: AnimationType.fade,
                        hintCharacter: '*',
                        animationDuration: Duration(milliseconds: 300),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldWidth: screenWidth(6),
                          inactiveColor: Colors.grey,
                          selectedColor: Colors.lightBlue,
                          activeColor: Colors.blue,
                          selectedFillColor: Colors.blue,
                          inactiveFillColor: Colors.grey.shade100,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onCompleted: (v){
                          print('completed');
                        },
                        onChanged: ( (value) { print('value'); } ),
                      ),
                    ),
                  ],
                ),



                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
                  child: ButtonWidget
                    (text: 'Next',
                      onPressed: (){
                        Get.to(NewPasswordView());
                      },
                      textSize: screenWidth(20)),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(20)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextWidget(text: 'Didn\'t Receive? ',
                        textColor: AppColors.mainTextColor1,
                        textSize: screenWidth(25),
                        // fontWeight: FontWeight.bold,
                      ),

                      TextWidget(text: 'Click Here',
                        textColor: AppColors.mainOrangeColor,
                        textSize: screenWidth(25),
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
