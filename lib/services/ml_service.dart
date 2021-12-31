import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MLService {
  Dio dio = Dio();

  Future<Uint8List?> convert2Text(Uint8List script) async {
    try {
      var encodedData = await compute(base64Encode, script);
      Response response = await dio
          .post('http://192.168.0.30:5000/', data: {'txt': encodedData});

      String result = response.data;
      return compute(base64Decode, result);
    } catch (e) {
      return null;
    }
  }
}
