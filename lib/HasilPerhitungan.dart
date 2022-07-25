import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HasilPerhitungan extends StatefulWidget {
  const HasilPerhitungan({Key? key}) : super(key: key);

  @override
  State<HasilPerhitungan> createState() => _HasilPerhitunganState();
}


class _HasilPerhitunganState extends State<HasilPerhitungan> {
  TextEditingController ctrAlas = new TextEditingController();
  TextEditingController ctrTinggi = new TextEditingController();
  TextEditingController ctrHasil = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Luas Seigitiga"),),
      body: Container(
        margin:EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            TextField(
              keyboardType: TextInputType.number,
              // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: ctrAlas,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan panjang alas segitiga',
              ),
            ),
            Container(height: 20 ,),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: ctrTinggi,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan tinggi segitiga',
              ),
            ),
            SizedBox(height: 10,),
            Center (
                child:Container(
                  width:200,
                  child:ElevatedButton(onPressed: (){
                    setState(() {
                      if (ctrAlas.text.isNotEmpty && ctrTinggi.text.isNotEmpty) {
                        ctrHasil.text =
                            (0.5 * double.parse(ctrAlas.text) * double.parse(ctrTinggi.text)).toString();
                      }else{
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Masukan Nilai Alas Dan Tinggi",
                          buttons: [
                        DialogButton(
                        child: Text(
                        "Selanjutnya",
                          style: TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      onPressed: () => Navigator.pop(context),
                      )
                      ],
                      ).show();
                        return;
                    }
                    });
                  },
                      child: Text("Submit")),

                )
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Hasil : ${ctrHasil.text}cm", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.black,),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
