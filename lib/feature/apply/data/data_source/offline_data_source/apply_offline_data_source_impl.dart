import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/apply/data/data_source/offline_data_source/apply_offline_data_source.dart';

@Injectable(as: ApplyOfflineDataSource)
class ApplyOfflineDataSourceImpl implements ApplyOfflineDataSource {
  @override
  Future<List> getCountries() async {
    String jsonString =
        await rootBundle.loadString("assets/files/country.json");
    return jsonDecode(jsonString);
  }
}
