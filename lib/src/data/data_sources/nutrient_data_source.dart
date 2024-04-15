import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/src/data/dto/nutrient_dto.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:http/http.dart' as http;

final nutrientDataSourceProvider = Provider<NutrientDataSource>((ref) {
  return NutrientDataSource(ref);
});

class NutrientDataSource {
  final Ref ref;
  NutrientDataSource(this.ref);
  Future<List<NutrientDto>> searchNutrient(String qurey) async {
    String searchUrl =
        "${dotenv.env["SEARCH_API"]}?serviceKey=${dotenv.env["SERVICE_KEY"]}&numOfRows=30&pageNo=1&type=json&desc_kor=$qurey";
    final response = await http.get(Uri.parse(searchUrl));
    var data = json.decode(response.body);
    final items = data['body']['items'] as List;
    List<NutrientDto> nutrients =
        items.map((item) => NutrientDto.fromJson(item)).toList();
    return nutrients;
  }

  Future<List<NutrientModel>> saveNutrient(
      List<NutrientModel> nutrients) async {
    try {
      CollectionReference collectionRef = FirebaseFirestore.instance
          .collection('회원정보')
          .doc('park')
          .collection('식단');
      collectionRef.add(nutrients);
      return nutrients;
    } catch (e) {
      throw Exception(e);
    }
  }
}
