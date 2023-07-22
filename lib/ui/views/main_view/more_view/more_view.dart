import 'package:flutter/material.dart';
import 'package:food_order/app/my_app.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/setting_field_item.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/cart_view/cart_view.dart';
import 'package:food_order/ui/views/map_view/map_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';




class MoreView extends StatefulWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  _MoreViewState createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [

              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: size.width * 0.06,
                    start: size.width * 0.07,
                    end: size.width * 0.05,
                    bottom: size.width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More',
                      style: TextStyle(
                      color: AppColors.mainTextColor1,
                      fontSize: size.width * 0.06),
                    ),
                    InkWell(
                      onTap: (){
                        Get.defaultDialog(
                            title: 'Change Language',
                            content: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      storage.setAppLanguage('en');
                                      Get.updateLocale(getLocal());
                                      Get.back();
                                    },
                                    child: Text('English')),
                                TextButton(
                                    onPressed: () {
                                      storage.setAppLanguage('ar');
                                      Get.updateLocale(getLocal());
                                      Get.back();
                                    },
                                    child: Text('العربية')),
                              ],
                            ));
                      },
                      child: Icon(
                        Icons.language,
                        color: AppColors.mainTextColor1,
                      ),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () async
                {
                  LocationData? currentLocation = await locationService.getCurrentLocation();
                  if(currentLocation != null )
                    Get.to(MapView(currentLocation: currentLocation,));
                },
                child: SettingFieldItem(
                  name: 'Payment Details',
                  imageName: 'payment_details_icon',
                ),
              ),

              InkWell(
                  onTap: ()
                  {
                    Get.to(CartView());
                    },child: SettingFieldItem(
                  name: 'My Orders',
                  imageName: 'my_orders_icon',
              )
              ),

              SettingFieldItem(
                  name: 'Notifications',
                  imageName: 'notifications_icon',
                  colorBadge: Colors.red,
              ),

              SettingFieldItem(
                name: 'Inbox',
                imageName: 'inbox_icon',
              ),

              SettingFieldItem(
                name: 'About Us',
                imageName: 'about_us_icon',
              ),

            ],
          ),
        ));
  }
}
