import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Menuitem currentItem;
  final ValueChanged<Menuitem> onSelectedItem;
  const Menu(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.teal.shade300,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Spacer(),
            const SizedBox(
              height: 60.0,
            ),
            Container(
              alignment: Alignment.center,
              //margin: EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/images/user.png",
                height: 100.0,
                width: 100.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'user name',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...Menuitems.all.map(buildMenuItem).toList(),
            const Spacer(
              flex: 2,
            ),

            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                    //margin: EdgeInsets.only(bottom: 10.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () => {
                                  // _onlogoutSubmit(),
                                  // Navigator.of(context).pushNamed('/Login')
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          side: const BorderSide(
                                              color: Colors.black, width: 3))),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 50.0,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'logout',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   alignment: Alignment.bottomCenter,
                            //   child: Image.asset(
                            //     "assets/images/Bus_1.png",
                            //     height: 30.0,
                            //     width: 30.0,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                            // const Text(
                            //   'v 1.0',
                            //   textAlign: TextAlign.center,
                            // ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget buildMenuItem(Menuitem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: currentItem == item,

          //minLeadingWidth: 20.0,
          // leading: Text(item.title),
          // title: Icon(item.icon),
          onTap: () => onSelectedItem(item),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(item.icon),
              const SizedBox(
                width: 8.0,
              ),
              Text(item.title),
            ],
          ),
        ),
      );
}

class Menuitems {
  static const home = Menuitem(
    icon: Icons.home,
    title: 'Home',
  );
  static const Cart = Menuitem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  );
  // static const Logout = Menuitem(
  //   icon: Icons.logout,
  //   title: 'تسجيل الخروج',
  // );

  static const all = <Menuitem>[
    home,
    Cart,
    // Logout,
  ];
}

class Menuitem {
  final String title;
  final IconData icon;

  const Menuitem({required this.title, required this.icon});
}
