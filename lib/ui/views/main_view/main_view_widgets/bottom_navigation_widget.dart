import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/core/translations/app_translations.dart';

import '../../../../core/enums/bottom_navigation.dart';
import '../../../shared/colors.dart';

class BottomNavigationWidget extends StatefulWidget {

  final BottomNavigationEnum bottomNavigation;
  final Function (BottomNavigationEnum ,int) onTap;

  const BottomNavigationWidget({super.key, required this.bottomNavigation, required this.onTap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: (){
            widget.onTap(BottomNavigationEnum.HOME,2);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: size.width * 0.11),
            child: CircleAvatar(
              radius: size.width * 0.08,
              backgroundColor: widget.bottomNavigation==BottomNavigationEnum.HOME ? AppColors.mainOrangeColor : AppColors.mainTextColor2,
              child: SvgPicture.asset(
                "images/ic_home.svg",
                color: AppColors.mainWhiteColor,
                width: size.width*0.06,
              ),
            ),
          ),
        ),

        CustomPaint(
          painter: ClipShadowShadowPainter(
            shadow: Shadow(
              blurRadius: 12,
              offset: Offset(0, 1),
              color: AppColors.mainTextColor2
            ),
            clipper: BottomClip(),
          ),
          child: ClipPath(
            clipper: BottomClip(),
            child: Container(
              width: size.width,
              height: size.width * 0.2,
              color: AppColors.mainWhiteColor,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: size.width * 0.05,
          start: size.width * 0.05,
          end: size.width * 0.05,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    navItem(
                      onTap: (){
                        widget.onTap(BottomNavigationEnum.MENU,0);
                      },
                        size: size,
                        imageName: "ic_menu",
                        text: tr("navBar_menu"),
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.MENU),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.OFFERS,1);
                        },
                        size: size,
                        imageName: "ic_shopping",
                        text: tr("navBar_offers"),
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.OFFERS),
                  ],
                ),
                Row(
                  children: [
                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.PROFILE,3);
                        },
                        size: size,
                        imageName: "ic_user",
                        text: tr("navBar_profile"),
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.PROFILE),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.MORE,4);
                        },
                        size: size,
                        imageName: "ic_more",
                        text: tr("navBar_more"),
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.MORE),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required Size size,
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: (){ onTap(); },
      child: Column(
        children: [
          SvgPicture.asset(
            "images/$imageName.svg",
            width: size.width * 0.045,
            color:
            isSelected ? AppColors.mainOrangeColor : AppColors.mainTextColor2,
          ),
          Text(text,style: TextStyle(color: isSelected ? AppColors.mainOrangeColor : AppColors.mainTextColor2),),
        ],
      ),
    );
  }
}


class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000, size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000, size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000, size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000, size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

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