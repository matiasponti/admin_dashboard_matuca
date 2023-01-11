import 'package:admin_dashboard_matuca/api/backend_api.dart';
import 'package:admin_dashboard_matuca/models/http/categories_response.dart';
import 'package:admin_dashboard_matuca/models/http/category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  getCategories() async {
    final resp = await BackendApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);

    this.categories = [...categoriesResponse.categorias];

    notifyListeners();
  }
}
