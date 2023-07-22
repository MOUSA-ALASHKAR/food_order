import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/custom_widgets/text_widget.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/otp_view/otp_view.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/button_widget.dart';
import '../../shared/custom_widgets/text_field_widget.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(5) ),
              child: Column(
                children: [

                  TextWidget(text: 'Reset Password' , textSize: screenWidth(12),),

                  Padding(
                    padding: EdgeInsetsDirectional.only(top: screenWidth(20) , bottom: screenWidth(10)),
                    child: Column(
                      children: [

                        TextWidget(text: 'Please enter your email to receive a',
                          textColor: AppColors.mainTextColor2,
                          textSize: screenWidth(28),
                        ),

                        TextWidget(text: 'link to create a new password via email',
                          textColor: AppColors.mainTextColor2,
                          textSize: screenWidth(28),
                        ),
                      ],
                    ),
                  ),

                  TextFieldWidget(hitText: 'Email',controller: emailController,),

                  Padding(
                    padding: EdgeInsetsDirectional.only(top: screenWidth(10)),
                    child: ButtonWidget
                      (text: 'Send', onPressed: (){
                      Get.to(OtpView());
                    }),
                  ),

                ],
              ),
            ),
          ),
        ),
    );
  }
}

extension ResponsivePadding on num {
  SizedBox ph(BuildContext context) {
    double height = MediaQuery.of(context).size.height * (this / 100);
    return SizedBox(height: height);
  }

  SizedBox pw(BuildContext context) {
    double width = MediaQuery.of(context).size.width * (this / 100);
    return SizedBox(width: width);
  }
}
