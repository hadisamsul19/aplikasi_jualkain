import 'package:flutter/material.dart';

class EditList extends StatefulWidget {
  final String oldkain;
  final String oldbanyak;
  final String oldjenis;

  const EditList({Key key, this.oldkain, this.oldbanyak, this.oldjenis})
      : super(key: key);

  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  TextEditingController txtkain;
  TextEditingController txtbanyak;

  String _bahan;
  String odl;
  void oldData() {
    txtkain = TextEditingController(text: widget.oldkain);
    txtbanyak = TextEditingController(text: widget.oldbanyak);

    odl = widget.oldjenis;
  }

  List _jenis = ["KATUN", "SATIN", "CELANA"];

  void simpanData() {
    Navigator.pop(context, {
      'kain': txtkain.text,
      'qty': txtbanyak.text,
      'jenis': _bahan == null ? odl : _bahan
    });
  }

  @override
  void initState() {
    super.initState();
    oldData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data kain terjual"),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(20),
        )),
        child: Column(
          children: [
            TextField(
              controller: txtbanyak,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "JUMLAH",
                  labelText: "banyak  meter",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: txtkain,
              decoration: new InputDecoration(
                  hintText: "kain",
                  labelText: "judul kain",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            Row(
              children: <Widget>[
                new Text(
                  "jenis   : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.yellow),
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
                  hint: Text((odl == null) ? 'Pilih' : '$odl'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    simpanData();
                  },
                  child: Text('Simpan'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
