import 'package:flutter/material.dart';

class Detailcust extends StatefulWidget {
  final String namaCust;
  final String emailCust;
  final String noHpCust;
  final String alamatCust;
  final String provinsiCust;
  final String kodeposCust;
  
  const Detailcust({super.key,
  required this.namaCust,
  required this.emailCust,
  required this.noHpCust,
  required this.alamatCust,
  required this.provinsiCust,
  required this.kodeposCust,
  });

  @override
  State<Detailcust> createState() => _DetailcustState();
}

class _DetailcustState extends State<Detailcust> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${widget.namaCust}'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
    );
  }
}