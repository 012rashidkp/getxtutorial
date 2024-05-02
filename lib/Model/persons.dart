


import 'package:hive_flutter/adapters.dart';

part 'persons.g.dart';


@HiveType(typeId:0)
class Person {
  @HiveField(0)
 final  String? name;
  @HiveField(1)
 final String? age;

  Person(this.name, this.age);
}