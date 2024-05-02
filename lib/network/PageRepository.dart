import 'package:getxexample/network/pageApiservice.dart';

import '../Model/userList.dart';

class PageRepository{
  final PageApiService service=PageApiService();


  Future<List<Users>?> getAllusers({int? page, int? limit}) async {
    try {
      final data = await service.getAlldatas(page: page,limit: limit);

      return data;
    } catch (e) {
      print('myresponse... error');
      throw Exception('Failed to fetch users');
    }
  }



}