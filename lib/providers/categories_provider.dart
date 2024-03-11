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

  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final json = await BackendApi.post('/categorias', data);
      final newCategory = Categoria.fromMap(json);

      categories.add(newCategory);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};

    try {
      final json = await BackendApi.put('/categorias/$id', data);

      this.categories = this.categories.map((category) {
        if (category.id != id) return category;

        category.nombre = name;
        return category;
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future deleteCategory(String id) async {
    try {
      final json = await BackendApi.delete('/categorias/$id', {});

      categories.removeWhere((categoria) => categoria.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
