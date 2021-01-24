import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController namakain = TextEditingController();
  TextEditingController banyakkain = TextEditingController();
  String _bahan;
  List _jenis = ["KATUN", "SATIN", "CELANA"];

  void simpanData() {
    Navigator.pop(context, {
      'kain': namakain.text,
      'qty': banyakkain.text,
      'jenis': _bahan != null ? _bahan : 'jenis Kosong'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("pembeli"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: banyakkain,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "banyak meter",
                  labelText: "banyak",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  )),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: namakain,
              decoration: new InputDecoration(
                  hintText: "kategori",
                  labelText: "pakain",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            Row(
              children: <Widget>[
                new Text(
                  "jenis   : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                DropdownButton(
                  items: _jenis.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _bahan = value;
                    });
                  },
                  value: _bahan,
                  hint: Text('Pilih'),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.green,
                  textColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: Text("SIMPAN"),
                  onPressed: () {
                    simpanData();
                  },
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('BATAL'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
