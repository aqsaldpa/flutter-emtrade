import 'dart:convert';

import 'package:emtrade_test_apps/data/model/card_models.dart';
import 'package:http/http.dart' as http;

import '../../common/config.dart';

class EmtradeRemoteDataSource {
  Future<CardModels> getListCard() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return CardModels.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed load games");
    }
  }
}
