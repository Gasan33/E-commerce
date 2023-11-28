import 'package:flutter/material.dart';

PreferredSizeWidget customeAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    iconTheme: const IconThemeData(color: Colors.amber),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 12, left: 12, top: 10, bottom: 10),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        //margin: EdgeInsets.only(right: 16.0),
        child: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () => {Navigator.of(context).pop()},
            iconSize: 16.0,
            //tooltip: 'search',
            //icon: Image.asset("assets/images/m_1.png"),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.amber,
            ),
          );
        }),
      ),
    ),

    //centerTitle: true,
    title: Text('data'),
    actions: [
      Container(
        alignment: Alignment.center,
        padding:
            const EdgeInsets.only(right: 12, left: 12, top: 10, bottom: 10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          //margin: EdgeInsets.only(right: 16.0),
          child: Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () => {Navigator.of(context).pop()},
              iconSize: 16.0,
              //tooltip: 'search',
              //icon: Image.asset("assets/images/m_1.png"),
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ),
            );
          }),
        ),
      ),
    ],

    //leading: BackButton(color: Colors.black),
  );
}

Widget buildNoInternetWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/no_internet.gif',
          width: double.infinity,
          height: 200,
        ),
        const Text(
          'No Internet Connection',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
      ],
    ),
  );
}

Widget showLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.orange,
    ),
  );
}


InputDecoration textFormFieldDecoration(
    {required String hintText,}) {
  return InputDecoration(
    // counterText: hintText == 'Description'
    //     ? '${500 - enteredText.length}/500'
    //     : hintText == 'Objective'
    //         ? '${500 - enteredText.length}/500'
    //         : null,
    // hintText: hintText == 'Portfolio'
    //     ? 'Weblink,LinkedIn,Twitter etc...'
    //     : hintText == 'Grade/GBA'
    //         ? '3.50/4.00 or 1000/1100'
    //         : hintText,
    hintStyle: TextStyle(color: Colors.grey.shade300),
    errorStyle: const TextStyle(color: Colors.red),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.black38,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.black38,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}