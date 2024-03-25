import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:health_care/src/data/dto/nutrient_dto.dart';
import 'package:http/http.dart' as http;

class NutrientDataSource {
  Future<List<NutrientDto>> searchNutrient(String qurey) async {
    String searchUrl =
        "${dotenv.env["SEARCH_API"]}?serviceKey=${dotenv.env["SERVICE_KEY"]}&numOfRows=1&pageNo=1&type=json&desc_kor=$qurey";
    final response = await http.get(Uri.parse(searchUrl));
    var data = json.decode(response.body);
    final items = data['body']['items'] as List;
    List<NutrientDto> nutrients =
        items.map((item) => NutrientDto.fromJson(item)).toList();
    return nutrients;
  }
}
