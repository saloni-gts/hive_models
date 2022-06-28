import 'package:hive/hive.dart';
part 'person_model.g.dart';




@HiveType(typeId: 1)
class Person{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String lname;
  Person({required this.name, required this.lname});
}
