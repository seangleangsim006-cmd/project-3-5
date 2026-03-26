import 'package:flutter/material.dart';
import 'package:project_3_5/model/product.dart';
import 'package:project_3_5/service/api_service.dart';

class ProductProvider extends ChangeNotifier{
  List<Product> _products = [];
  bool _isLoading = false;
  String? _isError;

  // getter
  List<Product> get product => _products;
  bool get isLoading => _isLoading;
  String? get isError => _isError; 

  Future<void> fetchProduct() async{
    _isLoading = true;
    notifyListeners();
    try{
      _products = await ApiService.getProduct();
      _isLoading = false;
      notifyListeners();
    }catch(e){
      _products =[];
      _isError = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

}