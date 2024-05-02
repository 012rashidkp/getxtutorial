import 'package:getxexample/Model/persons.dart';
import 'package:hive/hive.dart';

class BoxRepository{
  // static const String boxName='persons';
  //


  Future<void>addperson({Person? value}) async{
    final persondb=await Hive.box<Person>('persons');
    persondb.add(value!);
  }

  Future<List<Person>> getAllPersons() async {
    //final persondb = await Hive.openBox('persons');
    final persondb   = Hive.box<Person>("persons");
    List<Person> _person = [];
    print('persons... ${persondb.values}');

    // Type checking (assuming Person is the correct type)
    final personList = persondb.values.toList().cast<Person>();

    // Null handling (optional)
    final filteredList = personList.where((person) => person != null).toList();
    _person.clear();
    _person.addAll(filteredList);

    return _person;
  }

  Future<void>updatedata({required int index, required Person data})async{
    final persondb = await Hive.box<Person>('persons');
    persondb.putAt(index??0, data);
  }

  Future<void>delete({required int index})async{
    print('index... ${index}');
    final persondb = await Hive.box<Person>('persons');
    persondb.deleteAt(index);
  }





  // static openBox()async=>await Hive.openBox<Person>(boxName);
  //
  //
  // static Box? getBox()=>Hive.box<Person>(boxName);
  //
  //
  //
  //
  // static closeBox()async=>await Hive.box(boxName).close();




}