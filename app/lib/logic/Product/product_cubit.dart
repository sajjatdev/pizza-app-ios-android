import 'dart:convert';

import 'package:app/model/productModel.dart';
import 'package:app/services/product/p_services.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final P_services _p_services;
  ProductCubit(this._p_services) : super(ProductInitial());

  void ProductGetfunction() async {
    http.Response? response = await _p_services.ProductAPI();
    if (response!.statusCode == 200) {
      emit(ProductSuccessGet(
          productModel: ProductModel.fromJson(json.decode(response.body))));
    } else {
      emit(ProductError(message: "Product error"));
    }
  }
}
