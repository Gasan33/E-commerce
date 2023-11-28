import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/Constants/strings.dart';
import 'package:shopping/data/Models/categories.dart';
import 'package:shopping/data/Models/products.dart';
// ignore: unused_import
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shopping/presintation/Screens/product_detals_screen.dart';
import 'package:shopping/presintation/Widgets/www.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Products> items = [];
  List<Categories> items2 = [];
  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //List.generate(15, (index) => 'Item ${index + 1}');
  final scrollcontroller = ScrollController();
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    page = 0;
    fetsh();
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.maxScrollExtent ==
          scrollcontroller.offset) {
        fetsh();
      }
    });
    super.initState();
  }

  Future fetsh() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    const limit = 25;
    final url = Uri.parse('$baseUrl/products?offset=$page&limit=$limit');
    final url2 = Uri.parse('$baseUrl/categories');
    final response = await http.get(url);
    final response2 = await http.get(url2);
    if (response.statusCode == 200 && response2.statusCode == 200) {
      //print(response2.body);
      final List newItems = json.decode(response.body);
      final result = postFromJson(response.body);
      // final List newItems2 = json.decode(response2.body);
      final result2 = postFromJson2(response2.body);
      setState(() {
        page = page + limit;
        isLoading = false;
        if (newItems.length < limit) {
          hasMore = false;
        }
        items.addAll(result);
        items2.addAll(result2);
        print(items2[0].image);
        
      });
    } else {
      return;
    }
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 0;
      items.clear();
    });
    fetsh();
  }

  Widget buildImageWidget(BuildContext context, int index) {
    if (index == items.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (index < items.length) {
      index++;
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FadeInImage.assetNetwork(
          width: MediaQuery.of(context).size.width,
          height: 150,
          placeholder: 'assets/images/loading.gif',
          image: items[index].images.first,
          fit: BoxFit.contain,
        ),
      );
    }
    return Container();
  }

  Widget category(BuildContext context, int index) {
    if (index == items2.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (index < items2.length) {
      return Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: Image.network(
                width: 150,
                height: 150,
                //placeholder: 'assets/images/loading.gif',
                items2[index].image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            items2[index].name,
            style: const TextStyle(fontSize: 16),
          )
        ],
      );
    }
    return Container();
  }

  Widget product(BuildContext context, int index) {
    if (index == items.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (index < items.length) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            child: FadeInImage.assetNetwork(
              width: MediaQuery.of(context).size.width / 3,
              height: 150,
              placeholder: 'assets/images/loading.gif',
              image: items[index].images.first,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
                  color: Colors.white),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          items[index].title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          items[index].price.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ProductDetalScreen(
                            itemId: items[index].id,
                          );
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.pinkAccent.shade700),
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
                    ),
                  )
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 64,
          // )
        ],
      );
    }
    return Container();
  }

  Widget flex() {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildImageWidget(context, index);
        });
  }

  Widget flex2() {
    return ListView.builder(
        itemCount: items2.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            margin: const EdgeInsets.all(8.0),
            child: category(context, index),
          );
        });
  }

  Widget flex3() {
    return ListView.builder(
        controller: scrollcontroller,
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            // padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent),
            child: product(context, index),
          );
        });
  }

  Widget bulidScreen() {
    return ListView.builder(
        // controller: scrollcontroller,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index < items.length) {
            final item = items[index];
            return ListTile(
              title: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade300),
                child: Column(
                  children: [
                    FadeInImage.assetNetwork(
                      // width: double.infinity,
                      // height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: item.images.first,
                      fit: BoxFit.cover,
                    ),
                    Text(item.title)
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Center(
                  child: hasMore
                      ? const CircularProgressIndicator()
                      : const Text('No More Data To Load')),
            );
          }
        });
  }

  Widget categoryText() {
    return Container(
      color: Colors.transparent,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 16.0,
                height: 48,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 8.0,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.pinkAccent.shade700,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: 16.0,
            height: 48,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget dealsText() {
    return Container(
      color: Colors.white,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 8.0,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.pinkAccent.shade700,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Today Deals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('infinet Scroll view'),
        // ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, left: 8.0, right: 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    color: Colors.grey.shade200),
                                child: flex(),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            categoryText(),
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  color: Colors.transparent),
                              child: flex2(),
                            ),
                            dealsText(),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2.5,
                              // padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  color: Colors.transparent),
                              child: flex3(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return buildNoInternetWidget();
              }
            },
            child: showLoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
