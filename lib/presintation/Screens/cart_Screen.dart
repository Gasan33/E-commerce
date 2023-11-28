import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int counter = 1;
  double getTotalPrice(double price) {
    return price * counter;
  }

  Widget quantaty() {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: 128,
      color: Colors.green,
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.pinkAccent.shade700,
              ),
            ),
            Text(
              counter.toString(),
              style: TextStyle(
                  color: Colors.pinkAccent.shade700,
                  //fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                if (counter == 1) {
                } else {
                  setState(() {
                    counter--;
                  });
                }
              },
              icon: Icon(
                Icons.remove,
                color: Colors.pinkAccent.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 128,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size / 4,
                          height: 128,
                          color: Colors.black,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: size / 2.5,
                              height: 56,
                              color: Colors.amber,
                              child: const Text(
                                'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: size / 3,
                              height: 56,
                              color: Colors.blue,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('data'),
                                  Text('data'),
                                ],
                              ),
                            )
                          ],
                        ),
                        quantaty()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  )
                ],
              );
            }),
      ),
      bottomSheet: Container(
        color: Colors.amber,
        height: MediaQuery.of(context).size.height / 5,
        padding: const EdgeInsets.all(16.0),
        child: buildBottomWidgets(),
      ),
    );
  }

  Widget buildBottomWidgets() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.blueAccent.shade200,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
              ),
              Text('data')
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade300,
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: Text('data')),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width / 1.6,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                  color: Colors.pinkAccent.shade700,
                  border:
                      Border.all(width: 1, color: Colors.pinkAccent.shade700)),
              child: Center(
                child: Text('data'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
