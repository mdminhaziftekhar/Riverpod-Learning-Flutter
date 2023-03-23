import 'dart:convert';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_learning/constants/api_constants.dart';

import '../model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(apiEndpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      return result
          .map(
            (e) => UserModel.fromJson(e),
          )
          .toList();
    } else {
      throw Exception(response.reasonPhrase);  
    }
  }
}
