import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hveflutter/constant.dart';

import 'person_model.dart';


class HiveWithModel extends StatefulWidget {
  const HiveWithModel({Key? key}) : super(key: key);

  @override
  State<HiveWithModel> createState() => _HiveWithModelState();
}

class _HiveWithModelState extends State<HiveWithModel> {


  List<Person> _personList = [];

  @override
  void initState() {
    getDataPerson();
    super.initState();
  }


  getDataPerson(){
    var box = Hive.box<Person>(myBox2);

    _personList = box.values.toList();

    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "hive and modals"
        ),
      ),
      body: ListView.builder(
        itemCount: _personList.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text
            (_personList[index].name),
          subtitle: Text(
            _personList[index].lname
          ),
        );
      },),

    );
  }
}

