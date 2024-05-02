
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxexample/Model/movieResponse.dart';

import 'apiservice.dart';

class UserRepository {
  final ApiService _apiService = ApiService(); // Use GetX's Get.find() to get the ApiService instance.

  Future<MovieResponse?> getUsers() async {
    try {
      final data = await _apiService.getUsers();

      return data;
    } catch (e) {
      print('myresponse... error');
      throw Exception('Failed to fetch users');
    }
  }
}