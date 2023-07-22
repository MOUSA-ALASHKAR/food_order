import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/core/translations/app_translations.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_order/ui/shared/custom_widgets/button_widget.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';


class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {

  List<String> imageList=['intro0','intro1','intro2'];

  List<String> titleList=[tr("intro_title_1"),tr("intro_title_2"),tr("intro_title_3")];

  List<String> descriptionList=[
    tr("intro_desc_1"),
    tr("intro_desc_2"),
    tr("intro_desc_3"),
  ];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(30) , vertical: screenWidth(25)),
            child: Column(
              children: [

               SvgPicture.asset('images/intro$currentIndex.svg'),

               Padding(
                 padding: EdgeInsetsDirectional.only(top: screenWidth(10) , bottom: screenWidth(10)),
                 child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    color: AppColors.mainTextColor2, // Inactive color
                    activeColor: AppColors.mainOrangeColor,
                  ),
              ),
               ),

                Text(titleList[currentIndex] , style: TextStyle(fontSize: screenWidth(15) , fontWeight: FontWeight.bold),),

                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
                  child: Text(descriptionList[currentIndex] , textAlign: TextAlign.center ,style: TextStyle(fontSize: screenWidth(25)),),
                ),

                Spacer(),

                ButtonWidget(
                    text: currentIndex !=2 ? tr("intro_button_next") : tr("intro_button_finish"),
                    onPressed: (){
                      if (currentIndex !=2) {
                        setState(() {
                          currentIndex=currentIndex+1;
                        });
                      }
                      else
                      Get.to(LandingView());
                } ),

              ],
            ),
          ),
        ),
    );
  }
}
