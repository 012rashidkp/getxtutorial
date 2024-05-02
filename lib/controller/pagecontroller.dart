
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getxexample/Model/userList.dart';
import 'package:getxexample/network/PageRepository.dart';

class PageListController extends GetxController{
final PageRepository repository=PageRepository();
final int _limit = 15;
int _page = 1;
RxBool hasMore = true.obs;
RxList<Users> users = <Users>[].obs;

Future getAllusers() async {
  try {
    List<Users>? response = await repository.getAllusers(page: _page,limit:_limit);
    if (response!.length < _limit) {
      hasMore.value = false;
    }

    users.addAll(response);
    _page++;
  } catch (e) {
    if (kDebugMode) print(e.toString());
  }
}

Future refreshData() async {
  _page = 1;
  hasMore.value = true;
  users.value = [];

  await getAllusers();
}






}