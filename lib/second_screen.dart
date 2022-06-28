import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'constant.dart';
import 'person_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage> {
  var finvar=[];
  @override
  void initState() {
    // getdata();
    getDataWithModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Second Screen "
          ),
        ),
        body:Center(
          child: ListView.builder(
              itemCount: finvar.length,
              itemBuilder: ( context,index){
                return ListTile(
                  title: Text(
                      finvar[index]['name']

                  ),
                  subtitle: Text(
                      finvar[index]['lname']
                  ),
                );

              }),
        )
    );
  }
  getdata(){

    var box=Hive.box(myBox1);
    //   var box5=Hive.box("mybox");
    finvar=box.values.toList();
    setState((){

    });
  }

  void getDataWithModel() {
    var box = Hive.box<Person>(myBox2);
    var userData = box.get(myBox2);
    finvar=box.values.toList();
  }
}
