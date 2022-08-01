import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  TextEditingController ctrPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Second Rouge"),),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
      margin: EdgeInsets.all(10),
      child: Column(
      children: [
      TextField(
      keyboardType: TextInputType.number,
      controller: ctrPhone,
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Input Nomer',
      ),
      ),
      ElevatedButton(onPressed: () {
        Navigator.pop(context, ctrPhone.text);
      }, child: Text("Submit"))
]
),
),
    ),
    );
  }
}
