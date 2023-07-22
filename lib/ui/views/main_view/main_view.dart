import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_drawer.dart';
import 'package:food_order/ui/views/main_view/home_page_view/home_page_view.dart';
import 'package:food_order/ui/views/main_view/menu_view/menu_view.dart';
import 'package:food_order/ui/views/main_view/more_view/more_view.dart';
import 'package:food_order/ui/views/main_view/offers_view/offers_view.dart';
import 'package:food_order/ui/views/main_view/profile_view/profile_view.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import '../../../core/enums/bottom_navigation.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';



class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();

  BottomNavigationEnum select = BottomNavigationEnum.MENU;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        key: key,
        drawer: CustomDrawer(),
        resizeToAvoidBottomInset: false,
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(content: Text('Tap back again to exit'),),
          child: Stack(
            children: [
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  MenuView(),
                  OffersView(),
                  HomePageView(onPressed: (){key.currentState!.openDrawer();},),
                  ProfileView(),
                  MoreView(),
                ],
              ),

              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: BottomNavigationWidget(
                  bottomNavigation: select,
                  onTap: (selected , pageNumber ) {
                    // key.currentState!.openDrawer();
                    setState(() {
                      select = selected;
                    }
                    );
                    controller.jumpToPage(pageNumber);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}