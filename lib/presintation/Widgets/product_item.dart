// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shopping/Constants/strings.dart';
import 'package:shopping/data/Models/products.dart';

class ProductItem extends StatelessWidget {
  final Products products;
  const ProductItem({super.key, required this.products});

  String getImage() {
    List img = [];
    img = products.images;
    print(img[0]);
    return img[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, productDetalScreen,
            arguments: products),
        child: GridTile(
          footer: Hero(
            tag: products.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                products.title,
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            //color: Colors.black,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: getImage().isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'images/loading.gif',
                    image: getImage(),
                    fit: BoxFit.cover,
                  )
                : Image.asset('images/loading.gif'),
          ),
        ),
      ),
    );
  }
}
