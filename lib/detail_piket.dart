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
        title: Text('Detail ${tugas}'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
    );
  }
}