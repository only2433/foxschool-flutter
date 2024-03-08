
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';

class FoxschoolLocalization
{
  String filePath;
  late Map<String, dynamic> data;
  FoxschoolLocalization({
    required this.filePath
  });

  Future<String> _loadStringAssets() async{
    return await rootBundle.loadString(filePath);
  }

  Future<void> onSetting() async
  {
    String temp = await _loadStringAssets();
    data = json.decode(temp);
  }
}