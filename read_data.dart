import 'dart:io';

import 'package:flutter/material.dart';

class ReadData extends StatelessWidget {
  final String rkain;
  final String rqty;
  final String rjenis;
  final File gambar;

  const ReadData(
      {Key key, this.rkain, this.rqty, this.rjenis, this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Data jual kain"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('nama produk : ' +
                rkain +
                ' jumlah kain  : ' +
                rqty +
                ' jenis : ' +
                rjenis),
          ],
        ),
      ),
    );
  }
}
