import 'dart:convert';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:shopping/Constants/strings.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/data/Models/products.dart';
import 'package:shopping/presintation/Widgets/www.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetalScreen extends StatefulWidget {
  final int itemId;

  const ProductDetalScreen({super.key, required this.itemId});

  @override
  State<ProductDetalScreen> createState() => _ProductDetalScreenState();
  int getId() {
    return itemId;
  }
}

class _ProductDetalScreenState extends State<ProductDetalScreen> {
  List oneItem = [];
  double rating = 0.0;
  int counter = 1;

  late int id;
  late String title;
  late int price = 0;
  late String description;
  late List images = [];
  late String creationAt;
  late String updatedAt;
  late Category category;

  Future getOneItem(int id) async {
    final url = Uri.parse('$baseUrl/products/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      //print(result);

      id = (result['id']);
      title = (result['title']);
      price = (result['price']);
      description = (result['description']);
      images = (result['images']);
      creationAt = (result['creationAt']);
      updatedAt = (result['updatedAt']);
      //category = (result['category']);
      print(images.first);
      setState(() {
        //oneItem.add(result);
        //print(oneItem);
      });
    }
  }

  @override
  void initState() {
    getOneItem(widget.itemId);
    super.initState();
  }

  Widget titleAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => {Navigator.of(context).pop()},
              iconSize: 24.0,
              //tooltip: 'search',
              //icon: Image.asset("assets/images/m_1.png"),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              '${price.toDouble()}.000SR',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.pinkAccent.shade700,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Icon(
          Icons.share_rounded,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget buildDivider() {
    return const Divider(
      height: 48,
      // endIndent: ,
      color: Colors.grey,
      thickness: 1,
    );
  }

  Widget ratingBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            RatingBar(
              initialRating: 0,
              maxRating: 5,
              minRating: 1,
              itemSize: 24,
              // itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              allowHalfRating: true,
              updateOnDrag: true,
              glow: false,
              onRatingUpdate: (rate) {
                setState(() {
                  rating = rate;
                });
                print(rating);
              },
              ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
                  half: const Icon(
                    Icons.star_half_rounded,
                    color: Colors.amber,
                  ),
                  empty: const Icon(
                    Icons.star_rounded,
                    color: Colors.grey,
                  )),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text('($rating)')
          ],
        ),
        IconButton(
          color: Colors.orange,
          onPressed: () {
            setState(() {});
          },
          icon: const Icon(Icons.favorite_border_rounded),
        ),
      ],
    );
  }

  Widget quantity() {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          //color: Colors.grey,
          border: Border.all(width: 1, color: Colors.grey)),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (counter == 1) {
                } else {
                  setState(() {
                    counter--;
                  });
                }
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
            Text(
              counter.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  //fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget descriptionMethod(String title, String detal) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ExpandableText(
              detal,
              animation: true,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              expandText: 'show more',
              collapseText: 'show less',
              maxLines: 1,
              linkColor: Colors.pinkAccent.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget detals(String title, String detal) {
    return title == 'Description :' || title == 'Seller :'
        ? descriptionMethod(title, detal)
        : Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  textDirection: TextDirection.ltr,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            title == 'Quantity :'
                ? quantity()
                : title == 'Brand :'
                    ? Text(
                        detal,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 16.0),
                      )
                    : title == 'Total Price :'
                        ? Text(
                            '${getTotalPrice(price as double)}.000SR',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.pinkAccent.shade700,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            detal,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.pinkAccent.shade700,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
          ]);
  }

  double getTotalPrice(double price) {
    return price * counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return CustomScrollView(slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(10),
                  child: Container(
                      // child: const Text('data'),
                      ),
                ),
                pinned: true,
                expandedHeight: 300,
                title: titleAppBar(),
                flexibleSpace: FlexibleSpaceBar(
                    background: FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: 150,
                  placeholder: 'assets/images/loading.gif',
                  image: images.first,
                  fit: BoxFit.cover,
                )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      ratingBar(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      detals('Brand :', title),
                      const SizedBox(
                        height: 8.0,
                      ),
                      buildDivider(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      detals('Price :', price.toString()),
                      const SizedBox(
                        height: 8.0,
                      ),
                      buildDivider(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      detals('Quantity :', ''),
                      const SizedBox(
                        height: 56.0,
                      ),
                      detals('Total Price :', ''),
                      const SizedBox(
                        height: 8.0,
                      ),
                      buildDivider(),
                      detals('Seller :', 'MDT LOUNGE -12'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      buildDivider(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      detals('Description :', description)
                    ],
                  ),
                ),
              )
            ]);
          } else {
            return buildNoInternetWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
      bottomNavigationBar: Container(
        height: 48,
        color: Colors.pinkAccent.shade700,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
