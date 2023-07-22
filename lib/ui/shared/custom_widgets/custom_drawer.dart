import 'package:flutter/material.dart';
import 'package:food_order/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      width: size.width*0.65,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: size.width*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            drawerItem(size: size, iconName: Icons.home, text: 'home', onTap: (){
              Get.back();
              Get.to(LoginView());
            }),
            drawerItem(size: size, iconName: Icons.home, text: 'login', onTap: (){onTap(){}}),
          ],
        ),
      ),
    );
  }

  Widget drawerItem({
    required Size size,
    required IconData iconName,
    required String text,
    required Function onTap,
  }) {
    return InkWell(
      onTap: (){ onTap(); },
      child: Row(
        children: [
          Icon(iconName),
          Text(text),
        ],
      ),
    );
  }

}
