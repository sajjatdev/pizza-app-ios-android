import 'dart:convert';

import 'package:app/helper/config.dart';
import 'package:app/model/CollectionModel.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<collectionModel?> CollectionAPI() async {
    final response = await http.get(Uri.parse(CollectionURL),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return collectionModel.fromJson(json.decode(response.body));
    }
  }
}
