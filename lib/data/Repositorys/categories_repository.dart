// ignore_for_file: duplicate_import

import 'package:shopping/data/Api/categories_api.dart';
import 'package:shopping/data/Models/categories.dart';

class CategoriesRepository {
  final CategoriesApi categoriesApi;

  CategoriesRepository(this.categoriesApi);

  Future<List<Categories>> getCategory() async {
    final category = await categoriesApi.getCategories();
    return category.map((category) => Categories.fromJson(category)).toList();
  }
}
