import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_3_5/model/product.dart';

class ApiService {
  static String url = "https://seangleangsim006-cmd.github.io/fake-json-2-5/";
  static Future<List<Product>> getProduct () async{
    final respone = await http.get(Uri.parse(url));
    if(respone.statusCode == 200){
      List data = jsonDecode(respone.body);
      return data.map((e)=>Product.fromJson(e)).toList();
    }else{
      throw Exception("Error");
    }

  }
}