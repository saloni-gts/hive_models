import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './show_data_with_model.dart';
import 'constant.dart';
import 'first_screen.dart';
import 'person_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  await Hive.openBox(myBox);
  await Hive.openBox(myBox1);
  await Hive.openBox<Person>(myBox2);
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
