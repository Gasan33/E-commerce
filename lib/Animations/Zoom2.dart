import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopping/Animations/Menu.dart';
import 'package:shopping/Bottom_Navigation/bottom_navigation.dart';
import 'package:shopping/presintation/Screens/cart_Screen.dart';

class Zoom2 extends StatefulWidget {
  const Zoom2({Key? key}) : super(key: key);

  @override
  State<Zoom2> createState() => _ZoomState();
}

class _ZoomState extends State<Zoom2> {
  Menuitem currentItem = Menuitems.home;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ZoomDrawer(
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        style: DrawerStyle.defaultStyle,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        androidCloseOnBackTap: true,
        angle: 0.0,
        showShadow: true,
        isRtl: false,
        moveMenuScreen: false,
        drawerShadowsBackgroundColor: const Color(0xFFf4e6ae),
        menuBackgroundColor: Colors.teal.shade300,
        menuScreen: Builder(builder: (context) {
          return Menu(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() {
                  currentItem = item;
                  ZoomDrawer.of(context)!.close();
                });
              });
        }),
        mainScreen: getScreen(),
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case Menuitems.home:
        return const BottomNavigation();
      case Menuitems.Cart:
        return const CartScreen();
      default:
        return const BottomNavigation();
    }
  }
}
