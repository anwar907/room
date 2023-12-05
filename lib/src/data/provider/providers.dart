import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:house/src/data/models/hotel_models.dart';

class DataProviders {
  Future<HotelModels> fetchData() async {
    try {
      final response =
          await rootBundle.loadString('assets/data_dummy.json', cache: false);

      Map<String, dynamic> result = jsonDecode(response);

      return HotelModels.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }
}
