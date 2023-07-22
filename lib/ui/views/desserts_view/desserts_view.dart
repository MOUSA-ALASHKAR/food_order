import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/menu_type_widget.dart';

class DessertsView extends StatefulWidget {
  const DessertsView({Key? key}) : super(key: key);

  @override
  State<DessertsView> createState() => _DessertsViewState();
}

class _DessertsViewState extends State<DessertsView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(

          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: size.width*0.03),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: size.width*0.03 , horizontal: size.width*0.05),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios),
                        SizedBox(width: size.width*0.03),
                        Text('Desserts'),
                        Spacer(),
                        Icon(Icons.shopping_cart),
                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,

                    margin: EdgeInsetsDirectional.symmetric( horizontal: size.height * 0.02 , vertical: size.height * 0.01),
                    padding: EdgeInsetsDirectional.symmetric(horizontal: size.height * 0.02 , vertical: size.height * 0.01),

                    height: size.height * 0.06,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],

                    ),
                    child: TextField(
                      cursorColor:AppColors.mainTextColor1,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: AppColors.mainTextColor1,
                        ),
                        hintText: "Search food",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),

                  SizedBox(height: size.width*0.02),

                  MenuTypeWidget(imageName: 'French_Apple_Pie', title: 'French Apple Pie', type: 'Minute by tuk tuk Desserts',),
                  MenuTypeWidget(imageName: 'Dark_Chocolate_Cake', title: 'Dark Chocolate Cake', type: 'Cakes by Tella Desserts',),
                  MenuTypeWidget(imageName: 'Street_Shake', title: 'Street Shake', type: 'Café Racer Desserts',),
                  MenuTypeWidget(imageName: 'Chewy_Brownies', title: 'Fudgy Chewy Brownies', type: 'Minute by tuk tuk Desserts',),

                ],
              ),
            ),
          ),

        ),
    );
  }
}
