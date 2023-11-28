// ignore_for_file: duplicate_import

import 'package:shopping/data/Api/products_api.dart';
import 'package:shopping/data/Models/products.dart';

class ProductsRepository {
  final ProductsApi productsApi;

  ProductsRepository(this.productsApi);

  Future<List<Products>> getProduct(int limit, int page) async {
    final product = await productsApi.getProducts(limit, page);
    return product.map((product) => Products.fromJson(product)).toList();
  }
}
