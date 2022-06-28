import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hveflutter/show_data_with_model.dart';

import 'constant.dart';
import 'person_model.dart';
import 'second_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController str1 = TextEditingController();
  TextEditingController str2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: str1,
            ),
            TextField(
              controller: str2,
            ),
            TextButton(
                child: Text("go to second screen"),
                onPressed: () {
                  // passdata(context);
                  addDataWithModel();
                })
          ],
        ),
      ),
    );
  }

  void passdata(BuildContext context) {
    var mybox = Hive.box(myBox1);
    mybox.add({
      "fstr1": str1.text,
      "fstr2": str2.text,
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondPage()));
  }



  void addDataWithModel() {
    var box = Hive.box<Person>(myBox2);

    box.add(Person(name: str1.text, lname: str2.text));

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HiveWithModel()));
  }

}
