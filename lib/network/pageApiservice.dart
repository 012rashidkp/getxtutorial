

import 'package:dio/dio.dart';
import 'package:getxexample/Model/userList.dart';
import 'package:getxexample/network/urls.dart';

class PageApiService{
  Dio _dio=Dio(); // Dio instance to perform HTTP requests.
  final String _url = userpage;

  Future<List<Users>?>getAlldatas({int? page, int? limit})async{
try{
  Response response=await _dio.get(_url,
    queryParameters: {
    'page':page,
    'limit':limit
    }
  );
  if(response.statusCode==200){
    print('getresponse... ${response.data}');

    return List<Users>.from(response.data.map((e) => Users.fromJson(e)));

    // return List<User>.from(data.map((e) => User.fromJson(e)));

  }
  else{

    print("not success");
  }


}catch (e) {
  // If any exception occurs during the API call, throw an exception with the error message.
  throw Exception('An error occurred: $e');
}



  }


}