import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'splash_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [

                SvgPicture.asset(
                  'images/bg_splash.svg',
                  width: screenWidth(1),
                  height: screenHeight(1),
                ),

                Center(
                  child: SvgPicture.asset(
                    'images/logo.svg',
                    width: screenWidth(2),
                    height: screenWidth(2),
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenHeight(1.5)),
                  child: SpinKitThreeBounce(
                    color: AppColors.mainOrangeColor,
                  ),
                )
              ],
            ),
        ),
    );
  }
}
