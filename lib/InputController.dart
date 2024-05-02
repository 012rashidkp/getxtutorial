import 'package:get/get.dart';
import 'package:getxexample/repository/box_repository.dart';
import 'package:hive/hive.dart';

import 'Model/persons.dart';
class InputController extends GetxController{
  RxString name=''.obs;
  RxString age=''.obs;
  RxBool isvalidated=false.obs;





  void addName({String? pname}){
    name.value=pname ?? '';
  }

  void addAge({String? page}){
    age.value=page ?? '';
  }

  void clearfields(){
    name.value='';
    age.value='';
  }

  bool validated(){
   if(name.value.isNotEmpty){

     return true;
   }
   if(age.value.isNotEmpty){

     return true;
   }

   return false;

  }






}