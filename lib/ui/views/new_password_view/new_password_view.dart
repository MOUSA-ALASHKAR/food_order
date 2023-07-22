import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/utils.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/button_widget.dart';
import '../../shared/custom_widgets/text_field_widget.dart';
import '../../shared/custom_widgets/text_widget.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  _NewPasswordViewState createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(10) ),
            child: Column(
              children: [

                TextWidget(text: 'New Password' , textSize: screenWidth(15)),

                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(30) , bottom: screenWidth(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(text: 'Please enter your email to receive',
                        textColor: AppColors.mainTextColor2,
                        textSize: screenWidth(25),
                      ),

                      TextWidget(text: 'a link to create a new password via email',
                        textColor: AppColors.mainTextColor2,
                        textSize: screenWidth(25),
                      ),
                    ],
                  ),
                ),

                TextFieldWidget(hitText: 'New Password',controller: emailController,),

                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
                  child: TextFieldWidget(hitText: 'Confirm Password',controller: emailController,),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(10)),
                  child: ButtonWidget
                    (text: 'Next', onPressed: (){}),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
