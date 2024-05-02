
import 'package:get/get.dart';
import 'package:getxexample/Model/persons.dart';
import 'package:getxexample/Routes/routeNames.dart';
import 'package:getxexample/Utility/colors.dart';
import 'package:getxexample/repository/box_repository.dart';
import 'package:hive/hive.dart';
final personcontroller=Get.put(PersonController());
class PersonController extends GetxController{
  final repository=BoxRepository();
  final RxList<Person> persons = <Person>[].obs;
  RxString edtname=''.obs;
  RxString edtage=''.obs;
  RxInt edtindex=0.obs;



  Future<void>addperson({Person? data})async{
    repository.addperson(value: data);
    update();

   // Get.snackbar('success', 'Added successfully',backgroundColor: tealcolor);
  }

  void getAllpersons()async{
   persons.value= await repository.getAllPersons();

   update();
  }
  void remove({required int index})async{
    print('persons... ${index}');
   await repository.delete(index: index);
   getAllpersons();
   update();
  }
  void updatedata({required int index, required Person data})async{
    await repository.updatedata(index: index, data: data);
    getAllpersons();
    update();
  }

  void updatedetails({int? index, String? name,String? age}){
    edtname.value=name??'';
    edtage.value=age??'';
    edtindex.value=index??0;
    update();
  }





}