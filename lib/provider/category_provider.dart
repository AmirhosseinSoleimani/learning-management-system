import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryProvider with ChangeNotifier{

  List<CategoryList> _category = [];

  List<CategoryList> get category{
    return _category;
  }

  String categorySelected = '';
  String categoryIdSelected = '';
  bool categoryEnd = false;

  Future<void> fetchCategoryList() async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/courses/list-categories/');
    final response = await http.get(url,headers: {
      'accept': 'application/json',
    });
    if(response.statusCode == 200){
      final extractedData = jsonDecode(response.body);
      List<dynamic> data = extractedData["category_list"];
      List<CategoryList> categoryList = data.map((e) => CategoryList.fromJson(e)).toList();
      _category = categoryList;
      debugPrint(data.toString());
      debugPrint(response.statusCode.toString());
      notifyListeners();
    }

  }

  void findIdCategory(String categoryTitle){
    final indexId = category.indexWhere((element) => element.name == categoryTitle);
    categoryIdSelected = category[indexId].id!;
    notifyListeners();
  }
}