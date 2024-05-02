import 'package:flutter/material.dart';
import 'package:getxexample/Model/persons.dart';
import 'package:getxexample/Routes/routes.dart';
import 'package:getxexample/repository/box_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 // if(!Hive.isAdapterRegistered(PersonAdapter().typeId)) {
 //
 //
 //  }
  Hive.registerAdapter(PersonAdapter());
  await Hive.openBox<Person>('persons');
  // await BoxRepository.openBox();
  runApp( MaterialApp.router(
    routerConfig: router,
    debugShowCheckedModeBanner: false,
  )

  );
}


