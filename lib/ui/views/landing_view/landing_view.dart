import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order/core/translations/app_translations.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/button_widget.dart';
import 'package:food_order/ui/shared/custom_widgets/text_widget.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/login_view/login_view.dart';
import 'package:food_order/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';



class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold (
      body: Column(
        children: [
          Stack(
            children: [
              CustomPaint(
                painter: _ClipShadowShadowPainter(
                  clipper: CustomClipPath(),
                  shadow: Shadow(blurRadius: 12),
                ),
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    width: double.infinity,
                    height: screenWidth(1.05),
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      'images/bg_land.svg',
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    ),
                    decoration:
                    BoxDecoration(color: Color.fromRGBO(252, 96, 17, 1)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(1.6)),
                  child: SvgPicture.asset(
                    'images/logo.svg',
                    width: screenWidth(1.8),
                    height: screenWidth(1.8),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: screenWidth(6.5)),
            child: TextWidget(text: tr("landing_text"),
              textSize: screenWidth(28),textAlign: TextAlign.center,)
          ),

          Column(
              children: [

                ButtonWidget
                  (
                    text: tr("landing_login_button"),
                    onPressed: () async
                    {
                      Get.to(LoginView());
                    }
                ),

                SizedBox(height: screenWidth(30)),

                ButtonWidget
                  (
                  text: tr("landing_register_button"),
                  onPressed: ()
                  {
                    Get.to(SignupView());
                  },
                  borderColor: AppColors.mainOrangeColor,
                  buttonColor: AppColors.mainWhiteColor,
                  textColor: AppColors.mainOrangeColor,
                ),
              ],
          ),

        ],
      ),
    ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius=8.0;
  @override
  Path getClip(Size size) {

    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width,size.height*0.9000000);
    path0.quadraticBezierTo(size.width*1.0060000,size.height*0.9654000,size.width*0.9840000,size.height*0.9872000);
    path0.quadraticBezierTo(size.width*0.9672500,size.height,size.width*0.8770000,size.height);
    path0.quadraticBezierTo(size.width*0.7861250,size.height*1.0016000,size.width*0.7605000,size.height*0.9872000);
    path0.cubicTo(size.width*0.7012500,size.height*0.8856000,size.width*0.7527500,size.height*0.6024000,size.width*0.4975000,size.height*0.6000000);
    path0.cubicTo(size.width*0.2520000,size.height*0.6040000,size.width*0.2950000,size.height*0.8872000,size.width*0.2335000,size.height*0.9872000);
    path0.quadraticBezierTo(size.width*0.2081250,size.height*1.0048000,size.width*0.1260000,size.height);
    path0.quadraticBezierTo(size.width*0.0355000,size.height*1.0032000,size.width*0.0160000,size.height*0.9888000);
    path0.quadraticBezierTo(size.width*-0.0080000,size.height*0.9655000,0,size.height*0.9004000);
    path0.lineTo(0,0);


    return path0;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

