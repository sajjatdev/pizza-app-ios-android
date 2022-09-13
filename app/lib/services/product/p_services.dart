import 'dart:convert';

import 'package:app/helper/config.dart';
import 'package:app/model/CollectionModel.dart';
import 'package:app/model/productModel.dart';
import 'package:http/http.dart' as http;

class P_services {
  Future<http.Response?> ProductAPI() async {
    final response = await http.get(Uri.parse(ProductsURL),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return response;
    }
  }
}
