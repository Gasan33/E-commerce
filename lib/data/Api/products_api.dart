// ignore_for_file: avoid_print, unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Constants/strings.dart';
import 'package:json_helpers/json_helpers.dart';
import 'package:shopping/data/Models/products.dart';

class ProductsApi {
  Dio? dio;
  Duration x = const Duration(seconds: 60);
  ProductsApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: x,
      receiveTimeout: x,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getProducts(int limit, int page) async {
    List allProducts = [];
    try {
      Response response = await dio!.get('/products?offset=$page&limit=$limit');
      //print(response.data.toString());
      if (response.statusCode == 200) {
        allProducts.add(Products.fromJson(
            jsonDecode(response.data) as Map<String, dynamic>));
        print(allProducts);
        return allProducts;
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
    return [];
  }
}
