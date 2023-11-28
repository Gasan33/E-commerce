// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopping/Constants/strings.dart';
import 'package:shopping/data/Models/categories.dart';

class CategoriesApi {
  Dio? dio;
  Duration x = const Duration(seconds: 60);
  CategoriesApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: x,
      receiveTimeout: x,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getCategories() async {
    List allCategories = [];
    try {
      Response response = await dio!.get('/categories');
      //print(response.data.toString());
      if (response.statusCode == 200) {
        allCategories.add(Categories.fromJson(
            jsonDecode(response.data) as Map<String, dynamic>));
        return allCategories;
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
    return [];
  }
}
