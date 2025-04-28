import 'package:flutter/material.dart';

class DetailPiket extends StatelessWidget {
  final String nama;
  final String tugas;
  final String tanggal;

  const DetailPiket({super.key,
  required this.nama,
  required this.tugas,
  required this.tanggal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $tugas'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170,
                  height: 50,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text('$tanggal'),
                ),
                Container(
                  width: 170,
                  height: 50,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text('$nama'),
                )
              ],
            ),
            Column(
              children: [
                
              ],
            )
          ],
        ),),
    );
  }
}