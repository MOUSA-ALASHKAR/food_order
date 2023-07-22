import 'package:flutter/material.dart';
import 'package:food_order/core/translations/app_translations.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/button_widget.dart';
import 'package:food_order/ui/shared/custom_widgets/text_field_widget.dart';
import 'package:food_order/ui/shared/custom_widgets/text_widget.dart';
import 'package:food_order/ui/views/intro_view/intro_view.dart';
import 'package:food_order/ui/views/login_view/login_controller.dart';
import 'package:food_order/ui/views/reset_password_view/reset_password_view.dart';
import 'package:food_order/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';
import '../../shared/utils.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          body: Align(alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextWidget(text: 'Login' , textSize: screenWidth(10),),

                    TextWidget(text: 'Add your details to login', textColor: AppColors.mainTextColor2, textSize: screenWidth(25)),

                    TextFieldWidget(
                        hitText: 'Your Email',
                        controller: controller.emailController ,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value)
                        {
                          return value!.isEmpty || !isEmail(value) ? 'please check email' : null ;
                        }
                    ),

                    TextFieldWidget(
                        hitText: 'Password',
                        controller: controller.passwordController ,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value)
                        {
                          return value!.isEmpty || !isPassword(value) ? 'please check password' : null ;
                        },
                    ),



                    ButtonWidget(
                        text: tr("key_login"),
                        onPressed: ()
                        async {
                          controller.login();
                        }
                        ),

                    InkWell(
                      onTap: (){Get.to(ResetPasswordView());
                      },

                      child: TextWidget(text: 'Forgot your password?', textColor: AppColors.mainTextColor2,textSize: screenWidth(25),),
                    ),

                    TextWidget(text: 'or Login With', textColor: AppColors.mainTextColor2,textSize: screenWidth(30)),

                    ButtonWidget
                      (
                      text: 'Login with Facebook',
                      onPressed: ()
                    {
                      Get.to(IntroView());
                    },

                      textColor: AppColors.mainWhiteColor,
                      buttonColor: AppColors.mainBlueColor,
                      svgName: 'facebook',
                    ),

                    ButtonWidget
                      (
                      text: 'Login with Google', onPressed: (){},
                      textColor: AppColors.mainWhiteColor,
                      buttonColor: AppColors.mainRedColor,
                      svgName: 'google_plus',
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(text: 'Don\'t have an Account? ',
                            textColor: AppColors.mainTextColor1,textSize: screenWidth(28),
                            fontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(SignupView());
                            },
                          child: TextWidget(text: 'Sign Up',
                              textColor: AppColors.mainOrangeColor,textSize: screenWidth(28),
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
}
