import 'package:asflutter/SecondRoute.dart';
import 'package:flutter/material.dart';
import 'SecondRoute.dart';
import 'dart:ui';
class formRegistrasi extends StatefulWidget {
  const formRegistrasi({Key? key}) : super(key: key);

  @override
  State<formRegistrasi> createState() => _formRegistrasiState();
}

class _formRegistrasiState extends State<formRegistrasi> {
  TextEditingController ctrUsername = new TextEditingController();
  TextEditingController ctrPassword = new TextEditingController();
  int id = 1;
  String myPhone= "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("formRegistrasi"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Silahkan Daftar",
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: ctrUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
                hintText: "Masukan Nama",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: ctrPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "masukan Password",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pilih jenis kelamin anda",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (value) {
                    setState(() {
                      id = 1;
                    });
                  },
                ),
                Text("Laki-Laki"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (value) {
                    setState(() {
                      id = 2;
                    });
                  },
                ),
                Text("Perempuan"),
              ],
            ),
            Text("Phone : "+myPhone),
            ElevatedButton(onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
               print("hasil input phone number : "+ result.toString());
               setState(() {
                 myPhone = result.toString();
               });

            }, child: Text("Phone Number")),
            Center(
              child: Container(
                width: 200,
                child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

