import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:practicas/models/news_model.dart';

class NewsProvider {
  // Funcion que retorna listado de Noticias
  Future<List<NewModel>> fetchNews() async {
    String jsonString =
        await rootBundle.loadString('assets/json/example_json.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> data = jsonData['data'];
    await Future.delayed(const Duration(seconds: 1));
    return data.map((item) => NewModel.fromJson(item)).toList();
  }
}
