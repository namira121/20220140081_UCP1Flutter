import 'package:flutter/material.dart';

class DetailorderPage extends StatelessWidget {
  final String tgltransaksi;
  final String jenistransaksi;
  final String jenisbarang;
  final String jumlahbarang;
  final String harga;
  final String email;

  const DetailorderPage({super.key,
  required this.tgltransaksi,
  required this.jenistransaksi,
  required this.jenisbarang,
  required this.jumlahbarang,
  required this.harga,
  required this.email});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}