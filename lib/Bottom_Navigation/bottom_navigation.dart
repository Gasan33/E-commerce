import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopping/presintation/Screens/cart_Screen.dart';
import 'package:shopping/presintation/Screens/home_Screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  final pageIndex;
  const BottomNavigation({super.key, this.pageIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  final screenPages = [
    const HomeScreen(),
    const CartScreen(),
    const HomeScreen(),
  ];

  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget tit() {
    return Container(
      height: 80,
      width: double.infinity,
      child: Row(
        //zmainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              iconSize: 24.0,
              //tooltip: 'search',
              // icon: Image.asset(
              //   "assets/images/menu.png",
              //   fit: BoxFit.cover,
              // ),
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
            );
          }),
          Container(
              //color: Colors.transparent,
              height: 48,
              width: MediaQuery.of(context).size.width / 1.13,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: _textController,
                cursorColor: Colors.grey.shade300,
                decoration: InputDecoration(
                  hintText: 'Search',
                  icon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey.shade300,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: tit(),
      ),
      body: screenPages[pageIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GNav(
              onTabChange: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.pinkAccent.shade700,
              padding: const EdgeInsets.all(8),
              gap: 8,
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.person_2,
                  text: 'User',
                ),
              ]),
        ),
      ),
    );
  }
}


// NavigationBarTheme(
//         data: NavigationBarThemeData(
//             indicatorColor: Colors.amber,
//             labelTextStyle: MaterialStateProperty.all(
//                 const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
//         child: NavigationBar(
//           labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
//             height: 60,
//             backgroundColor: Colors.white,
            
//             selectedIndex: pageIndex,
//             onDestinationSelected: (index) {
//               setState(() {
//                 pageIndex = index;
//               });
//             },
//             destinations: const [
//               NavigationDestination(
//                 icon: Icon(Icons.home_outlined),
//                 label: 'label',
//                 selectedIcon: Icon(Icons.home),
//               ),
//               NavigationDestination(
//                 icon: Icon(Icons.shopping_cart_outlined),
//                 label: 'chart',
//                 selectedIcon: Icon(Icons.shopping_cart_sharp),
//               ),
//               NavigationDestination(
//                 icon: Icon(Icons.person_2_outlined),
//                 label: 'user',
//                 selectedIcon: Icon(Icons.person_2),
//               ),
//             ]),
 