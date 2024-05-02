
import 'dart:async';

import 'package:get/get.dart';
import 'package:getxexample/Model/movieResponse.dart';

import '../network/userRepository.dart';

class UserController extends GetxController{
  final UserRepository _userRepository = UserRepository();// Use GetX's Get.find() to get the UserRepository instance.

  final RxList<Superheros> users = <Superheros>[].obs;
  RxBool isloading=false.obs;


  bool _loading = false;
  String _errorMessage = '';


  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    isloading.value=true;
    _errorMessage = '';

    try {

     final data  =await _userRepository.getUsers();
     if(data !=null){
       Timer(Duration(seconds: 3), () {
         print("Yeah, this line is printed after 3 seconds");
         users.value=data.superheros ?? [];
         isloading.value=false;
       });


     }


    } catch (e) {
      _errorMessage = 'Failed to fetch users';
    } finally {
      _loading = false;
      update(); // Use GetX's update() to notify listeners of data change.
    }
  }




}