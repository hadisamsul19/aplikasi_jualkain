import 'package:flutter/material.dart';
import 'package:jualkain/edit_list.dart';
import 'package:jualkain/read_data.dart';
import 'package:jualkain/tambah_data.dart';

class ApkHome extends StatefulWidget {
  @override
  _ApkHomeState createState() => _ApkHomeState();
}

class _ApkHomeState extends State<ApkHome> {
  List<Map<String, dynamic>> dataBase = List();

  void tambahData() async {
    final hasil = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TambahData()));
    if (hasil != null) {
      dataBase.add({
        'kain': hasil['kain'],
        'qty': hasil['qty'],
        'jenis': hasil['jenis']
      });
      setState(() {});
    }
  }

  void editData(int indek) async {
    final old = dataBase[indek];
    final edit = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditList(
                  oldkain: old['kain'],
                  oldbanyak: old['qty'],
                  oldjenis: old['jenis'],
                )));
    if (edit != null) {
      dataBase.remove(old);
      dataBase.insert(indek, {
        'kain': edit['kain'],
        'qty': edit['qty'],
        'jenis': edit['jenis'],
      });
      setState(() {});
    }
  }

  void readData(int indek) {
    final old = dataBase[indek];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReadData(
                  rkain: old['kain'],
                  rqty: old['qty'],
                  rjenis: old['jenis'],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Penjualan kain'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          tambahData();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: dataBase.length,
          itemBuilder: (context, i) {
            final data = dataBase[i];
            return Container(
              width: 150,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2), spreadRadius: 1, blurRadius: 3)
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 2, color: Colors.white))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.yellowAccent,
                            ),
                            onPressed: () {
                              editData(i);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.read_more,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              readData(i);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                dataBase.removeAt(i);
                              });
                            }),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2, color: Colors.white),
                          ),
                        ),
                        child: Text(
                          data['kain'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data['qty'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              data['jenis'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
