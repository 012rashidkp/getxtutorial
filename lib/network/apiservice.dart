
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getxexample/Model/movieResponse.dart';
import 'package:getxexample/network/urls.dart';

class ApiService {
   Dio _dio=Dio(); // Dio instance to perform HTTP requests.
   final String _url = base_url;


  Future<MovieResponse?> getUsers() async {
    try {
      Response response=await _dio.get(_url
      );

      if(response.statusCode==200){
        print('getresponse... ${response.data}');

        return MovieResponse.fromJson(response.data);

        // return List<User>.from(data.map((e) => User.fromJson(e)));

      }
      else{

        print("not success");
      }

    } catch (e) {
      // If any exception occurs during the API call, throw an exception with the error message.
      throw Exception('An error occurred: $e');
    }
  }
}